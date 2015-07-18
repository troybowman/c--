%code top {
#define YYDEBUG 1
class parser_ctx_t;
#include "parser.hpp"
#include "scanner.hpp"
#include <logger.h>
}

%code requires {
#include <parser.h>
}

%{
//---------------------------------------------------------------------------
struct scanner_t
{
  // should be 'yyscan_t' instead of 'void *', but this would cause a circular
  // dependency between scanner.hpp and parser.hpp. This workaround should do
  // fine, because anyways yyscan_t is an opaque c type.
  void *yyscan;

  scanner_t(FILE *in)
  {
    yylex_init(&yyscan);
    yyset_in(in, yyscan);
  }

  ~scanner_t()
  {
    yylex_destroy(yyscan);
  }
};

//---------------------------------------------------------------------------
class parser_ctx_t : public parse_results_t
{
  int mode;
#define CTX_GLOBAL 0
#define CTX_LOCAL  1
#define CTX_TEMP   2
  union
  {
    // pointer to currently active symbol table
    symtab_t *syms;
    // pointer to function we are currently parsing
    usymref_t sym;
  };

public:
  parser_ctx_t() : mode(CTX_GLOBAL), syms(&gsyms) {}
  ~parser_ctx_t() { clear(); }

  void clear()
  {
    if ( mode == CTX_LOCAL )
      func().~symref_t();
  }
  void trash()
  {
    if ( mode == CTX_TEMP )
      delete syms;
    setglobal();
  }
  void setglobal()          { clear(); mode = CTX_GLOBAL; syms = &gsyms; }
  void setlocal(symref_t f) { clear(); mode = CTX_LOCAL;  putref(sym, f); }
  void settemp()            { clear(); mode = CTX_TEMP;   syms = new symtab_t; }
  symref_t &func()    const { return getref(sym); }
  void insert(symref_t sym)
  {
    if ( mode == CTX_GLOBAL || mode == CTX_TEMP )
      syms->insert(sym);
    else
      func()->symbols()->insert(sym);
  }
  symref_t get(const std::string &key) const
  {
    return mode == CTX_GLOBAL || mode == CTX_TEMP
         ? syms->get(key)
         : func()->symbols()->get(key);
  }

  // built-in print functions
  symref_t print_string;
  symref_t print_int;
  symref_t print_char;
  symref_t print_hex;
};

//---------------------------------------------------------------------------
static       void  process_var_list   (parser_ctx_t &, symvec_t *, primitive_t);
static       void  process_func_list  (parser_ctx_t &, symvec_t *, primitive_t, bool);
static       bool  process_var_decl   (parser_ctx_t &, symref_t, primitive_t);
static   symref_t  process_stmt_id    (parser_ctx_t &, const char *, int);
static treenode_t *process_stmt_var   (parser_ctx_t &, symref_t, treenode_t *, int);
static treenode_t *process_call       (parser_ctx_t &, symref_t, treenode_t *, int);
static treenode_t *process_assg       (parser_ctx_t &, treenode_t *, treenode_t *, int);
static treenode_t *process_call_ctx   (parser_ctx_t &, treenode_t *, int, bool);
static treenode_t *process_ret_stmt   (parser_ctx_t &, treenode_t *expr, int line);
static treenode_t *process_bool_expr  (parser_ctx_t &, treenode_t *, treenode_type_t, treenode_t *, int);
static treenode_t *process_if_stmt    (parser_ctx_t &, treenode_t *, treenode_t *, treenode_t *, int);
static treenode_t *process_while_stmt (parser_ctx_t &, treenode_t *, treenode_t *, int);
static treenode_t *process_for_stmt   (parser_ctx_t &, treenode_t *, treenode_t *, treenode_t *, treenode_t *, int);
static treenode_t *process_math_expr  (parser_ctx_t &, treenode_t *, treenode_type_t, treenode_t *, int);
static terr_info_t process_array_sfx  (parser_ctx_t &, int, int);
static       void  process_fdecl_error(parser_ctx_t &, terr_info_t, const symbol_t &);
static   symref_t  process_var_id(const char *, int, terr_info_t, uint32_t);

//---------------------------------------------------------------------------
static void func_enter(parser_ctx_t &ctx, symref_t f, primitive_t rt);
static void func_leave(parser_ctx_t &ctx, treenode_t *);

//---------------------------------------------------------------------------
static symvec_t *sym_list_append(symvec_t *, symref_t);
static symvec_t *sym_list_prepend(symref_t, symvec_t *);
static symvec_t *process_param_list(symref_t, symvec_t *, symref_t);

//---------------------------------------------------------------------------
static    symref_t yygetsym(const usymref_t &);
static terr_info_t yygeterr(const uterr_info_t &);
static        void yyputsym(usymref_t, symref_t);
static        void yyputerr(uterr_info_t, terr_info_t);

//---------------------------------------------------------------------------
#define EMPTYSTRING "\"\""
#define FMTS 's' // %s for strings
#define FMTD 'd' // %d for decimal ints
#define FMTC 'c' // %c for chars
#define FMTX 'x' // %x for hex ints
struct format_arg_t
{
  symref_t func;
  const treenode_t *expr;

  format_arg_t(symref_t _func, const treenode_t *_expr)
    : func(_func), expr(_expr) {}
};
typedef std::vector<format_arg_t> format_args_t;

//---------------------------------------------------------------------------
#define MAXERRLEN 1024
static void usererr(parser_ctx_t &ctx, const char *format, ...);
int yyerror(void *scanner, parser_ctx_t &ctx, const char *s);

//---------------------------------------------------------------------------
#define lineno yyget_lineno(scanner)
%}

/*---------------------------------------------------------------------------*/
%define api.pure full
%lex-param   { void *scanner }
%parse-param { void *scanner }
%parse-param { parser_ctx_t &ctx }

/*---------------------------------------------------------------------------*/
%union
{
  int i;
  char *str;
  primitive_t prim;
  symvec_t *symvec;
  treenode_t *tree;
  symtab_t *symtab;
  seq_t seq;
  uterr_info_t asfx;
  usymref_t sym;
  name_info_t ni;
}

%token<i>   INT
%token<str> CHAR STRING ID MAIN PRINTF

%token INT_TYPE CHAR_TYPE VOID
%token WHILE RETURN EXTERN IF ELSE FOR
%token EQ NEQ LEQ GEQ AND OR ELLIPSIS
%token SHL SHR

%type<prim>   type
%type<sym>    var_decl func_decl param_decl ellipsis
%type<symvec> var_decls var_decl_list func_decls func_decl_list params param_decl_list
%type<tree>   func_body stmt stmt_var stmt_array_sfx expr call args op_expr else assg op_assg
%type<asfx>   decl_array_sfx param_array_sfx
%type<seq>    stmts arg_list assg_list
%type<ni>     name

%destructor { free($$); } ID MAIN PRINTF
%destructor { free($$.str); } name
%destructor { delete $$; ctx.trash(); } params
%destructor { delete $$; } var_decls func_decls var_decl_list func_decl_list param_decl_list
%destructor { yygetsym($$); } var_decl func_decl ellipsis param_decl
%destructor { delete $$; } stmt_var

/*---------------------------------------------------------------------------*/
/* precedence increases as we go down the list */
%left OR
%left AND
%left '|'
%left '^'
%left '&'
%left NEQ EQ
%left GEQ '>' LEQ '<'
%left SHL SHR
%left '-' '+'
%left '/' '*'
%right UNARY

%start prog

%%

/*---------------------------------------------------------------------------*/
prog : prog decl  ';'
     | prog error ';' { yyerrok; }
     | prog func
     | /* empty */
     ;

/*---------------------------------------------------------------------------*/
decl :        type var_decls  { process_var_list (ctx, $2, $1);        delete $2; }
     |        type func_decls { process_func_list(ctx, $2, $1, false); delete $2; }
     | EXTERN type func_decls { process_func_list(ctx, $3, $2, true);  delete $3; }
     ;

type : INT_TYPE  { $$ = PRIM_INT;  }
     | CHAR_TYPE { $$ = PRIM_CHAR; }
     | VOID      { $$ = PRIM_VOID; }
     ;

/*---------------------------------------------------------------------------*/
var_decls : var_decl var_decl_list { $$ = sym_list_prepend(yygetsym($1), $2); }
          ;

var_decl : name decl_array_sfx
           {
             symref_t ref = process_var_id($1.str, lineno, yygeterr($2), 0);
             yyputsym($$, ref);
             free($1.str);
           }
         ;

decl_array_sfx : '[' INT ']' { yyputerr($$, process_array_sfx(ctx, $2, lineno)); }
               | /* empty */ { yyputerr($$, terr_info_t(TERR_OK)); }
               ;

var_decl_list : var_decl_list ',' var_decl { $$ = sym_list_append($1, yygetsym($3)); }
              | /* empty */                { $$ = NULL; }
              ;

/*---------------------------------------------------------------------------*/
func_decls : func_decl func_decl_list { $$ = sym_list_prepend(yygetsym($1), $2); }
           ;

func_decl : name '(' { ctx.settemp(); } params { ctx.trash(); } ')'
            {
              symref_t func(new symbol_t($1.flags, $1.str, lineno, $4));
              yyputsym($$, func);
              free($1.str);
            }
            /* TODO: functions with no parameter spec (i.e. 'int func();') will leak memory,
               unless we explicity handle it here. Try to put this logic in a destructor. */
          | name '(' error { free($1.str); ctx.trash(); yyputsym($$, NULLREF); }
          ;

name : MAIN   { $$.str = $1; $$.flags = SF_MAIN; }
     | PRINTF { $$.str = $1; $$.flags = SF_PRINTF; }
     | ID     { $$.str = $1; $$.flags = 0; }
     ;

func_decl_list : func_decl_list ',' func_decl { $$ = sym_list_append($1, yygetsym($3)); }
               | /* empty */                  { $$ = NULL; }
               ;

/*---------------------------------------------------------------------------*/
params : param_decl param_decl_list ellipsis
         {
           $$ = process_param_list(yygetsym($1), $2, yygetsym($3));
         }
       | VOID { $$ = new symvec_t; }
       ;

ellipsis : ',' ELLIPSIS { yyputsym($$, symref_t(new symbol_t(ST_ELLIPSIS))); }
         | /* empty */  { yyputsym($$, NULLREF); }
         ;

param_decl : type name param_array_sfx
             {
               symref_t sym = process_var_id($2.str, lineno, yygeterr($3), SF_PARAMETER);
               if ( sym != NULL && !process_var_decl(ctx, sym, $1) )
                 sym = NULLREF;
               yyputsym($$, sym);
               free($2.str);
             }
           ;

param_array_sfx : '[' ']'     { yyputerr($$, terr_info_t(TERR_OK2, BADOFFSET)); }
                | /* empty */ { yyputerr($$, terr_info_t(TERR_OK)); }
                ;

param_decl_list : param_decl_list ',' param_decl { $$ = sym_list_append($1, yygetsym($3)); }
                | /* empty */                    { $$ = NULL; }
                ;

/*---------------------------------------------------------------------------*/
func : type func_decl
       '{'
          { func_enter(ctx, yygetsym($2), $1); }
          func_body
          { func_leave(ctx, $5); }
       '}'
     | error '{' { yyerrok; }
     | error '}' { yyerrok; }
     ;

func_body : local_decls stmts { $$ = $2.head; }
          ;

local_decls : local_decls type var_decls ';' { process_var_list(ctx, $3, $2); delete $3; }
            | local_decls error          ';' { yyerrok; } /* TODO: this handles errors in statements as well */
            | /* empty */
            ;

stmts : stmts stmt  { $$ = seq_append($1, $2, TNT_STMT); }
      | /* empty */ { $$.head = $$.tail = NULL; }
      ;

/*---------------------------------------------------------------------------*/
stmt : assg ';'                  { $$ = $1; }
     | call ';'                  { $$ = process_call_ctx(ctx, $1, lineno, false); }
     | RETURN op_expr ';'        { $$ = process_ret_stmt(ctx, $2, lineno); }
     | IF '(' expr ')' stmt else { $$ = process_if_stmt(ctx, $3, $5, $6, lineno); }
     | WHILE '(' expr ')' stmt   { $$ = process_while_stmt(ctx, $3, $5, lineno); }
     | FOR '(' op_assg ';' op_expr ';' op_assg ')' stmt
                                 { $$ = process_for_stmt(ctx, $3, $5, $7, $9, lineno); }
     | '{' stmts '}'             { $$ = $2.head; }
     | ';'                       { $$ = NULL; }
     ;

/*---------------------------------------------------------------------------*/
op_assg : assg assg_list
          {
            $$ = $2.head == NULL ? $1 : new treenode_t(TNT_STMT, $1, $2.head);
          }
        | /* empty */ { $$ = NULL; }
        ;

assg_list : assg_list ',' assg { $$ = seq_append($1, $3, TNT_STMT); }
          | /* empty */        { $$.head = $$.tail = NULL; }
          ;

else : ELSE stmt      { $$ = $2; }
     | /* empty */    { $$ = NULL; }
     ;

op_expr : expr        { $$ = $1; }
        | /* empty */ { $$ = NULL; }
        ;

/*---------------------------------------------------------------------------*/
assg : stmt_var '=' expr { $$ = process_assg(ctx, $1, $3, lineno); }
     ;

/*---------------------------------------------------------------------------*/
call : name '(' args ')'
       {
         symref_t sym = process_stmt_id(ctx, $1.str, lineno);
         $$ = sym != NULL
            ? process_call(ctx, sym, $3, lineno)
            : ERRNODE;
         free($1.str);
       }
     ;

args : expr arg_list
       {
         // append arg_list to 1st arg
         treenode_t *first = new treenode_t(TNT_ARG, $1, NULL);
         if ( $2.head != NULL )
           first->children[SEQ_NEXT] = $2.head;
         $$ = first;
       }
     | /* empty */ { $$ = NULL; }
     ;

arg_list : arg_list ',' expr { $$ = seq_append($1, $3, TNT_ARG); }
         | /* empty */       { $$.head = $$.tail = NULL; }
         ;

/*---------------------------------------------------------------------------*/
stmt_var : name stmt_array_sfx
           {
             symref_t sym = process_stmt_id(ctx, $1.str, lineno);
             $$ = sym != NULL
                ? process_stmt_var(ctx, sym, $2, lineno)
                : ERRNODE;
             free($1.str);
           }
         ;

stmt_array_sfx : '[' expr ']' { $$ = $2; }
               | /* empty */  { $$ = NULL; }
               ;

/*---------------------------------------------------------------------------*/
expr : INT                  { $$ = new treenode_t(TNT_INTCON, $1); }
     | CHAR                 { $$ = new treenode_t(TNT_CHARCON, $1); }
     | STRING               { $$ = new treenode_t(TNT_STRCON, $1); }
     | call                 { $$ = process_call_ctx(ctx, $1, lineno, true); }
     | stmt_var             { $$ = $1; }
     | expr EQ  expr        { $$ = process_bool_expr(ctx, $1,   TNT_EQ,    $3, lineno); }
     | expr NEQ expr        { $$ = process_bool_expr(ctx, $1,   TNT_NEQ,   $3, lineno); }
     | expr '<' expr        { $$ = process_bool_expr(ctx, $1,   TNT_LT,    $3, lineno); }
     | expr LEQ expr        { $$ = process_bool_expr(ctx, $1,   TNT_LEQ,   $3, lineno); }
     | expr '>' expr        { $$ = process_bool_expr(ctx, $1,   TNT_GT,    $3, lineno); }
     | expr GEQ expr        { $$ = process_bool_expr(ctx, $1,   TNT_GEQ,   $3, lineno); }
     | expr AND expr        { $$ = process_bool_expr(ctx, $1,   TNT_AND,   $3, lineno); }
     | expr OR  expr        { $$ = process_bool_expr(ctx, $1,   TNT_OR,    $3, lineno); }
     | expr '+' expr        { $$ = process_math_expr(ctx, $1,   TNT_PLUS,  $3, lineno); }
     | expr '-' expr        { $$ = process_math_expr(ctx, $1,   TNT_MINUS, $3, lineno); }
     | expr '*' expr        { $$ = process_math_expr(ctx, $1,   TNT_MULT,  $3, lineno); }
     | expr '/' expr        { $$ = process_math_expr(ctx, $1,   TNT_DIV,   $3, lineno); }
     | expr SHL expr        { $$ = process_math_expr(ctx, $1,   TNT_SHL,   $3, lineno); }
     | expr SHR expr        { $$ = process_math_expr(ctx, $1,   TNT_SHR,   $3, lineno); }
     | expr '^' expr        { $$ = process_math_expr(ctx, $1,   TNT_XOR,   $3, lineno); }
     | expr '&' expr        { $$ = process_math_expr(ctx, $1,   TNT_BAND,  $3, lineno); }
     | expr '|' expr        { $$ = process_math_expr(ctx, $1,   TNT_BOR,   $3, lineno); }
     | '!' expr %prec UNARY { $$ = process_bool_expr(ctx, NULL, TNT_NOT,   $2, lineno); }
     | '-' expr %prec UNARY { $$ = process_math_expr(ctx, NULL, TNT_NEG,   $2, lineno); }
     | '~' expr %prec UNARY { $$ = process_math_expr(ctx, NULL, TNT_BNOT,  $2, lineno); }
     | '(' expr ')'         { $$ = $2; }
     ;

%%

//-----------------------------------------------------------------------------
static symref_t process_var_id(const char *name, int line, terr_info_t asfx, uint32_t flags)
{
  switch ( asfx.code )
  {
    case TERR_OK:  return symref_t(new symbol_t(flags, name, line));
    case TERR_OK2: return symref_t(new symbol_t(flags, name, line, asfx.data));
    default:       return NULLREF;
  }
}

//-----------------------------------------------------------------------------
static bool check_params(const symvec_t &p1, const symvec_t &p2)
{
  if ( p1.size() != p2.size() )
    return false;

  for ( symvec_t::const_iterator i1 = p1.begin(), i2 = p2.begin();
        i1 != p1.end() && i2 != p2.end();
        i1++, i2++ )
  {
    symref_t s1 = *i1;
    symref_t s2 = *i2;

    if ( s1->type() != s2->type() || s1->base() != s2->base() )
      return false;
  }
  return true;
}

//-----------------------------------------------------------------------------
static bool has_ellipsis(const symbol_t &f)
{
  return f.is_func()
      && f.params()->size() > 0
      && f.params()->back()->type() == ST_ELLIPSIS;
}

//-----------------------------------------------------------------------------
static type_error_t validate_func_def(const symbol_t &def, symref_t prev)
{
  if ( has_ellipsis(def) )
    return prev == NULL ? TERR_PRINTF_DEF1 : TERR_PRINTF_DEF2;

  if ( prev == NULL )
    return TERR_OK;

  ASSERT(1102, def.name() == prev->name());

  return !prev->is_func()                              ? TERR_REDECLARED
       :  prev->is_defined()                           ? TERR_REDEFINED
       :  prev->is_extern()                            ? TERR_EXTERN
       : !check_params(*prev->params(), *def.params()) ? TERR_PARAMS
       :  prev->base() != def.base()                   ? TERR_RTN_TYPES
       :                                                 TERR_OK2;
}

//-----------------------------------------------------------------------------
static void init_lsyms(symbol_t &f)
{
  symvec_t::const_iterator i;
  for ( i = f.params()->begin(); i != f.params()->end(); i++ )
  {
    ASSERT(1003, *i != NULL);
    f.symbols()->insert(*i);
  }
}

//-----------------------------------------------------------------------------
static void set_decl_srcinfo(symbol_t &f1, const symbol_t &f2)
{
  f1.set_line(f2.line());
  f1.set_base(f2.base());

  symvec_t &params1 = *f1.params();
  const symvec_t &params2 = *f2.params();

  symvec_t::iterator i = params1.begin();
  symvec_t::const_iterator j = params2.begin();

  for ( ; i != params1.end() && j != params2.end(); i++, j++ )
  {
    symbol_t &p1 = **i;
    const symbol_t &p2 = **j;

    p1.set_name(p2.c_str());
    p1.set_line(p2.line());
  }
}

//-----------------------------------------------------------------------------
static void func_enter(parser_ctx_t &ctx, symref_t f, primitive_t rt)
{
  ASSERT(1000, f != NULL);
  ASSERT(1004, f->is_func());

  f->set_base(rt);
  symref_t prev = ctx.gsyms.get(f->name());
  terr_info_t err(validate_func_def(*f, prev));

  switch ( err.code )
  {
    case TERR_OK:
      ctx.gsyms.insert(f);
      break;
    case TERR_PRINTF_DEF1:
      process_fdecl_error(ctx, err, *f);
      break;
    default:
      err.data = prev->line();
      process_fdecl_error(ctx, err, *f);
      // no break
    case TERR_OK2:
      if ( prev->is_func() )
      {
        set_decl_srcinfo(*prev, *f);
        f = prev;
      }
      break;
  }

  init_lsyms(*f);
  ctx.setlocal(f);
}

//-----------------------------------------------------------------------------
static void func_leave(parser_ctx_t &ctx, treenode_t *root)
{
  symref_t f = ctx.func();

  f->set_defined();

  if ( f->base() != PRIM_VOID && !f->is_ret_resolved() )
    usererr(ctx, "error: non-void funcion %s must return a value\n", f->c_str());

  ctx.trees.push_back(new stx_tree_t(f, root));

  ctx.setglobal();
}

//-----------------------------------------------------------------------------
static type_error_t validate_ret_stmt(const parser_ctx_t &ctx, const treenode_t *expr)
{
  if ( ctx.func()->base() == PRIM_VOID )
    return expr != NULL ? TERR_BAD_RET : TERR_OK;
  else
    return expr == NULL           ? TERR_NO_RET
         : !expr->is_int_compat() ? TERR_RET_EXPR
         :                          TERR_OK2;
}

//-----------------------------------------------------------------------------
static treenode_t *process_ret_stmt(parser_ctx_t &ctx, treenode_t *expr, int line)
{
  type_error_t err = validate_ret_stmt(ctx, expr);

  if ( err > TERR_OK2 )
  {
    switch ( err )
    {
      case TERR_NO_RET:
        usererr(ctx, "error: line %d - return statements in a non-void function "
                "must return a value\n", line);
        break;
      case TERR_BAD_RET:
        usererr(ctx, "error: line %d - return statements in a void function "
                "must not return a value\n", line);
        break;
      case TERR_RET_EXPR:
        usererr(ctx, "error: line %d - return value is not compatible "
                "with function's return type\n", line);
        break;
      default:
        INTERR(1036);
    }
    delete expr;
    return ERRNODE;
  }

  if ( err == TERR_OK2 )
    ctx.func()->set_ret_resolved();

  return new treenode_t(TNT_RET, expr);
}

//-----------------------------------------------------------------------------
static bool check_arg(const symbol_t &param, const treenode_t &expr)
{
  switch ( param.type() )
  {
    case ST_PRIMITIVE:
      return expr.is_int_compat();

    case ST_ARRAY:
      if ( expr.type() == TNT_STRCON )
      {
        return param.base() == PRIM_CHAR;
      }
      else if ( expr.type() == TNT_SYMBOL )
      {
        return expr.sym()->is_array()
            && expr.sym()->base() == param.base();
      }
      return false;

    default:
      INTERR(1031);
  }
}

//-----------------------------------------------------------------------------
static terr_info_t validate_call(const symbol_t &f, const treenode_t *args)
{
  if ( !f.is_func() )
    return TERR_NOFUNC;

  const symvec_t &params = *f.params();
  size_t nparams = params.size();
  size_t nargs   = calc_seq_len(args);

  if ( nparams != nargs )
    return terr_info_t(TERR_NUMARGS, nargs);

  const_tree_iterator_t ti(args);
  for ( size_t i = 0; *ti != NULL && i < nparams; ti++, i++ )
  {
    if ( !check_arg(*params[i], **ti) )
      return terr_info_t(TERR_BADARG, i+1);
  }

  return TERR_OK;
}

//-----------------------------------------------------------------------------
static void cleanup_fmtarg_list(treenode_t *root)
{
  treenode_t *fmt = root->children[SEQ_CUR];
  delete fmt;

  // trash the original linked list that contained the fmt args.
  // the args are now maintained by the TNT_PRINTF tree
  for ( treenode_t *ptr = root; ptr != NULL; ptr = ptr->children[SEQ_NEXT] )
    ptr->children[SEQ_CUR] = NULL;

  delete root;
}

//-----------------------------------------------------------------------------
static void prepare_substring_arg(
      const parser_ctx_t &ctx,
      format_args_t &fmtargs,
      const char *const start,
      const char *const end)
{
  int len = end - start;
  if ( len <= 0 )
    return;

  char *str = (char *)malloc(len+3);
  char *ptr = str;
  APPCHAR(ptr, '"', 1);
  APPSTR (ptr, start, len);
  APPCHAR(ptr, '"', 1);
  *ptr = '\0';

  treenode_t *node = new treenode_t(TNT_STRCON, str);
  fmtargs.push_back(format_arg_t(ctx.print_string, node));
}

//-----------------------------------------------------------------------------
static type_error_t handle_empty_fmt(
    const parser_ctx_t &ctx,
    format_args_t &fmtargs,
    const treenode_t *argtree)
{
  if ( calc_seq_len(argtree) > 0 )
    return TERR_NUM_FMT;

  treenode_t *node = new treenode_t(TNT_STRCON, strdup(EMPTYSTRING));
  fmtargs.push_back(format_arg_t(ctx.print_string, node));

  return TERR_OK;
}

//-----------------------------------------------------------------------------
static type_error_t validate_printf_call(
    const parser_ctx_t &ctx,
    format_args_t &fmtargs,
    const treenode_t *allargs)
{
  if ( allargs == NULL )
    return TERR_NO_FMT;

  if ( allargs->children[SEQ_CUR]->type() != TNT_STRCON )
    return TERR_FMTSTR;

  const char *fmt = allargs->children[SEQ_CUR]->str();
  if ( strcmp(fmt, EMPTYSTRING) == 0 ) // special case
    return handle_empty_fmt(ctx, fmtargs, allargs->children[SEQ_NEXT]);

  // ignore leading, trailing "
  fmt += 1;
  const char *ptr = fmt;
  const char *const end = fmt + strlen(fmt) - 1;
  const char *cursub = ptr;

  tree_iterator_t ti(allargs->children[SEQ_NEXT]);

  for ( ; ptr != end; ptr++ )
  {
    if ( *ptr == '%' && ptr+1 < end )
    {
      char c = *(ptr+1);

      if ( c == FMTS || c == FMTD || c == FMTC || c == FMTX )
      {
        prepare_substring_arg(ctx, fmtargs, cursub, ptr);
        cursub = ptr+2;

        const treenode_t *arg = *ti++;
        if ( arg == NULL )
          return TERR_NUM_FMT;

        symref_t func;
        bool ok = false;

        switch ( c )
        {
          case FMTD:
            ok = arg->is_int_compat();
            func = ctx.print_int;
            break;
          case FMTC:
            ok = arg->is_int_compat();
            func = ctx.print_char;
            break;
          case FMTX:
            ok = arg->is_int_compat();
            func = ctx.print_hex;
            break;
          case FMTS:
            ok = arg->is_string_compat();
            func = ctx.print_string;
            break;
        }

        if ( !ok )
          return TERR_BAD_FMT;

        fmtargs.push_back(format_arg_t(func, arg));
      }
    }
  }

  prepare_substring_arg(ctx, fmtargs, cursub, ptr);

  if ( *ti != NULL ) // extra format arguments
    return TERR_NUM_FMT;

  return TERR_OK;
}

//-----------------------------------------------------------------------------
static symref_t build_print_function(
    const char *name,
    const char *pname,
    symbol_type_t ptype,
    primitive_t pbase,
    symtab_t &gsyms)
{
  symvec_t *params = new symvec_t;
  symref_t  param  = ptype == ST_PRIMITIVE
                   ? symref_t(new symbol_t(SF_PARAMETER, pname, -1))
                   : symref_t(new symbol_t(SF_PARAMETER, pname, -1, BADOFFSET));

  param->set_base(pbase);
  params->push_back(param);

  symref_t bfunc(new symbol_t(SF_EXTERN, name, -1, params));
  bfunc->set_base(PRIM_VOID);

  ASSERT(1103, gsyms.get(bfunc->name()) == NULL);
  gsyms.insert(bfunc);

  return bfunc;
}

//-----------------------------------------------------------------------------
static treenode_t *build_printf_tree(symref_t printf, const format_args_t &fmtargs)
{
  seq_t seq = { NULL, NULL };

  // build sequence of calls to print_(string|int|char)
  for ( size_t i = 0; i < fmtargs.size(); i++ )
  {
    const format_arg_t &fmtarg = fmtargs[i];

    treenode_t *argtree =
        new treenode_t(TNT_ARG, fmtarg.expr, NULL);

    treenode_t *call = new treenode_t(fmtarg.func, TNT_CALL, argtree);
    seq_append(seq, call, TNT_STMT);
  }

  return seq.head == NULL ? ERRNODE : new treenode_t(printf, TNT_PRINTF, seq.head);
}

//-----------------------------------------------------------------------------
treenode_t *process_printf_call(
    parser_ctx_t &ctx,
    symref_t printf,
    treenode_t *allargs,
    int line)
{
  format_args_t fmtargs;

  type_error_t res = validate_printf_call(ctx, fmtargs, allargs);

  if ( res != TERR_OK )
  {
    switch ( res )
    {
      case TERR_NO_FMT:
        usererr(ctx, "error: printf() expects at least one string constant argument, line %d\n", line);
        break;
      case TERR_FMTSTR:
        usererr(ctx, "error: first argument to printf() must be a string constant, line %d\n", line);
        break;
      case TERR_BAD_FMT:
        usererr(ctx, "error: incompatible argument for format specifier, line %d\n", line);
        break;
      case TERR_NUM_FMT:
        usererr(ctx, "error: invalid number of format arguments, line %d\n", line);
        break;
      default:
        INTERR(0);
    }
    delete allargs;
    return ERRNODE;
  }

  cleanup_fmtarg_list(allargs); // original TNT_ARG sequence longer needed

  return build_printf_tree(printf, fmtargs);
}

//-----------------------------------------------------------------------------
static treenode_t *process_call(parser_ctx_t &ctx, symref_t f, treenode_t *args, int line)
{
  ASSERT(1042, f != NULL);

  if ( f->is_printf() )
    return process_printf_call(ctx, f, args, line);

  terr_info_t err = validate_call(*f, args);

  if ( err.code != TERR_OK )
  {
    switch ( err.code )
    {
      case TERR_NUMARGS:
        usererr(ctx, "error: expected %d arguments for function %s, %d were provided. line %d\n",
                f->params()->size(), f->c_str(), err.data, line);
        break;
      case TERR_BADARG:
        usererr(ctx, "error: argument %d to function %s is of incompatible type, line %d\n",
                err.data, f->c_str(), line);
        break;
      case TERR_NOFUNC:
        usererr(ctx, "error: symbol %s used a function but is not of function type, line %d\n",
                f->c_str(), line);
        break;
      default:
        INTERR(1032);
    }
    delete args;
    return ERRNODE;
  }

  return new treenode_t(f, TNT_CALL, args);
}

//-----------------------------------------------------------------------------
static type_error_t validate_call_ctx(const treenode_t &call, bool expr)
{
  if ( call.type() == TNT_ERROR )
    return TERR_OK;

  ASSERT(1043, call.type() == TNT_CALL || call.type() == TNT_PRINTF);

  primitive_t rt = call.sym()->base();

  if ( expr )
    return rt == PRIM_VOID ? TERR_VOID_EXPR : TERR_OK;
  else
    return rt != PRIM_VOID ? TERR_PROCEDURE : TERR_OK;
}

//-----------------------------------------------------------------------------
static treenode_t *process_call_ctx(parser_ctx_t &ctx, treenode_t *call, int line, bool expr)
{
  ASSERT(1044, call != NULL);

  type_error_t err = validate_call_ctx(*call, expr);

  if ( err != TERR_OK )
  {
    switch ( err )
    {
      case TERR_VOID_EXPR:
        usererr(ctx, "error: line %d - function %s called as part of an expression "
                "but does not return a value\n",
                line, call->sym()->c_str());
        break;
      case TERR_PROCEDURE:
        usererr(ctx, "error: line %d - function %s called as a standalone statement "
                "but does not have return type void\n",
                line, call->sym()->c_str());
        break;
      default:
        INTERR(1033);
    }
    delete call;
    return ERRNODE;
  }

  return call;
}

//-----------------------------------------------------------------------------
static inline void yyputsym(usymref_t usym, symref_t sym)
{
  putref(usym, sym);
}

//-----------------------------------------------------------------------------
// deletes the reference after extracting
static inline symref_t yygetsym(const usymref_t &usym)
{
  symref_t &yyref = getref(usym);
  symref_t ret = yyref;
  yyref.~symref_t();
  return ret;
}

//-----------------------------------------------------------------------------
static inline void yyputerr(uterr_info_t uerr, terr_info_t err)
{
  unionize<terr_info_t>(uerr, err);
}

//-----------------------------------------------------------------------------
static inline terr_info_t yygeterr(const uterr_info_t &uerr)
{
  return deunionize<terr_info_t>(uerr);
}

//-----------------------------------------------------------------------------
static symref_t process_stmt_id(parser_ctx_t &ctx, const char *id, int line)
{
  std::string key(id);
  symref_t sym = ctx.get(key); // first check local symbols
  if ( sym == NULL )
  {
    sym = ctx.gsyms.get(key); // now global symbols
    if ( sym == NULL )
      usererr(ctx, "error: use of undeclared identifier %s at line %d\n", key.c_str(), line);
  }
  return sym;
}

//-----------------------------------------------------------------------------
static type_error_t validate_array_lookup(const symbol_t &sym, const treenode_t &idx)
{
  return !sym.is_array()      ? TERR_BASE
       : !idx.is_int_compat() ? TERR_INDEX
       :                        TERR_OK;
}

//-----------------------------------------------------------------------------
static treenode_t *process_stmt_var(parser_ctx_t &ctx, symref_t sym, treenode_t *idx, int line)
{
  ASSERT(1045, sym != NULL);

  if ( idx == NULL )
    return new treenode_t(sym, TNT_SYMBOL);

  type_error_t err = validate_array_lookup(*sym, *idx);

  if ( err != TERR_OK )
  {
    switch ( err )
    {
      case TERR_BASE:
        usererr(ctx, "error: symbol %s used as an array but is not of array type, line %d\n",
                sym->c_str(), line);
        break;
      case TERR_INDEX:
        usererr(ctx, "error: expression for array index is not of integer type, line %d\n", line);
        break;
      default:
        INTERR(1034);
    }
    delete idx;
    return ERRNODE;
  }

  return new treenode_t(sym, TNT_ARRAY_LOOKUP, idx);
}

//-----------------------------------------------------------------------------
static bool validate_assg(const treenode_t &lhs, const treenode_t &rhs)
{
  if ( lhs.type() == TNT_ERROR || rhs.type() == TNT_ERROR )
    return true;

  bool lhs_valid = (lhs.type() == TNT_SYMBOL && lhs.sym()->is_prim())
                 || lhs.type() == TNT_ARRAY_LOOKUP;

  return lhs_valid && rhs.is_int_compat();
}

//-----------------------------------------------------------------------------
static treenode_t *process_assg(parser_ctx_t &ctx, treenode_t *lhs, treenode_t *rhs, int line)
{
  ASSERT(1046, lhs != NULL);
  ASSERT(1047, rhs != NULL);

  if ( !validate_assg(*lhs, *rhs) )
  {
    usererr(ctx, "error: invalid operand types for assignment, line %d\n", line);
    delete lhs; delete rhs;
    return ERRNODE;
  }

  return new treenode_t(TNT_ASSG, lhs, rhs);
}

//-----------------------------------------------------------------------------
static terr_info_t validate_var_decl(
    const parser_ctx_t &ctx,
    const symbol_t &sym,
    primitive_t type)
{
  ASSERT(1104, type != PRIM_UNKNOWN);

  if ( type == PRIM_VOID )
    return TERR_BAD_VOID;

  symref_t prev = ctx.get(sym.name());
  if ( prev != NULL )
    return terr_info_t(TERR_REDECLARED, prev->line());

  return TERR_OK;
}

//-----------------------------------------------------------------------------
static bool process_var_decl(parser_ctx_t &ctx, symref_t sym, primitive_t type)
{
  ASSERT(1105, sym != NULL);

  terr_info_t err = validate_var_decl(ctx, *sym, type);

  if ( err.code != TERR_OK )
  {
    switch ( err.code )
    {
      case TERR_REDECLARED:
        usererr(ctx, "error: variable %s redeclared at line %d (previous declaration at line %d)\n",
                sym->c_str(), sym->line(), err.data);
        break;
      case TERR_BAD_VOID:
        usererr(ctx, "error: void type is only valid for parameter declarations, line %d\n", sym->line());
        break;
      default:
        INTERR(0);
    }
    return false;
  }

  sym->set_base(type);
  ctx.insert(sym);

  return true;
}

//-----------------------------------------------------------------------------
static void process_var_list(parser_ctx_t &ctx, symvec_t *vec, primitive_t type)
{
  ASSERT(1106, vec != NULL);
  for ( symvec_t::iterator i = vec->begin(); i != vec->end(); i++ )
  {
    ASSERT(1107, *i != NULL);
    process_var_decl(ctx, *i, type);
  }
}

//-----------------------------------------------------------------------------
static bool validate_printf_decl(const symbol_t &func, primitive_t rt, bool is_extern)
{
  const symvec_t &params = *func.params();

  return func.is_printf()
      && rt == PRIM_VOID
      && is_extern
      && params.size() == 2
      && params.front()->is_array()
      && params.front()->base() == PRIM_CHAR
      && params.back()->type() == ST_ELLIPSIS;
}

//-----------------------------------------------------------------------------
static terr_info_t validate_func_decl(
    const parser_ctx_t &ctx,
    const symbol_t &func,
    primitive_t rt,
    bool is_extern)
{
  symref_t prev = ctx.gsyms.get(func.name());
  if ( prev != NULL )
    return terr_info_t(TERR_REDECLARED, prev->line());

  if ( has_ellipsis(func) )
    return validate_printf_decl(func, rt, is_extern) ? TERR_OK2
                                                     : TERR_PRINTF_DECL;
  return TERR_OK;
}

//-----------------------------------------------------------------------------
static void process_fdecl_error(parser_ctx_t &ctx, terr_info_t err, const symbol_t &sym)
{
  switch ( err.code )
  {
    case TERR_REDECLARED:
      usererr(ctx, "error: function %s redeclared at line %d (previous declaration at line %d)\n",
              sym.c_str(), sym.line(), err.data);
      break;
    case TERR_REDEFINED:
      usererr(ctx, "error: function %s redefined at line %d "
              "(previous definition starts at line %d)\n",
              sym.c_str(), sym.line(), err.data);
      break;
    case TERR_PARAMS:
      usererr(ctx, "error: parameters in definition of function %s at line %d "
              "do not match the parameters in its declaration at line %d\n",
              sym.c_str(), sym.line(), err.data);
      break;
    case TERR_RTN_TYPES:
      usererr(ctx, "error: return type for function %s at line %d "
              "does not match the return type in its declaration at line %d\n",
              sym.c_str(), sym.line(), err.data);
      break;
    case TERR_EXTERN:
      usererr(ctx, "error: function %s is defined at line %d "
              "but is declared extern at line %d\n",
              sym.c_str(), sym.line(), err.data);
      break;
    case TERR_PRINTF_DECL:
    case TERR_PRINTF_DEF1:
    case TERR_PRINTF_DEF2:
      usererr(ctx, "error, line %d: ellipsis \"...\" notation is is only valid when declaring "
              "builtin function: extern void printf(char format[], ...);\n",
              sym.line());
      break;
    default:
      INTERR(0);
  }
}

//-----------------------------------------------------------------------------
static void build_print_functions(parser_ctx_t &ctx, symref_t printf)
{
  ASSERT(1108, printf != NULL && printf->is_printf());

  ctx.print_int    = build_print_function(BI_PRINT_INT,    "val",  ST_PRIMITIVE, PRIM_INT,  ctx.gsyms);
  ctx.print_hex    = build_print_function(BI_PRINT_HEX,    "hex",  ST_PRIMITIVE, PRIM_INT,  ctx.gsyms);
  ctx.print_char   = build_print_function(BI_PRINT_CHAR,   "c",    ST_PRIMITIVE, PRIM_CHAR, ctx.gsyms);
  ctx.print_string = build_print_function(BI_PRINT_STRING, "str",  ST_ARRAY,     PRIM_CHAR, ctx.gsyms);
}

//-----------------------------------------------------------------------------
static void process_func_list(parser_ctx_t &ctx, symvec_t *vec, primitive_t rt, bool is_extern)
{
  ASSERT(1010, vec != NULL);
  ASSERT(1025, rt != PRIM_UNKNOWN);

  for ( symvec_t::iterator i = vec->begin(); i != vec->end(); i++ )
  {
    ASSERT(1011, *i != NULL);

    symref_t sym = *i;
    terr_info_t err = validate_func_decl(ctx, *sym, rt, is_extern);

    if ( err.code > TERR_OK2 )
    {
      process_fdecl_error(ctx, err, *sym);
      continue;
    }

    if ( err.code == TERR_OK2 )
      build_print_functions(ctx, sym);

    sym->set_base(rt);

    if ( is_extern )
      sym->set_extern();

    ctx.gsyms.insert(sym);
  }
}

//-----------------------------------------------------------------------------
static terr_info_t process_array_sfx(parser_ctx_t &ctx, int size, int line)
{
  terr_info_t asfx(size >= 0 ? TERR_OK2 : TERR_ASFX, size);

  if ( asfx.code > TERR_OK2 )
    usererr(ctx, "error: line %d: arrays must have non-negative size\n", line);

  return asfx;
}

//-----------------------------------------------------------------------------
static symvec_t *sym_list_prepend(symref_t first, symvec_t *rest)
{
  symvec_t *vec = rest == NULL ? new symvec_t : rest;

  if ( first != NULL )
    vec->insert(vec->begin(), first);

  return vec;
}

//-----------------------------------------------------------------------------
static symvec_t *sym_list_append(symvec_t *list, symref_t last)
{
  symvec_t *ret = list == NULL ? new symvec_t : list;

  if ( last != NULL )
    ret->push_back(last);

  return ret;
}

//-----------------------------------------------------------------------------
static symvec_t *process_param_list(symref_t first, symvec_t *rest, symref_t ellipsis)
{
  symvec_t *params = sym_list_prepend(first, rest);

  return sym_list_append(params, ellipsis);
}

//-----------------------------------------------------------------------------
static bool validate_math_expr(
    const treenode_t *lhs,
    treenode_type_t type,
    const treenode_t *rhs)
{
  ASSERT(1069, rhs != NULL);

  switch ( type )
  {
    case TNT_NEG:
    case TNT_BNOT:
      ASSERT(1070, lhs == NULL);
      return rhs->is_int_compat();
    case TNT_PLUS:
    case TNT_MINUS:
    case TNT_MULT:
    case TNT_DIV:
    case TNT_SHL:
    case TNT_SHR:
    case TNT_BAND:
    case TNT_BOR:
    case TNT_XOR:
      ASSERT(1071, lhs != NULL);
      return lhs->is_int_compat()
          && rhs->is_int_compat();
    default:
      INTERR(1064);
  }
}

//-----------------------------------------------------------------------------
static treenode_t *process_math_expr(
    parser_ctx_t &ctx,
    treenode_t *lhs,
    treenode_type_t type,
    treenode_t *rhs,
    int line)
{
  if ( !validate_math_expr(lhs, type, rhs) )
  {
    usererr(ctx, "error: incompatible arithmetic operand, line %d\n", line);
    delete lhs; delete rhs;
    return ERRNODE;
  }

  return new treenode_t(type, lhs, rhs);
}

//-----------------------------------------------------------------------------
static treenode_t *process_for_stmt(
    parser_ctx_t &ctx,
    treenode_t *init,
    treenode_t *cond,
    treenode_t *inc,
    treenode_t *body,
    int line)
{
  if ( cond != NULL && !cond->is_bool_compat() )
  {
    usererr(ctx, "error: expression in for condition is not of type bool, line %d\n", line);
    delete init; delete cond; delete inc; delete body;
    return ERRNODE;
  }
  return new treenode_t(TNT_FOR, init, cond, inc, body);
}

//-----------------------------------------------------------------------------
static treenode_t *process_while_stmt(
    parser_ctx_t &ctx,
    treenode_t *cond,
    treenode_t *body,
    int line)
{
  ASSERT(1072, cond != NULL);

  if ( !cond->is_bool_compat() )
  {
    usererr(ctx, "error: expression in while condition is not of type bool, line %d\n", line);
    delete cond; delete body;
    return ERRNODE;
  }
  return new treenode_t(TNT_WHILE, cond, body);
}

//-----------------------------------------------------------------------------
static treenode_t *process_if_stmt(
    parser_ctx_t &ctx,
    treenode_t *cond,
    treenode_t *body,
    treenode_t *el,
    int line)
{
  ASSERT(1073, cond != NULL);

  if ( !cond->is_bool_compat() )
  {
    usererr(ctx, "error: expression in if condition is not of type bool, line %d\n", line);
    delete cond; delete body; delete el;
    return ERRNODE;
  }
  return new treenode_t(TNT_IF, cond, body, el);
}

//-----------------------------------------------------------------------------
static bool validate_bool_expr(
    const treenode_t *lhs,
    treenode_type_t type,
    const treenode_t *rhs)
{
  ASSERT(1048, rhs != NULL);

  switch ( type )
  {
    case TNT_NOT:
      ASSERT(1049, lhs == NULL);
      return rhs->is_bool_compat();
    case TNT_EQ:
    case TNT_NEQ:
    case TNT_LT:
    case TNT_LEQ:
    case TNT_GT:
    case TNT_GEQ:
      ASSERT(1050, lhs != NULL);
      return lhs->is_int_compat()
          && rhs->is_int_compat();
    case TNT_AND:
    case TNT_OR:
      ASSERT(1051, lhs != NULL);
      return lhs->is_bool_compat()
          && rhs->is_bool_compat();
    default:
      INTERR(1052);
  }
}

//-----------------------------------------------------------------------------
static treenode_t *process_bool_expr(
    parser_ctx_t &ctx,
    treenode_t *lhs,
    treenode_type_t type,
    treenode_t *rhs,
    int line)
{
  if ( !validate_bool_expr(lhs, type, rhs) )
  {
    usererr(ctx, "error: incompatible boolean operands, line %d\n", line);
    delete lhs; delete rhs;
    return ERRNODE;
  }
  return new treenode_t(type, lhs, rhs);
}

//-----------------------------------------------------------------------------
int yyerror(void *scanner, parser_ctx_t &ctx, const char *s)
{
  usererr(ctx, "%s, line: %d\n", s, lineno);
  return 3;
}

//-----------------------------------------------------------------------------
void usererr(parser_ctx_t &ctx, const char *format, ...)
{
  va_list va;
  va_start(va, format);

  char buf[MAXERRLEN];
  vsnprintf(buf, MAXERRLEN, format, va);
  ctx.errmsgs.push_back(buf);

  va_end(va);
}

//---------------------------------------------------------------------------
bool parse(parse_results_t &res, FILE *infile)
{
  ASSERT(1101, infile);
  // yydebug = 1;

  parser_ctx_t ctx;
  scanner_t scanner(infile);

  yyparse(scanner.yyscan, ctx);

  res.gsyms.swap(ctx.gsyms);
  res.trees.swap(ctx.trees);
  res.errmsgs.swap(ctx.errmsgs);

  return res.errmsgs.empty();
}
