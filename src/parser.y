%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <parser.h>
#include <symbol.h>
#include <treenode.h>
#include <messages.h>
#include <printf.h>

extern "C" FILE *yyin;
extern "C" int yylex();
extern "C" int yyparse();
extern "C" int yylineno;
int yyerror(const char *s);

//---------------------------------------------------------------------------
static symtab_t gsyms;        // global symbol table
static treefuncs_t functions; // functions, (along with their syntax trees)
                              // in order as they appear in the source file
//---------------------------------------------------------------------------
static class ctx_t
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
    uint8_t reserve[sizeof(symref_t)];
  };

public:
  ctx_t()                   { setglobal(); }
  ~ctx_t()                  { clear(); }

  void clear()              { if ( mode == CTX_LOCAL ) func().~symref_t(); }

  void setglobal()          { clear(); mode = CTX_GLOBAL; syms = &gsyms; }
  void setlocal(symref_t f) { clear(); mode = CTX_LOCAL;  putref(reserve, f); }
  void settemp()            { clear(); mode = CTX_TEMP;   syms = new symtab_t; }
  void trash()              { delete syms; setglobal(); }

  symref_t &func()    const { return getref(reserve); }

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
} ctx;

//---------------------------------------------------------------------------
static       void  process_var_list(symvec_t *, primitive_t);
static       void  process_func_list(symvec_t *, primitive_t, bool);
static       bool  process_var_decl(symref_t, primitive_t);
static   symref_t  process_var_id(const char *, int, terr_info_t, uint32_t);
static   symref_t  process_stmt_id(const char *, int);
static treenode_t *process_stmt_var(symref_t, treenode_t *, int);
static treenode_t *process_assg(treenode_t *, treenode_t *, int);
static treenode_t *process_call(symref_t, treenode_t *, int);
static treenode_t *process_call_ctx(treenode_t *, int, bool);
static treenode_t *process_ret_stmt(treenode_t *, int line);
static treenode_t *process_bool_expr(treenode_t *, treenode_type_t, treenode_t *, int);
static treenode_t *process_if_stmt(treenode_t *, treenode_t *, treenode_t *, int);
static treenode_t *process_while_stmt(treenode_t *, treenode_t *, int);
static treenode_t *process_for_stmt(treenode_t *, treenode_t *, treenode_t *, treenode_t *, int);
static treenode_t *process_math_expr(treenode_t *, treenode_type_t, treenode_t *, int);
static   symvec_t *process_param_list(symref_t, symvec_t *, symref_t);
static terr_info_t process_array_sfx(int, int);
static       void  process_fdecl_error(terr_info_t, symref_t);
static   symvec_t *sym_list_append(symvec_t *, symref_t);
static   symvec_t *sym_list_prepend(symref_t, symvec_t *);
static       void  func_enter(symref_t, primitive_t);
static       void  func_leave(treenode_t *);
static       void  yyputsym(uint8_t const [], symref_t);
static   symref_t  yygetsym(uint8_t const []);
static       void  yyputerr(uint8_t const [], terr_info_t);
static terr_info_t yygeterr(uint8_t const []);
%}

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
  uint8_t asfx[sizeof(terr_info_t)];
  uint8_t sym[sizeof(symref_t)];
}

%token<i>   INT
%token<str> CHAR STRING ID

%token INT_TYPE CHAR_TYPE VOID
%token WHILE RETURN EXTERN IF ELSE FOR
%token EQ NEQ LEQ GEQ AND OR ELLIPSIS

%type<prim>   type
%type<sym>    var_decl func_decl param_decl ellipsis
%type<symvec> var_decls var_decl_list func_decls func_decl_list params param_decl_list
%type<tree>   func_body stmt stmt_var stmt_array_sfx expr call args op_expr else assg op_assg
%type<asfx>   decl_array_sfx param_array_sfx
%type<seq>    stmts arg_list

/*---------------------------------------------------------------------------*/
/* precedence increases as we go down the list */
%left OR
%left AND
%left NEQ EQ
%left GEQ '>' LEQ '<'
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
decl :        type var_decls  { process_var_list ($2, $1);        delete $2; }
     |        type func_decls { process_func_list($2, $1, false); delete $2; }
     | EXTERN type func_decls { process_func_list($3, $2, true);  delete $3; }
     ;

type : INT_TYPE  { $$ = PRIM_INT;  }
     | CHAR_TYPE { $$ = PRIM_CHAR; }
     | VOID      { $$ = PRIM_VOID; }
     ;

/*---------------------------------------------------------------------------*/
var_decls : var_decl var_decl_list { $$ = sym_list_prepend(yygetsym($1), $2); }
          ;

var_decl : ID decl_array_sfx
           {
             symref_t ref = process_var_id($1, yylineno, yygeterr($2), 0);
             yyputsym($$, ref);
             free($1);
           }
         ;

decl_array_sfx : '[' INT ']' { yyputerr($$, process_array_sfx($2, yylineno)); }
               | /* empty */ { yyputerr($$, terr_info_t(TERR_OK)); }
               ;

var_decl_list : var_decl_list ',' var_decl { $$ = sym_list_append($1, yygetsym($3)); }
              | /* empty */                { $$ = NULL; }
              ;

/*---------------------------------------------------------------------------*/
func_decls : func_decl func_decl_list { $$ = sym_list_prepend(yygetsym($1), $2); }
           ;

func_decl : ID '(' { ctx.settemp(); } params { ctx.trash(); } ')'
            {
              symref_t func(new symbol_t(0, $1, yylineno, $4));
              yyputsym($$, func);
              free($1);
            }
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

param_decl : type ID param_array_sfx
             {
               symref_t sym = process_var_id($2, yylineno, yygeterr($3), SF_PARAMETER);
               if ( sym != NULL && !process_var_decl(sym, $1) )
                 sym = NULLREF;
               yyputsym($$, sym);
               free($2);
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
          { func_enter(yygetsym($2), $1); }
          func_body
          { func_leave($5); }
       '}'
     | error '{' { purge_and_exit(FATAL_FUNCDEF); } /* avoid processing an invaild function */
     | error '}' { yyerrok; }  /* start over at '}' */
     ;

func_body : local_decls stmts { $$ = $2.head; }
          ;

local_decls : local_decls type var_decls ';' { process_var_list($3, $2); delete $3; }
            | local_decls error          ';' { yyerrok; } /* TODO: this handles errors in statements as well */
            | /* empty */
            ;

stmts : stmts stmt  { $$ = seq_append($1, $2, TNT_STMT); }
      | /* empty */ { $$.head = NULL; $$.tail = NULL; }
      ;

/*---------------------------------------------------------------------------*/
stmt : assg ';'                  { $$ = $1; }
     | call ';'                  { $$ = process_call_ctx($1, yylineno, false); }
     | RETURN op_expr ';'        { $$ = process_ret_stmt($2, yylineno); }
     | IF '(' expr ')' stmt else { $$ = process_if_stmt($3, $5, $6, yylineno); }
     | WHILE '(' expr ')' stmt   { $$ = process_while_stmt($3, $5, yylineno); }
     | FOR '(' op_assg ';' op_expr ';' op_assg ')' stmt
                                 { $$ = process_for_stmt($3, $5, $7, $9, yylineno); }
     | '{' stmts '}'             { $$ = $2.head; }
     | ';'                       { $$ = NULL; }
     ;

/*---------------------------------------------------------------------------*/
op_assg : assg        { $$ = $1; }
        | /* empty */ { $$ = NULL; }
        ;

else : ELSE stmt      { $$ = $2; }
     | /* empty */    { $$ = NULL; }
     ;

op_expr : expr        { $$ = $1; }
        | /* empty */ { $$ = NULL; }
        ;

/*---------------------------------------------------------------------------*/
assg : stmt_var '=' expr { $$ = process_assg($1, $3, yylineno); }
     ;

/*---------------------------------------------------------------------------*/
call : ID '(' args ')'
       {
         symref_t sym = process_stmt_id($1, yylineno);
         $$ = sym != NULL
            ? process_call(sym, $3, yylineno)
            : ERRNODE;
         free($1);
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
         | /* empty */       { $$.head = NULL; $$.tail = NULL; }
         ;

/*---------------------------------------------------------------------------*/
stmt_var : ID stmt_array_sfx
           {
             symref_t sym = process_stmt_id($1, yylineno);
             $$ = sym != NULL
                ? process_stmt_var(sym, $2, yylineno)
                : ERRNODE;
             free($1);
           }
         ;

stmt_array_sfx : '[' expr ']' { $$ = $2; }
               | /* empty */  { $$ = NULL; }
               ;

/*---------------------------------------------------------------------------*/
expr : INT                  { $$ = new treenode_t(TNT_INTCON, $1); }
     | CHAR                 { $$ = new treenode_t(TNT_CHARCON, $1); }
     | STRING               { $$ = new treenode_t(TNT_STRCON, $1); }
     | call                 { $$ = process_call_ctx($1, yylineno, true); }
     | stmt_var             { $$ = $1; }
     | expr EQ  expr        { $$ = process_bool_expr($1,   TNT_EQ,    $3, yylineno); }
     | expr NEQ expr        { $$ = process_bool_expr($1,   TNT_NEQ,   $3, yylineno); }
     | expr '<' expr        { $$ = process_bool_expr($1,   TNT_LT,    $3, yylineno); }
     | expr LEQ expr        { $$ = process_bool_expr($1,   TNT_LEQ,   $3, yylineno); }
     | expr '>' expr        { $$ = process_bool_expr($1,   TNT_GT,    $3, yylineno); }
     | expr GEQ expr        { $$ = process_bool_expr($1,   TNT_GEQ,   $3, yylineno); }
     | expr AND expr        { $$ = process_bool_expr($1,   TNT_AND,   $3, yylineno); }
     | expr OR  expr        { $$ = process_bool_expr($1,   TNT_OR,    $3, yylineno); }
     | expr '+' expr        { $$ = process_math_expr($1,   TNT_PLUS,  $3, yylineno); }
     | expr '-' expr        { $$ = process_math_expr($1,   TNT_MINUS, $3, yylineno); }
     | expr '*' expr        { $$ = process_math_expr($1,   TNT_MULT,  $3, yylineno); }
     | expr '/' expr        { $$ = process_math_expr($1,   TNT_DIV,   $3, yylineno); }
     | '!' expr %prec UNARY { $$ = process_bool_expr(NULL, TNT_NOT,   $2, yylineno); }
     | '-' expr %prec UNARY { $$ = process_math_expr(NULL, TNT_NEG,   $2, yylineno); }
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
static type_error_t validate_collision(const symbol_t &prev, const symbol_t &sym)
{
  ASSERT(1001, prev.name() == sym.name());

  return !prev.is_func()                              ? TERR_REDECLARED
       :  prev.is_defined()                           ? TERR_REDEFINED
       :  prev.is_extern()                            ? TERR_EXTERN
       : !check_params(*prev.params(), *sym.params()) ? TERR_PARAMS
       :  prev.base() != sym.base()                   ? TERR_RTN_TYPES
       :                                                TERR_OK;
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
static void process_col_err(type_error_t err, const symbol_t &f, const symbol_t &prev)
{
  switch ( err )
  {
    case TERR_REDEFINED:
      usererr("error: function %s redefined at line %d "
              "(previous definition starts at line %d)\n",
              f.c_str(), f.line(), prev.line());
      break;
    case TERR_REDECLARED:
      usererr("error: symbol %s redeclared as a function at line %d "
              "(previous declaration at line %d)\n",
              f.c_str(), f.line(), prev.line());
      break;
    case TERR_PARAMS:
      usererr("error: parameters in definition of function %s at line %d "
              "do not match the parameters in its declaration at line %d\n",
              f.c_str(), f.line(), prev.line());
      break;
    case TERR_RTN_TYPES:
      usererr("error: return type for function %s at line %d "
              "does not match the return type in its declaration at line %d\n",
              f.c_str(), f.line(), prev.line());
      break;
    case TERR_EXTERN:
      usererr("error: function %s is defined at line %d "
              "but is declared extern at line %d\n",
              f.c_str(), f.line(), prev.line());
      break;
    default:
      INTERR(1012);
  }
}

//-----------------------------------------------------------------------------
static bool has_ellipsis(const symbol_t &f)
{
  return f.is_func()
      && f.params()->size() > 0
      && f.params()->back()->type() == ST_ELLIPSIS;
}

//-----------------------------------------------------------------------------
static void set_decl_srcinfo(symbol_t &f1, const symbol_t &f2)
{
  f1.set_line(f2.line());

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
static void func_enter(symref_t f, primitive_t rt)
{
  ASSERT(1004, f != NULL);
  ASSERT(1000, f->is_func());

  if ( has_ellipsis(*f) )
  {
    process_fdecl_error(TERR_BAD_PRINTF, f);
    purge_and_exit(FATAL_FUNCDEF);
  }

  f->set_base(rt);
  symref_t prev = gsyms.get(f->name());

  if ( prev != NULL )
  {
    type_error_t err = validate_collision(*prev, *f);
    if ( err != TERR_OK )
    {
      process_col_err(err, *f, *prev);
      // these errors invalidate an entire function definition.
      // we do not try to recover from them
      purge_and_exit(FATAL_FUNCDEF);
    }
    // definition provides param names/line #s that are actually used
    set_decl_srcinfo(*prev, *f);
    f = prev;
  }
  else
  {
    gsyms.insert(f);
  }

  init_lsyms(*f);
  ctx.setlocal(f);
}

//-----------------------------------------------------------------------------
static void func_leave(treenode_t *tree)
{
  symref_t f = ctx.func();

  f->set_defined();

  if ( f->base() != PRIM_VOID && !f->is_ret_resolved() )
    usererr("error: non-void funcion %s must return a value\n", f->c_str());

  functions.push_back(treefunc_t(f, tree));

  ctx.setglobal();
}

//-----------------------------------------------------------------------------
static type_error_t validate_ret_stmt(const treenode_t *expr)
{
  if ( ctx.func()->base() == PRIM_VOID )
    return expr != NULL ? TERR_BAD_RET : TERR_OK;
  else
    return expr == NULL           ? TERR_NO_RET
         : !expr->is_int_compat() ? TERR_RET_EXPR
         :                          TERR_OK2;
}

//-----------------------------------------------------------------------------
static treenode_t *process_ret_stmt(treenode_t *expr, int line)
{
  type_error_t err = validate_ret_stmt(expr);

  if ( err > TERR_OK2 )
  {
    switch ( err )
    {
      case TERR_NO_RET:
        usererr("error: line %d - return statements in a non-void function "
                "must return a value\n", line);
        break;
      case TERR_BAD_RET:
        usererr("error: line %d - return statements in a void function "
                "must not return a value\n", line);
        break;
      case TERR_RET_EXPR:
        usererr("error: line %d - return value is not compatible "
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
static treenode_t *process_call(symref_t f, treenode_t *args, int line)
{
  ASSERT(1042, f != NULL);

  if ( f->is_builtin_printf() )
    return process_printf_call(f, args, line);

  terr_info_t err = validate_call(*f, args);

  if ( err.code != TERR_OK )
  {
    switch ( err.code )
    {
      case TERR_NUMARGS:
        usererr("error: expected %d arguments for function %s, %d were provided. line %d\n",
                f->params()->size(), f->c_str(), err.data, line);
        break;
      case TERR_BADARG:
        usererr("error: argument %d to function %s is of incompatible type, line %d\n",
                err.data, f->c_str(), line);
        break;
      case TERR_NOFUNC:
        usererr("error: symbol %s used a function but is not of function type, line %d\n",
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
static treenode_t *process_call_ctx(treenode_t *call, int line, bool expr)
{
  ASSERT(1044, call != NULL);

  type_error_t err = validate_call_ctx(*call, expr);

  if ( err != TERR_OK )
  {
    switch ( err )
    {
      case TERR_VOID_EXPR:
        usererr("error: line %d - function %s called as part of an expression "
                "but does not return a value\n",
                line, call->sym()->c_str());
        break;
      case TERR_PROCEDURE:
        usererr("error: line %d - function %s called as a standalone statement "
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
static inline void yyputsym(uint8_t const addr[], symref_t ref)
{
  putref(addr, ref);
}

//-----------------------------------------------------------------------------
// deletes the reference after extracting
static inline symref_t yygetsym(uint8_t const addr[])
{
  symref_t &yyref = getref(addr);
  symref_t ret = yyref;
  yyref.~symref_t();
  return ret;
}

//-----------------------------------------------------------------------------
static inline void yyputerr(uint8_t const addr[], terr_info_t err)
{
  unionize<terr_info_t>(addr, err);
}

//-----------------------------------------------------------------------------
static inline terr_info_t yygeterr(uint8_t const addr[])
{
  return deunionize<terr_info_t>(addr);
}

//-----------------------------------------------------------------------------
static symref_t process_stmt_id(const char *id, int line)
{
  std::string key(id);
  symref_t sym = ctx.get(key); // first check local symbols
  if ( sym == NULL )
  {
    sym = gsyms.get(key); // now global symbols
    if ( sym == NULL )
      usererr("error: use of undeclared identifier %s at line %d\n", key.c_str(), line);
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
static treenode_t *process_stmt_var(symref_t sym, treenode_t *idx, int line)
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
        usererr("error: symbol %s used as an array but is not of array type, line %d\n",
                sym->c_str(), line);
        break;
      case TERR_INDEX:
        usererr("error: expression for array index is not of integer type, line %d\n", line);
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
static treenode_t *process_assg(treenode_t *lhs, treenode_t *rhs, int line)
{
  ASSERT(1046, lhs != NULL);
  ASSERT(1047, rhs != NULL);

  if ( !validate_assg(*lhs, *rhs) )
  {
    usererr("error: invalid operand types for assignment, line %d\n", line);
    delete lhs; delete rhs;
    return ERRNODE;
  }

  return new treenode_t(TNT_ASSG, lhs, rhs);
}

//-----------------------------------------------------------------------------
static terr_info_t validate_var_decl(const symbol_t &sym, primitive_t type)
{
  ASSERT(0, type != PRIM_UNKNOWN);

  if ( type == PRIM_VOID )
    return TERR_BAD_VOID;

  symref_t prev = ctx.get(sym.name());
  if ( prev != NULL )
    return terr_info_t(TERR_REDECLARED, prev->line());

  return TERR_OK;
}

//-----------------------------------------------------------------------------
static bool process_var_decl(symref_t sym, primitive_t type)
{
  ASSERT(0, sym != NULL);

  terr_info_t err = validate_var_decl(*sym, type);

  if ( err.code != TERR_OK )
  {
    switch ( err.code )
    {
      case TERR_REDECLARED:
        usererr("error: variable %s redeclared at line %d (previous declaration at line %d)\n",
                sym->c_str(), sym->line(), err.data);
        break;
      case TERR_BAD_VOID:
        usererr("error: void type is only valid for parameter declarations, line %d\n", sym->line());
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
static void process_var_list(symvec_t *vec, primitive_t type)
{
  ASSERT(0, vec != NULL);
  for ( symvec_t::iterator i = vec->begin(); i != vec->end(); i++ )
  {
    ASSERT(0, *i != NULL);
    process_var_decl(*i, type);
  }
}

//-----------------------------------------------------------------------------
static terr_info_t validate_func_decl(const symbol_t &func, primitive_t rt, bool is_extern)
{
  symref_t prev = gsyms.get(func.name());
  if ( prev != NULL )
    return terr_info_t(TERR_REDECLARED, prev->line());

  if ( has_ellipsis(func) )
    return validate_printf_decl(func, rt, is_extern) ? TERR_OK2
                                                     : TERR_BAD_PRINTF;
  return TERR_OK;
}

//-----------------------------------------------------------------------------
static void process_fdecl_error(terr_info_t err, symref_t sym)
{
  switch ( err.code )
  {
    case TERR_REDECLARED:
      usererr("error: function %s redeclared at line %d (previous declaration at line %d)\n",
              sym->c_str(), sym->line(), err.data);
      break;
    case TERR_BAD_PRINTF:
      usererr("error, line %d: ellipsis \"...\" notation is is only valid when declaring "
              "builtin function: extern void printf(char format[], ...);\n",
              sym->line());
      break;
    default:
      INTERR(0);
  }
}

//-----------------------------------------------------------------------------
static void process_func_list(symvec_t *vec, primitive_t rt, bool is_extern)
{
  ASSERT(1010, vec != NULL);
  ASSERT(1025, rt != PRIM_UNKNOWN);

  for ( symvec_t::iterator i = vec->begin(); i != vec->end(); i++ )
  {
    ASSERT(1011, *i != NULL);

    symref_t sym = *i;
    terr_info_t err = validate_func_decl(*sym, rt, is_extern);

    if ( err.code > TERR_OK2 )
    {
      process_fdecl_error(err, sym);
      continue;
    }

    if ( err.code == TERR_OK2 )
      build_print_functions(sym, gsyms);

    sym->set_base(rt);

    if ( is_extern )
      sym->set_extern();

    gsyms.insert(sym);
  }
}

//-----------------------------------------------------------------------------
static terr_info_t process_array_sfx(int size, int line)
{
  terr_info_t asfx(size >= 0 ? TERR_OK2 : TERR_ASFX, size);

  if ( asfx.code > TERR_OK2 )
    usererr("error: line %d: arrays must have non-negative size\n", line);

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
      ASSERT(1070, lhs == NULL);
      return rhs->is_int_compat();
    case TNT_PLUS:
    case TNT_MINUS:
    case TNT_MULT:
    case TNT_DIV:
      ASSERT(1071, lhs != NULL);
      return lhs->is_int_compat()
          && rhs->is_int_compat();
    default:
      INTERR(1064);
  }
}

//-----------------------------------------------------------------------------
static treenode_t *process_math_expr(
    treenode_t *lhs,
    treenode_type_t type,
    treenode_t *rhs,
    int line)
{
  if ( !validate_math_expr(lhs, type, rhs) )
  {
    usererr("error: incompatible arithmetic operand, line %d\n", line);
    delete lhs; delete rhs;
    return ERRNODE;
  }

  return new treenode_t(type, lhs, rhs);
}

//-----------------------------------------------------------------------------
static treenode_t *process_for_stmt(
    treenode_t *init,
    treenode_t *cond,
    treenode_t *inc,
    treenode_t *body,
    int line)
{
  if ( cond != NULL && !cond->is_bool_compat() )
  {
    usererr("error: expression in for condition is not of type bool, line %d\n", line);
    delete init; delete cond; delete inc; delete body;
    return ERRNODE;
  }
  return new treenode_t(TNT_FOR, init, cond, inc, body);
}

//-----------------------------------------------------------------------------
static treenode_t *process_while_stmt(treenode_t *cond, treenode_t *body, int line)
{
  ASSERT(1072, cond != NULL);

  if ( !cond->is_bool_compat() )
  {
    usererr("error: expression in while condition is not of type bool, line %d\n", line);
    delete cond; delete body;
    return ERRNODE;
  }
  return new treenode_t(TNT_WHILE, cond, body);
}

//-----------------------------------------------------------------------------
static treenode_t *process_if_stmt(
    treenode_t *cond,
    treenode_t *body,
    treenode_t *el,
    int line)
{
  ASSERT(1073, cond != NULL);

  if ( !cond->is_bool_compat() )
  {
    usererr("error: expression in if condition is not of type bool, line %d\n", line);
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
    treenode_t *lhs,
    treenode_type_t type,
    treenode_t *rhs,
    int line)
{
  if ( !validate_bool_expr(lhs, type, rhs) )
  {
    usererr("error: incompatible boolean operands, line %d\n", line);
    delete lhs; delete rhs;
    return ERRNODE;
  }
  return new treenode_t(type, lhs, rhs);
}

//-----------------------------------------------------------------------------
int yyerror(const char *s)
{
  usererr("%s, line: %d\n", s, yylineno);
  return 3;
}

//---------------------------------------------------------------------------
void parse(symtab_t &_gsyms, treefuncs_t &_functions, FILE *infile)
{
  yyin = infile;

  yyparse();
  checkerr();

  _gsyms.swap(gsyms);
  _functions.swap(functions);
}
