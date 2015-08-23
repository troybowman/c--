%code top {
#define YYDEBUG !NDEBUG
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
class parser_ctx_t : public parse_results_t
{
  int mode;
#define CTX_GLOB  0
#define CTX_FUNC  1
#define CTX_STRUC 2
#define CTX_TEMP  3
  union
  {
    symtab_t *_syms; // current active symbol table
    struct // current function
    {
      symtab_t *_lvars;
      splace_t _func;
    };
    struct // current structure
    {
      symtab_t *_members;
      tplace_t _struc;
    };
  };

  void init_lsyms(const symbol_t &f)
  {
    symvec_t::const_iterator i;
    for ( i = f.params()->begin(); i != f.params()->end(); i++ )
      insert(*i);
  }

public:
  parser_ctx_t() :
      mode(CTX_GLOBAL), _syms(&gsyms),
      i(new tinfo_t(PRIM_INT)),
      c(new tinfo_t(PRIM_CHAR)),
      v(new tinfo_t(PRIM_VOID)),
      b(new tinfo_t(PRIM_BOOL)),
      s(new tinfo_t(BADOFFSET, c)) {}

  ~parser_ctx_t() { clear(); }

  void clear()
  {
    if ( mode == CTX_FUNC )
      func().~symref_t();
    else if ( mode == CTX_STRUC )
      struc().~typeref_t();
  }

  void setfunc(symref_t f)   { clear(); mode = CTX_FUNC;  _syms = new symtab_t; emplace(_func, f); init_lsyms(*f); }
  void setstruc(typeref_t s) { clear(); mode = CTX_STRUC; _syms = new memtab_t; emplace(_struc, s); }
  void settemp()             { clear(); mode = CTX_TEMP;  _syms = new symtab_t; }
  void setglobal()           { clear(); mode = CTX_GLOB;  _syms = &gsyms; }

  void trash()               { if ( mode != CTX_GLOB ) { delete syms; setglobal(); } }

  symref_t &func()     const { return deplace(_func);  }
  typeref_t &struc()   const { return deplace(_struc); }
  symtab_t *syms()     const { return _syms; }

  bool insert(symref_t s)    { return _syms->insert(s); }

  symref_t get(const std::string &key) const { return _syms->get(key); }

  typeref_t i; // int
  typeref_t c; // char
  typeref_t v; // void
  typeref_t b; // bool
  typeref_t s; // string

  // built-in print functions
  symref_t print_string;
  symref_t print_int;
  symref_t print_char;
  symref_t print_hex;
};

//---------------------------------------------------------------------------
static       void  process_var_list   (parser_ctx_t &, symvec_t *, typeref_t);
static       void  process_func_list  (parser_ctx_t &, symvec_t *, typeref_t, bool);
static       bool  process_var_decl   (parser_ctx_t &, symref_t, typeref_t);
static   symref_t  process_stmt_id    (parser_ctx_t &, const char *, int);
static treenode_t *process_stmt_var   (parser_ctx_t &, symref_t, treenode_t *, int);
static treenode_t *process_call       (parser_ctx_t &, symref_t, treenode_t *, int);
static treenode_t *process_assg       (parser_ctx_t &, treenode_t *, treenode_type_t, treenode_t *, int);
static treenode_t *process_call_ctx   (parser_ctx_t &, treenode_t *, int, bool);
static treenode_t *process_ret_stmt   (parser_ctx_t &, treenode_t *, int line);
static treenode_t *process_bool_expr  (parser_ctx_t &, treenode_t *, treenode_type_t, treenode_t *, int);
static treenode_t *process_if_stmt    (parser_ctx_t &, treenode_t *, treenode_t *, treenode_t *, int);
static treenode_t *process_while_stmt (parser_ctx_t &, treenode_t *, treenode_t *, int);
static treenode_t *process_for_stmt   (parser_ctx_t &, treenode_t *, treenode_t *, treenode_t *, treenode_t *, int);
static treenode_t *process_math_expr  (parser_ctx_t &, treenode_t *, treenode_type_t, treenode_t *, int);
static terr_info_t process_array_sfx  (parser_ctx_t &, typeref_t, int, int);
static       void  process_fdecl_error(parser_ctx_t &, terr_info_t, const symbol_t &);
static  typeref_t  process_struct_id  (parser_ctx_t &, const char *, int);
static   symref_t  process_var_id(const char *, typeref_t, typeref_t, line, uint32_t);

//---------------------------------------------------------------------------
static void func_enter(parser_ctx_t &ctx, symref_t f, typeref_t type);
static void func_leave(parser_ctx_t &ctx, treenode_t *);

//---------------------------------------------------------------------------
static symvec_t *sym_list_append(symvec_t *, symref_t);
static symvec_t *sym_list_prepend(symref_t, symvec_t *);
static symvec_t *process_param_list(symref_t, symvec_t *, symref_t);

//---------------------------------------------------------------------------
static  symref_t yydeplace(const splace_t &);
static typeref_t yydeplace(const tplace_t &);

#define EMPL(a, b) emplace(a, b)
#define DPL(a)     yydeplace(a)

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

//---------------------------------------------------------------------------
struct scanner_t
{
  // should be 'yyscan_t' instead of 'void *' but this would cause a circular
  // dependency between parser.hpp and scanner.hpp. this workaround should do
  // fine since anyways yyscan_t is an opaque c type.
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
  symvec_t *symvec;
  treenode_t *tree;
  seq_t seq;
  splace_t sym;
  tplace_t tinfo;
  name_info_t ni;
}

%token<i>   INT
%token<str> CHAR STRING MAIN ID

%token INT_TYPE CHAR_TYPE VOID STRUCT
%token WHILE RETURN EXTERN IF ELSE FOR
%token EQ NEQ LEQ GEQ AND OR ELLIPSIS
%token PEQ MEQ TEQ DEQ AEQ OEQ XEQ
%token SHL SHR

%type<sym>    var_decl func_decl param_decl ellipsis
%type<symvec> var_decls var_decl_list func_decls func_decl_list params param_decl_list
%type<tree>   func_body stmt stmt_var stmt_array_sfx expr call args op_expr else assg op_assg
%type<seq>    stmts arg_list assg_list
%type<tinfo>  typename ptr asfx struct
%type<ni>     name

%destructor { free($$); } ID MAIN
%destructor { free($$.str); } name
%destructor { delete $$; ctx.trash(); } params
%destructor { delete $$; } var_decls func_decls var_decl_list func_decl_list param_decl_list
%destructor { DPL($$); } var_decl func_decl ellipsis param_decl
%destructor { delete $$; } stmt_var stmt_array_sfx assg
%destructor { delete $$.head; } stmts arg_list assg_list
%destructor { DPL($$); } typename

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
%left '.' SPD

%start prog

%%

/*---------------------------------------------------------------------------*/
prog : prog decl   ';'
     | prog struct ';'
     | prog error  ';' { yyerrok; }
     | prog func
     | /* empty */
     ;

/*---------------------------------------------------------------------------*/
decl :        typename  var_decls { process_var_list (ctx, $2, DPL($1));        delete $2; }
     |        typename func_decls { process_func_list(ctx, $2, DPL($1), false); delete $2; }
     | EXTERN typename func_decls { process_func_list(ctx, $3, DPL($2), true);  delete $3; }
     | STRUCT ID                  { process_struct_decl(ctx, $2); free($2);  }
     ;

/*---------------------------------------------------------------------------*/
typename : INT_TYPE  { EMPL($$, ctx.i); }
         | CHAR_TYPE { EMPL($$, ctx.c); }
         | VOID      { EMPL($$, ctx.v); }
         | ID        { EMPL($$, process_struct_id(ctx, $1, lineno); free($1); }
         ;

/*---------------------------------------------------------------------------*/
var_decls : var_decl var_decl_list { $$ = sym_list_prepend(DPL($1), $2); }
          ;

var_decl : ptr name asfx
           {
             EMPL($$, process_var_id($2.str, DPL($1), DPL($3), lineno, 0));
             free($2.str);
           }
         ;

asfx : asfx '[' INT ']' { EMPL($$, process_array_sfx(ctx, DPL($1), $3, lineno)); }
     | /* empty */      { EMPL($$, NULLTYPE); }
     ;

ptr : ptr '*'     { EMPL($$, typeref_t(new tinfo_t(DPL($1)))); }
    | /* empty */ { EMPL($$, NULLTYPE); }
    ;

var_decl_list : var_decl_list ',' var_decl { $$ = sym_list_append($1, DPL($3)); }
              | /* empty */                { $$ = NULL; }
              ;

/*---------------------------------------------------------------------------*/
func_decls : func_decl func_decl_list { $$ = sym_list_prepend(DPL($1), $2); }
           ;

func_decl : ptr name '(' { ctx.settemp(); } params { ctx.trash(); } ')'
            {
              EMPL($$, symref_t(new symbol_t($2.flags, $2.str, lineno, DPL($1), $5)));
              free($2.str);
            }
            /* TODO: functions with no parameter spec (i.e. 'int func();') will leak memory,
               unless we explicity handle it here. Try to put this logic in a destructor. */
          | ptr name '(' error { free($2.str); ctx.trash(); EMPL($$, NULLREF); }
          ;

name : MAIN { $$.str = $1; $$.flags = SF_MAIN; }
     | ID   { $$.str = $1; $$.flags = 0; }
     ;

func_decl_list : func_decl_list ',' func_decl { $$ = sym_list_append($1, DPL($3)); }
               | /* empty */                  { $$ = NULL; }
               ;

/*---------------------------------------------------------------------------*/
params : param_decl param_decl_list ellipsis
         {
           $$ = process_param_list(DPL($1), $2, DPL($3));
         }
       | VOID { $$ = new symvec_t; }
       ;

ellipsis : ',' ELLIPSIS { EMPL($$, symref_t(new symbol_t(ST_ELLIPSIS))); }
         | /* empty */  { EMPL($$, NULLREF); }
         ;

param_decl : typename ptr name param_asfx
             {
               symref_t sym = process_var_id($3.str, DPL($2), DPL($4), yylineno, SF_PARAMETER);
               if ( !process_var_decl(ctx, sym, DPL($1)) )
                 sym = NULLREF;
               EMPL($$, sym);
               free($3.str);
             }
           ;

param_asfx : param_asfx '[' ']' { EMPL($$, typeref_t(new tinfo_t(BADOFFSET, DPL($1)))); }
           | /* empty */        { EMPL($$, NULLTYPE); }
           ;

param_decl_list : param_decl_list ',' param_decl { $$ = sym_list_append($1, DPL($3)); }
                | /* empty */                    { $$ = NULL; }
                ;

/*---------------------------------------------------------------------------*/
struct : STRUCT ID
         '{'
            { struct_enter(ctx, $2, lineno); free($2); }
            var_block
            { struct_leave(ctx); }
         '}'
       | error '{' { yyerrok; }
       | error '}' { yyerrok; }
       ;

/*---------------------------------------------------------------------------*/
var_block : var_block type var_decls ';' { process_var_list(ctx, $3, DPL($2)); delete $3; }
          | var_block error          ';' { yyerrok; }
          | /* empty */
          ;

/*---------------------------------------------------------------------------*/
func : type func_decl
       '{'
          { func_enter(ctx, DPL($2), DPL($1)); }
          func_body
          { func_leave(ctx, $5); }
       '}'
     | error '{' { yyerrok; }
     | error '}' { yyerrok; }
     ;

func_body : var_block stmts { $$ = $2.head; }
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
assg : expr '=' expr { $$ = process_assg(ctx, $1, TNT_ASSG, $3, lineno); }
     | expr PEQ expr { $$ = process_assg(ctx, $1, TNT_PEQ,  $3, lineno); }
     | expr MEQ expr { $$ = process_assg(ctx, $1, TNT_MEQ,  $3, lineno); }
     | expr TEQ expr { $$ = process_assg(ctx, $1, TNT_TEQ,  $3, lineno); }
     | expr DEQ expr { $$ = process_assg(ctx, $1, TNT_DEQ,  $3, lineno); }
     | expr AEQ expr { $$ = process_assg(ctx, $1, TNT_AEQ,  $3, lineno); }
     | expr OEQ expr { $$ = process_assg(ctx, $1, TNT_OEQ,  $3, lineno); }
     | expr XEQ expr { $$ = process_assg(ctx, $1, TNT_XEQ,  $3, lineno); }
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
expr : INT                  { $$ = new treenode_t($1, ctx.i); }
     | CHAR                 { $$ = new treenode_t(TNT_CHARCON, $1, ctx.c); }
     | STRING               { $$ = new treenode_t(TNT_STRCON,  $1, ctx.s); }
     | ID                   { $$ = process_expr_id(ctx, $1, lineno); free($1); }
     | call                 { $$ = process_call_ctx(ctx, $1, lineno, true); }
     | expr EQ  expr        { $$ = process_bool_expr(ctx, $1, TNT_EQ,    $3, lineno); }
     | expr NEQ expr        { $$ = process_bool_expr(ctx, $1, TNT_NEQ,   $3, lineno); }
     | expr '<' expr        { $$ = process_bool_expr(ctx, $1, TNT_LT,    $3, lineno); }
     | expr LEQ expr        { $$ = process_bool_expr(ctx, $1, TNT_LEQ,   $3, lineno); }
     | expr '>' expr        { $$ = process_bool_expr(ctx, $1, TNT_GT,    $3, lineno); }
     | expr GEQ expr        { $$ = process_bool_expr(ctx, $1, TNT_GEQ,   $3, lineno); }
     | expr AND expr        { $$ = process_bool_expr(ctx, $1, TNT_AND,   $3, lineno); }
     | expr OR  expr        { $$ = process_bool_expr(ctx, $1, TNT_OR,    $3, lineno); }
     | expr '+' expr        { $$ = process_math_expr(ctx, $1, TNT_PLUS,  $3, lineno); }
     | expr '-' expr        { $$ = process_math_expr(ctx, $1, TNT_MINUS, $3, lineno); }
     | expr '*' expr        { $$ = process_math_expr(ctx, $1, TNT_MULT,  $3, lineno); }
     | expr '/' expr        { $$ = process_math_expr(ctx, $1, TNT_DIV,   $3, lineno); }
     | expr SHL expr        { $$ = process_math_expr(ctx, $1, TNT_SHL,   $3, lineno); }
     | expr SHR expr        { $$ = process_math_expr(ctx, $1, TNT_SHR,   $3, lineno); }
     | expr '^' expr        { $$ = process_math_expr(ctx, $1, TNT_XOR,   $3, lineno); }
     | expr '&' expr        { $$ = process_math_expr(ctx, $1, TNT_BAND,  $3, lineno); }
     | expr '|' expr        { $$ = process_math_expr(ctx, $1, TNT_BOR,   $3, lineno); }
     | expr '.' name        { $$ = process_struct_lookup(ctx, $1, $3, lineno); free($3); }
     | expr SPD name        { $$ = process_spd(ctx, $1, $3, lineno); free($3); }
     | expr '[' expr ']'    { $$ = process_array_lookup(ctx, $1, $3, lineno); }
     | '-' expr %prec UNARY { $$ = process_math_expr(ctx, NULL, TNT_NEG,  $2, lineno); }
     | '!' expr %prec UNARY { $$ = process_bool_expr(ctx, NULL, TNT_NOT,  $2, lineno); }
     | '~' expr %prec UNARY { $$ = process_math_expr(ctx, NULL, TNT_BNOT, $2, lineno); }
     | '*' expr %prec UNARY { $$ = process_deref(ctx, $1, lineno); }
     | '&' expr %prec UNARY { $$ = process_addrof(ctx, $1, lineno); }
     | '(' expr ')'         { $$ = $2; }
     ;

%%

//-----------------------------------------------------------------------------
static treenode_t *process_addrof(parser_ctx_t &ctx, treenode_t *base, int line)
{
  ASSERT(0, base != NULL);

  if ( !base->has_addr() )
  {
    usererr(ctx, "error: invalid operand for addrof(&) operator, line %d\n", line);
    delete base;
    return ERRNODE;
  }

  return new treenode_t(TNT_ADDROF, typeref_t(new tinfo_t(base.tinfo)), base);
}

//-----------------------------------------------------------------------------
static type_error_t validate_array_lookup(
    const treenode_t &base
    const treenode_t &idx)
{
  if ( base.type() == TNT_ERROR || idx.type() == TNT_ERROR )
    return TERR_OK;

  const tinfo_t &t1 = *base.tinfo;
  const tinfo_t &t2 = *idx.tinfo;

  return !t1.is_array()   ? TERR_BASE
       : !t2.is_integer() ? TERR_INDEX
       :                    TERR_OK;
}

//-----------------------------------------------------------------------------
static treenode_t *process_array_lookup(
    parser_ctx_t &ctx,
    treenode_t *base,
    treenode_t *idx,
    int line)
{
  ASSERT(0, base != NULL && idx != NULL);

  type_error_t err = validate_array_lookup(*base, *idx);

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
    delete base; delete idx;
    return ERRNODE;
  }

  const tinfo_t &tinfo = *base->tinfo;

  return new treenode_t(TNT_ARRAY_LOOKUP, tinfo.subtype(), base, idx);
}

//-----------------------------------------------------------------------------
static treenode_t *process_spd(
    parser_ctx_t &ctx,
    treenode_t *base,
    const char *id,
    int line)
{
  ASSERT(0, base != NULL);

  treenode_t *deref = process_deref(ctx, base, line);

  return process_struct_lookup(ctx, deref, id, line);
}

//-----------------------------------------------------------------------------
static treenode_t *process_deref(parser_ctx_t &ctx, treenode_t *base, int line)
{
  ASSERT(0, base != NULL);

  if ( base->type() == TNT_ERROR )
    return base;

  const tinfo_t &tinfo = *base->tinfo;

  if ( !tinfo.is_ptr() )
  {
    usererr(ctx, "error: cannot deference value that is not of pointer type, line %d\n", line);
    delete base;
    return ERRNODE;
  }

  return new treenode_t(TNT_DEREF, tinfo.subtype(), base);
}

//-----------------------------------------------------------------------------
type_error_t validate_struct_lookup(
    const treenode_t &base,
    const char *id,
    symref_t &mem)
{
  if ( base.type() == TNT_ERROR )
    return TERR_OK;

  const tinfo_t &tinfo = *base.tinfo;

  if ( !tinfo.is_struct() )
    return TERR_NO_STRUCT;

  mem = tinfo.members()->get(name);

  return mem == NULL ? TERR_NO_MEM : TERR_OK;
}

//-----------------------------------------------------------------------------
static treenode_t *process_struct_lookup(
    parser_ctx_t &ctx,
    treenode_t *base,
    const char *id,
    int line)
{
  ASSERT(0, base != NULL);

  symref_t mem;

  type_error_t err = validate_struct_lookup(*base, id, mem);

  if ( err != TERR_OK )
  {
    switch ( err )
    {
      case TERR_NO_STRUCT:
        usererr(ctx, "error: request for \'%s\' in a type that is not a struct, line %d\n",
                id, line);
        break;
      case TERR_NO_MEM:
        usererr(ctx, "error: no member \'%s\' in type %s, line %d\n",
                id, base.tinfo->name().c_str(), line);
        break;
      default:
        INTERR(0);
    }
    delete base;
    return ERRNODE;
  }

  return new treenode_t(TNT_STRUCT_LOOKUP, mem, base);
}

//-----------------------------------------------------------------------------
static symref_t process_var_id(
    const char *name,
    typeref_t ptr,
    typeref_t asfx,
    int line,
    uint32_t flags)
{
  symref_t ret(new symbol_t(flags, name, line));

  if ( asfx != NULL )
    ret->set_base(asfx);

  if ( ptr != NULL )
    ret->set_base(ptr);

  return ret;
}

//-----------------------------------------------------------------------------
static typeref_t process_struct_id(parser_ctx_t &ctx, const char *name, int line)
{
  typeref_t s = ctx.structs.get(name);

  if ( s == NULL )
  {
    usererr(ctx, "error: unknown type name, line %d\n", line);
    return BADTYPE;
  }

  return s;
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
    const tinfo_t &t1 = *(*i1)->tinfo;
    const tinfo_t &t2 = *(*i2)->tinfo;

    if ( t1 != t2 )
      return false;
  }

  return true;
}

//-----------------------------------------------------------------------------
static bool has_ellipsis(const symbol_t &f)
{
  return f.is_func()
      && f.params()->size() > 0
      && f.params()->back()->st() == ST_ELLIPSIS;
}

//-----------------------------------------------------------------------------
static type_error_t validate_func_def(const symbol_t &def, symref_t prev)
{
  if ( has_ellipsis(def) )
    return prev == NULL ? TERR_PRINTF_DEF1 : TERR_PRINTF_DEF2;

  if ( prev == NULL )
    return def.tinfo->is_struct() ? TERR_RET_STRUCT : TERR_OK;

  ASSERT(1102, def.name() == prev->name());

  return !prev->is_func()                              ? TERR_REDECLARED
       :  prev->is_defined()                           ? TERR_REDEFINED
       :  prev->is_extern()                            ? TERR_EXTERN
       : !check_params(*prev->params(), *def.params()) ? TERR_PARAMS
       :  *prev->tinfo() != *def.tinfo()               ? TERR_RTN_TYPES
       :                                                 TERR_OK2;
}

//-----------------------------------------------------------------------------
static void merge_decl_and_def(symbol_t &decl, const symbol_t &def)
{
  decl.set_line(def.line());

        symvec_t &decparams = *decl.params();
  const symvec_t &defparams = *def.params();

        symvec_t::iterator i = decparams.begin();
  symvec_t::const_iterator j = defparams.begin();

  for ( ; i != decparams.end() && j != defparams.end(); i++, j++ )
  {
          symbol_t &p1 = **i;
    const symbol_t &p2 = **j;

    p1.set_name(p2.c_str());
    p1.set_line(p2.line());
  }
}

//-----------------------------------------------------------------------------
static void func_enter(parser_ctx_t &ctx, symref_t f, typeref_t rt)
{
  ASSERT(1000, f != NULL);
  ASSERT(1004, f->is_func());

  f->set_base(rt);
  symref_t prev = ctx.gsyms.get(f->name());
  terr_info_t err(validate_func_def(*f, prev));

  switch ( err.code )
  {
    case TERR_OK:
      ctx.insert(f);
      break;
    case TERR_PRINTF_DEF1:
      process_fdecl_error(ctx, err, *f);
      break;
    case TERR_PRINTF_DEF2:
    case TERR_RET_UDT:
    case TERR_REDECLARED:
    case TERR_REDEFINED:
    case TERR_EXTERN:
    case TERR_RTN_TYPES:
      err.data = prev->line();
      process_fdecl_error(ctx, err, *f);
      // no break
    case TERR_OK2:
      if ( prev->is_func() )
      {
        merge_decl_and_def(*prev, *f);
        f = prev;
      }
      break;
    default:
      INTERR(0);
  }

  ctx.setfunc(f);
}

//-----------------------------------------------------------------------------
static void func_leave(parser_ctx_t &ctx, treenode_t *root)
{
  symref_t f = ctx.func();

  f->set_defined();
  f->set_lvars(ctx.syms());

  if ( !f->is_prim(PRIM_VOID) && !f->is_ret_resolved() )
    usererr(ctx, "error: non-void funcion %s must return a value\n", f->c_str());

  ctx.trees.push_back(new stx_tree_t(f, root));

  ctx.setglobal();
}

//-----------------------------------------------------------------------------
static void process_struct_decl(parser_ctx_t &ctx, const char *id, int line)
{
  if ( ctx.structs.get(id) == NULL )
    ctx.structs.insert(typeref_t(new tinfo_t(id, line)));
}

//-----------------------------------------------------------------------------
static void struct_enter(parser_ctx_t &ctx, const char *name, int line)
{
  typeref_t s = ctx.structs.get(name);

  if ( s != NULL )
  {
    if ( s->is_complete() )
    {
      usererr(ctx, "error: type %s redefined at line %d (previous definition at line %d)\n",
              name, line, s->line());

      s = BADTYPE;
    }
    s->set_line(line);
  }
  else
  {
    s = typeref_t(new tinfo_t(name, line));
    ctx.structs.insert(s);
  }

  ctx.setstruc(s);
}

//-----------------------------------------------------------------------------
static void struct_leave(parser_ctx_t &ctx)
{
  memtab_t *members = (memtab_t *)ctx.syms();

  typeref_t s = ctx.struc();

  s->set_members(members);

  ctx.setglobal();
}

//-----------------------------------------------------------------------------
static type_error_t validate_ret_stmt(const parser_ctx_t &ctx, const treenode_t *expr)
{
  const tinfo_t &rt = ctx.func()->tinfo();

  if ( rt.is_prim(PRIM_VOID) )
    return expr != NULL ? TERR_BAD_RET : TERR_OK;
  else
    return expr == NULL                 ? TERR_NO_RET
         : !rt.is_compat(expr->tinfo()) ? TERR_RET_EXPR
         :                                TERR_OK2;
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
static bool check_arg(const tinfo_t &tinfo, const treenode_t &expr)
{
  if ( expr.type() == TNT_ERROR )
    return true;

  return tinfo.is_compatible(*expr.tinfo);
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
    if ( !check_arg(*params[i]->tinfo(), **ti) )
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

  treenode_t *node = new treenode_t(TNT_STRCON, str, ctx.s);
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

  treenode_t *node = new treenode_t(TNT_STRCON, strdup(EMPTYSTRING), ctx.s);
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
        const tinfo_t &tinfo = *arg->tinfo;

        switch ( c )
        {
          case FMTD:
            ok = tinfo.is_integer();
            func = ctx.print_int;
            break;
          case FMTC:
            ok = tinfo.is_integer();
            func = ctx.print_char;
            break;
          case FMTX:
            ok = tinfo.is_integer();
            func = ctx.print_hex;
            break;
          case FMTS:
            ok = tinfo.is_array(PRIM_CHAR);
            func = ctx.print_string;
            break;
          default:
            INTERR(0);
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
    typeref_t type,
    symtab_t &gsyms)
{
  symvec_t *params = new symvec_t;

  symbol_t param(new symbol_t(SF_PARAMETER, pname, -1));
  param->set_type(type);

  params->push_back(param);

  symref_t bfunc(new symbol_t(SF_EXTERN, name, -1, params));
  bfunc->type()->set_prim(PRIM_VOID);

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
        new treenode_t(TNT_ARG, fmtarg.expr);

    treenode_t *call = new treenode_t(TNT_CALL, fmtarg.func, argtree);
    seq_append(seq, call, TNT_STMT);
  }

  return seq.head == NULL ? ERRNODE : new treenode_t(TNT_PRINTF, printf, seq.head);
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

  // original TNT_ARG sequence is no longer needed; it has been split into fmtargs
  cleanup_fmtarg_list(allargs);

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
    return ERRNODE;
  }

  return build_printf_tree(printf, fmtargs);
}

//-----------------------------------------------------------------------------
static treenode_t *process_call(
    parser_ctx_t &ctx,
    symref_t f,
    treenode_t *args,
    int line)
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

  return new treenode_t(TNT_CALL, f, args);
}

//-----------------------------------------------------------------------------
static type_error_t validate_call_ctx(const treenode_t &call, bool expr)
{
  if ( call.type() == TNT_ERROR )
    return TERR_OK;

  ASSERT(1043, call.type() == TNT_CALL || call.type() == TNT_PRINTF);

  const tinfo_t &rt = call.tinfo();

  if ( expr )
    return  rt.is_prim(PRIM_VOID) ? TERR_VOID_EXPR : TERR_OK;
  else
    return !rt.is_prim(PRIM_VOID) ? TERR_PROCEDURE : TERR_OK;
}

//-----------------------------------------------------------------------------
static treenode_t *process_call_ctx(
    parser_ctx_t &ctx,
    treenode_t *call,
    int line,
    bool expr)
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
static inline symref_t yydeplace(const splace_t &sp)
{
  symref_t &yyref = deplace(sp);
  symref_t ret = yyref;
  yyref.~symref_t();
  return ret;
}

//-----------------------------------------------------------------------------
static inline typeref_t yydeplace(const tplace_t &tp)
{
  typeref_t &yytype = deplace(tp);
  typeref_t ret = yytype;
  yytype.~typeref_t();
  return ret;
}

//-----------------------------------------------------------------------------
static symref_t process_stmt_id(parser_ctx_t &ctx, const char *id, int line)
{
  symref_t sym = ctx.get(id); // first check local symbols
  if ( sym == NULL )
  {
    sym = ctx.gsyms.get(id); // now global symbols
    if ( sym == NULL )
      usererr(ctx, "error: use of undeclared identifier %s at line %d\n", id, line);
  }
  return sym;
}

//-----------------------------------------------------------------------------
static treenode_t *process_expr_id(parser_ctx_t &ctx, const char *id, line)
{
  symref_t sym = process_stmt_id(ctx, id, line);

  if ( sym == NULL )
    return ERRNODE;

  if ( sym->is_func() )
  {
    usererr(ctx, "error: symbol with function type used in an expression, line %d\n", line);
    return ERRNODE;
  }

  return new treenode_t(TNT_VAR, sym);
}

//-----------------------------------------------------------------------------
static bool validate_assg(const treenode_t &lhs, const treenode_t &rhs)
{
  if ( lhs.type() == TNT_ERROR || rhs.type() == TNT_ERROR )
    return TERR_OK;

  if ( !lhs.has_addr() )
    return TERR_ASSG_LVAL;

  const tinfo_t &lt = *lhs.tinfo;
  const tinfo_t &rt = *ths.tinfo;

  return lt.is_array()         ? TERR_ASSG_ARRAY
       : lt.is_struct()        ? TERR_ASSG_STRUCT
       : !lt.is_compatible(rt) ? TERR_ASSG_COMPAT
       :                         TERR_OK;
}

//-----------------------------------------------------------------------------
static treenode_t *process_assg(
    parser_ctx_t &ctx,
    treenode_t *lhs,
    treenode_type_t type,
    treenode_t *rhs,
    int line)
{
  ASSERT(1046, lhs != NULL);
  ASSERT(1047, rhs != NULL);

  type_error_t err = validate_assg(*lhs, *rhs);

  if ( err != TERR_OK )
  {
    switch ( err )
    {
      case TERR_ASSG_LVAL:
        usererr(ctx, "error: lhs is not assignable, line %d\n", line);
        break;
      case TERR_ASSG_ARRAY:
        usererr(ctx, "error: cannot assign to an array, line %d\n", line);
        break;
      case TERR_ASSG_ARRAY:
        usererr(ctx, "error: cannot assign to a structure, line %d\n", line);
        break;
      case TERR_ASSG_COMPAT:
        usererr(ctx, "error: assignment operands are not compatible, line %d\n", line);
        break;
      default:
        INTERR(0);
    }
    delete lhs; delete rhs;
    return ERRNODE;
  }

  return new treenode_t(type, lhs, rhs);
}

//-----------------------------------------------------------------------------
static bool is_var_complete(const symbol_t &var, const tinfo_t &tinfo)
{
  return var.has_ptr() || tinfo.is_complete();
}

//-----------------------------------------------------------------------------
static terr_info_t validate_var_decl(
    const parser_ctx_t &ctx,
    const symbol_t &sym,
    const tinfo_t &base)
{
  if ( !is_var_complete(sym, base) )
    return TERR_INCOMPLETE;

  symref_t prev = ctx.get(sym.name());
  if ( prev != NULL )
    return terr_info_t(TERR_REDECLARED, prev->line());

  return TERR_OK;
}

//-----------------------------------------------------------------------------
static bool process_var_decl(parser_ctx_t &ctx, symref_t var, typeref_t base)
{
  ASSERT(1105, var != NULL && base != NULL);

  terr_info_t err = validate_var_decl(ctx, *var, *base);

  if ( err.code != TERR_OK )
  {
    switch ( err.code )
    {
      case TERR_REDECLARED:
        usererr(ctx, "error: variable %s redeclared at line %d (previous declaration at line %d)\n",
                     var->c_str(), var->line(), err.data);
        return false;
      case TERR_BAD_VOID:
        usererr(ctx, "error: cannot declare variable of type void, line %d\n",
                     var->line());
        return false;
      case TERR_INCOMPLETE:
        usererr(ctx, "error: cannot declare variable of incomplete type %s, line %d\n",
                     base->name().c_str(), var->line());
        break;
      default:
        INTERR(0);
    }
    return false;
  }

  var->set_base(base);
  ctx.insert(sym);

  return true;
}

//-----------------------------------------------------------------------------
static void process_var_list(parser_ctx_t &ctx, symvec_t *vec, typeref_t base)
{
  ASSERT(1106, vec != NULL);

  for ( symvec_t::iterator i = vec->begin(); i != vec->end(); i++ )
  {
    symref_t var = *i;
    ASSERT(1107, var != NULL);

    if ( process_var_decl(ctx, var, base) )
      // at this point, we should have a variable with a valid size
      var->tinfo->complete();
  }
}

//-----------------------------------------------------------------------------
static bool validate_printf_decl(
    const symbol_t &func,
    const tinfo_t &rt,
    bool is_extern)
{
  const symvec_t &params = *func.params();

  return func.name() == "printf"
      && rt->is_prim(PRIM_VOID)
      && is_extern
      && params.size() == 2
      && params.front()->is_array(PRIM_CHAR)
      && params.back()->st() == ST_ELLIPSIS;
}

//-----------------------------------------------------------------------------
static terr_info_t validate_func_decl(
    const parser_ctx_t &ctx,
    const symbol_t &func,
    const tinfo_t &rt,
    bool is_extern)
{
  if ( rt.is_struct() )
    return TERR_RET_STRUCT;

  symref_t prev = ctx.get(func.name());
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
    case TERR_INCOMPLETE:
      usererr(ctx, "error: function %s has incomplete return type, line %d\n",
                   sym.c_str(), sym.line());
      break;
    default:
      INTERR(0);
  }
}

//-----------------------------------------------------------------------------
static void build_print_functions(parser_ctx_t &ctx, symref_t printf)
{
  ASSERT(1108, printf != NULL);
  printf->set_printf();

  ctx.print_int    = build_print_function(BI_PRINT_INT,  "val", ctx.i, ctx.gsyms);
  ctx.print_hex    = build_print_function(BI_PRINT_HEX,  "hex", ctx.i, ctx.gsyms);
  ctx.print_char   = build_print_function(BI_PRINT_CHAR, "c",   ctx.c, ctx.gsyms);

  typeref_t array(new type_t(BADOFFSET));
  array->set_base(ctx.c);

  ctx.print_string = build_print_function(BI_PRINT_STRING, "str", array, ctx.gsyms);
}

//-----------------------------------------------------------------------------
static void process_func_list(
    parser_ctx_t &ctx,
    symvec_t *vec,
    typeref_t rt,
    bool is_extern)
{
  ASSERT(1010, vec != NULL);
  ASSERT(1025, rt  != NULL);

  for ( symvec_t::iterator i = vec->begin(); i != vec->end(); i++ )
  {
    ASSERT(1011, *i != NULL);

    symref_t sym = *i;
    terr_info_t err = validate_func_decl(ctx, *sym, *rt, is_extern);

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

    ctx.insert(sym);
  }
}

//-----------------------------------------------------------------------------
static typeref_t process_array_sfx(
    parser_ctx_t &ctx,
    typeref_t subtype,
    offset_t length,
    int line)
{
  if ( length == 0 )
  {
    usererr(ctx, "error, line %d: arrays must have positive length\n", line);
    return NULLTYPE;
  }

  return typeref_t(new tinfo_t(subtype, length));
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
  ASSERT(0, rhs->has_ti());

  switch ( type )
  {
    case TNT_NEG:
    case TNT_BNOT:
      ASSERT(1070, lhs == NULL);
      return rhs->tinfo->is_integer();
    case TNT_PLUS:
    case TNT_MINUS:
      {
        ASSERT(0, lhs != NULL);
        ASSERT(0, lhs->has_ti());

        const tinfo_t &l = *lhs->tinfo;
        const tinfo_t &r = *rhs->tinfo;

        return l.is_ptr() ? r.is_integer()
             : r.is_ptr() ? l.is_integer()
             : l.is_integer() && r.is_integer();
      }
    case TNT_MULT:
    case TNT_DIV:
    case TNT_SHL:
    case TNT_SHR:
    case TNT_BAND:
    case TNT_BOR:
    case TNT_XOR:
      ASSERT(1071, lhs != NULL);
      ASSERT(0, lhs->has_ti());
      return lhs->tinfo->is_integer()
          && rhs->tinfo->is_integer();
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
    usererr(ctx, "error: incompatible arithmetic operands, line %d\n", line);
    delete lhs; delete rhs;
    return ERRNODE;
  }

  typeref_t tinfo = lhs != NULL && lhs->tinfo->is_ptr()
                  ? lhs->tinfo
                  : rhs->tinfo;

  return new treenode_t(type, tinfo, lhs, rhs);
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
  if ( cond != NULL && !cond->tinfo->is_bool() )
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

  if ( !cond->tinfo->is_bool() )
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

  if ( !cond->tinfo->is_bool() )
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
      return rhs->tinfo->is_bool();
    case TNT_EQ:
    case TNT_NEQ:
    case TNT_LT:
    case TNT_LEQ:
    case TNT_GT:
    case TNT_GEQ:
      ASSERT(1050, lhs != NULL);
      return lhs->tinfo->is_comparable()
          && rhs->tinfo->is_comparable();
    case TNT_AND:
    case TNT_OR:
      ASSERT(1051, lhs != NULL);
      return lhs->tinfo->is_bool()
          && rhs->tinfo->is_bool();
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

  return new treenode_t(type, ctx.b, lhs, rhs);
}

//-----------------------------------------------------------------------------
int yyerror(void *scanner, parser_ctx_t &ctx, const char *s)
{
  usererr(ctx, "%s, line: %d\n", s, lineno);
  return 3;
}

//-----------------------------------------------------------------------------
static void usererr(parser_ctx_t &ctx, const char *format, ...)
{
  va_list va;
  va_start(va, format);

  char buf[MAXERRLEN];
  vsnprintf(buf, MAXERRLEN, format, va);
  ctx.errmsgs.push_back(buf);

  va_end(va);
}

//---------------------------------------------------------------------------
void parse_results_t::swap(parse_results_t &res)
{
  gsyms.swap(res.gsyms);
  trees.swap(res.trees);
  errmsgs.swap(res.errmsgs);
}

//---------------------------------------------------------------------------
bool parse(parse_results_t &res, FILE *infile)
{
  ASSERT(1101, infile);
  /*yydebug = 1;*/

  parser_ctx_t ctx;
  scanner_t scanner(infile);

  yyparse(scanner.yyscan, ctx);

  res.swap(ctx);

  return res.errmsgs.empty();
}
