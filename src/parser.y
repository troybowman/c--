%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <parse.h>
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
static struct
{
  int mode;
#define CTX_GLOBAL 0
#define CTX_LOCAL  1
#define CTX_TEMP   2
  union
  {
    symtab_t *syms; // pointer to currently active symbol table
    symbol_t *func; // pointer to function we are currently parsing
  };

  void setglobal()           { mode = CTX_GLOBAL; syms = &gsyms; }
  void setlocal(symbol_t *f) { mode = CTX_LOCAL;  func = f; }
  void settemp()             { mode = CTX_TEMP;   syms = new symtab_t(); }
  void trash()               { delete syms; setglobal(); }

  void insert(symbol_t *sym)
  {
    if ( mode == CTX_GLOBAL || mode == CTX_TEMP )
      syms->insert(sym);
    else
      func->symbols()->insert(sym);
  }

  symbol_t *get(const std::string &key)
  {
    return mode == CTX_GLOBAL || mode == CTX_TEMP
         ? syms->get(key)
         : func->symbols()->get(key);
  }
} ctx;

//---------------------------------------------------------------------------
static       void  process_var_list(symvec_t *, primitive_t);
static       void  process_func_list(symvec_t *, primitive_t, bool);
static       void  process_var_decl(symbol_t *, primitive_t);
static   symbol_t *process_var_id(const char *, int, array_sfx_t, uint32_t);
static   symbol_t *process_stmt_id(const char *, int);
static treenode_t *process_stmt_var(const symbol_t *, treenode_t *, int);
static treenode_t *process_assg(treenode_t *, treenode_t *, int);
static treenode_t *process_call(symbol_t *, treenode_t *, int);
static treenode_t *process_call_ctx(treenode_t *, int, bool);
static treenode_t *process_ret_stmt(treenode_t *, int line);
static treenode_t *process_bool_expr(treenode_t *, treenode_type_t, treenode_t *, int);
static treenode_t *process_if_stmt(treenode_t *, treenode_t *, treenode_t *, int);
static treenode_t *process_while_stmt(treenode_t *, treenode_t *, int);
static treenode_t *process_for_stmt(treenode_t *, treenode_t *, treenode_t *, treenode_t *, int);
static treenode_t *process_math_expr(treenode_t *, treenode_type_t, treenode_t *, int);
static   symvec_t *process_param_list(symbol_t *, symvec_t *, symbol_t *);
static array_sfx_t process_array_sfx(int, int);
static       void  process_fdecl_error(fdecl_res_t, symbol_t *);
static   symvec_t *sym_list_append(symvec_t *, symbol_t *);
static   symvec_t *sym_list_prepend(symbol_t *, symvec_t *);
static       void  func_enter(symbol_t *, primitive_t);
static       void  func_leave(treenode_t *);
%}

/*---------------------------------------------------------------------------*/
%union
{
  int i;
  char *str;
  primitive_t prim;
  symbol_t *sym;
  symvec_t *symvec;
  treenode_t *tree;
  symtab_t *symtab;
  array_sfx_t asfx;
  seq_t seq;
}

%token<i>   INT
%token<str> CHAR STRING ID

%token INT_TYPE CHAR_TYPE VOID
%token WHILE RETURN EXTERN IF ELSE FOR
%token EQ NEQ LEQ GEQ AND OR ELLIPSIS

%type<prim>    type
%type<sym>     var_decl func_decl param_decl ellipsis
%type<symvec>  var_decls var_decl_list func_decls func_decl_list params param_decl_list
%type<tree>    func_body stmt stmt_var stmt_array_sfx expr call args op_expr else assg op_assg
%type<asfx>    decl_array_sfx param_array_sfx
%type<seq>     stmts arg_list

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
var_decls : var_decl var_decl_list { $$ = sym_list_prepend($1, $2); }
          ;

var_decl : ID decl_array_sfx
           {
             $$ = process_var_id($1, yylineno, $2, 0);
             free($1);
           }
         ;

decl_array_sfx : '[' INT ']' { $$ = process_array_sfx($2, yylineno); }
               | /* empty */ { $$.code = ASFX_NONE; }
               ;

var_decl_list : var_decl_list ',' var_decl { $$ = sym_list_append($1, $3); }
              | /* empty */                { $$ = NULL; }
              ;

/*---------------------------------------------------------------------------*/
func_decls : func_decl func_decl_list { $$ = sym_list_prepend($1, $2); }
           ;

func_decl : ID '(' { ctx.settemp(); } params { ctx.trash(); } ')'
            {
              $$ = new symbol_t(0, $1, yylineno, $4);
              free($1);
            }
          ;

func_decl_list : func_decl_list ',' func_decl { $$ = sym_list_append($1, $3); }
               | /* empty */                  { $$ = NULL; }
               ;

/*---------------------------------------------------------------------------*/
params : param_decl param_decl_list ellipsis { $$ = process_param_list($1, $2, $3); }
       | VOID { $$ = new symvec_t(); }
       ;

ellipsis : ',' ELLIPSIS { $$ = new symbol_t(ST_ELLIPSIS); }
         | /* empty */  { $$ = NULL; }
         ;

param_decl : type ID param_array_sfx
             {
               symbol_t *sym = process_var_id($2, yylineno, $3, SF_PARAMETER);
               if ( sym != NULL )
                 process_var_decl(sym, $1);
               $$ = sym;
               free($2);
             }
           ;

param_array_sfx : '[' ']'     { $$.code = ASFX_OK; $$.size = BADOFFSET; }
                | /* empty */ { $$.code = ASFX_NONE; }
                ;

param_decl_list : param_decl_list ',' param_decl { $$ = sym_list_append($1, $3); }
                | /* empty */                    { $$ = NULL; }
                ;

/*---------------------------------------------------------------------------*/
func : type func_decl
       '{'
          { func_enter($2, $1); }
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
         symbol_t *sym = process_stmt_id($1, yylineno);
         $$ = sym != NULL
            ? process_call(sym, $3, yylineno)
            : ERRNODE;
         free($1);
       }
     ;

args : expr arg_list
       {
         // append arg_list to 1st arg
         treenode_t *head = new treenode_t(TNT_ARG, $1, NULL);
         if ( $2.head != NULL )
           head->children[SEQ_NEXT] = $2.head;
         $$ = head;
       }
     | /* empty */ { $$ = NULL; }
     ;

arg_list : arg_list ',' expr { $$ = seq_append($1, $3, TNT_ARG); }
         | /* empty */       { $$.head = NULL; $$.tail = NULL; }
         ;

/*---------------------------------------------------------------------------*/
stmt_var : ID stmt_array_sfx
           {
             symbol_t *sym = process_stmt_id($1, yylineno);
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
     | expr EQ  expr        { $$ = process_bool_expr($1, TNT_EQ,    $3, yylineno); }
     | expr NEQ expr        { $$ = process_bool_expr($1, TNT_NEQ,   $3, yylineno); }
     | expr '<' expr        { $$ = process_bool_expr($1, TNT_LT,    $3, yylineno); }
     | expr LEQ expr        { $$ = process_bool_expr($1, TNT_LEQ,   $3, yylineno); }
     | expr '>' expr        { $$ = process_bool_expr($1, TNT_GT,    $3, yylineno); }
     | expr GEQ expr        { $$ = process_bool_expr($1, TNT_GEQ,   $3, yylineno); }
     | expr AND expr        { $$ = process_bool_expr($1, TNT_AND,   $3, yylineno); }
     | expr OR  expr        { $$ = process_bool_expr($1, TNT_OR,    $3, yylineno); }
     | expr '+' expr        { $$ = process_math_expr($1, TNT_PLUS,  $3, yylineno); }
     | expr '-' expr        { $$ = process_math_expr($1, TNT_MINUS, $3, yylineno); }
     | expr '*' expr        { $$ = process_math_expr($1, TNT_MULT,  $3, yylineno); }
     | expr '/' expr        { $$ = process_math_expr($1, TNT_DIV,   $3, yylineno); }
     | '!' expr %prec UNARY { $$ = process_bool_expr(NULL, TNT_NOT, $2, yylineno); }
     | '-' expr %prec UNARY { $$ = process_math_expr(NULL, TNT_NEG, $2, yylineno); }
     | '(' expr ')'         { $$ = $2; }
     ;

%%

//-----------------------------------------------------------------------------
static symbol_t *process_var_id(const char *name, int line, array_sfx_t asfx, uint32_t flags)
{
  if ( asfx.code == ASFX_ERROR )
    return NULL;

  return asfx.code == ASFX_NONE
       ? new symbol_t(flags, name, line)
       : new symbol_t(flags, name, line, asfx.size);
}

//-----------------------------------------------------------------------------
static bool check_params(const symvec_t &p1, const symvec_t &p2)
{
  if ( p1.size() != p2.size() )
    return false;

  for ( symvec_t::const_iterator i1 = p1.begin(), i2 = p2.begin();
        i1 != p1.end() && i2 != p2.end();
        i1++, i2++)
  {
    symbol_t *s1 = *i1;
    symbol_t *s2 = *i2;

    if ( s1->type() != s2->type() || s1->base() != s2->base() )
      return false;
  }
  return true;
}

//-----------------------------------------------------------------------------
static col_res_t validate_collision(const symbol_t &prev, const symbol_t &sym)
{
  ASSERT(1001, prev.name() == sym.name());

  return !prev.is_func()                              ? COL_REDECL
       :  prev.is_extern()                            ? COL_EXT
       :  prev.is_defined()                           ? COL_REDEF
       : !check_params(*prev.params(), *sym.params()) ? COL_PARAMS
       :  prev.base() != sym.base()                   ? COL_RET
       :                                                COL_OK;
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
static void process_col_err(col_res_t res, const symbol_t &f, const symbol_t &prev)
{
  switch ( res )
  {
    case COL_REDEF:
      usererr("error: function %s redefined at line %d "
              "(previous definition starts at line %d)\n",
              f.c_str(), f.line(), prev.line());
      break;
    case COL_REDECL:
      usererr("error: symbol %s redeclared as a function at line %d "
              "(previous declaration at line %d)\n",
              f.c_str(), f.line(), prev.line());
      break;
    case COL_PARAMS:
      usererr("error: parameters in definition of function %s at line %d "
              "do not match the parameters in its declaration at line %d\n",
              f.c_str(), f.line(), prev.line());
      break;
    case COL_RET:
      usererr("error: return type for function %s at line %d "
              "does not match the return type in its declaration at line %d\n",
              f.c_str(), f.line(), prev.line());
      break;
    case COL_EXT:
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
static void func_enter(symbol_t *f, primitive_t rt)
{
  ASSERT(1004, f != NULL);
  ASSERT(1000, f->is_func());

  if ( has_ellipsis(*f) )
  {
    process_fdecl_error(FDECL_BAD_PRINTF, f);
    purge_and_exit(FATAL_FUNCDEF);
  }

  f->set_base(rt);

  symbol_t *prev = gsyms.get(f->name());

  if ( prev != NULL )
  {
    col_res_t res = validate_collision(*prev, *f);

    if ( res != COL_OK )
    {
      process_col_err(res, *f, *prev);
      // these errors invalidate an entire function definition.
      // we do not try to recover from them
      purge_and_exit(FATAL_FUNCDEF);
    }

    // definition provides param names/line #s that are actually used
    set_decl_srcinfo(*prev, *f);
    delete f;
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
  symbol_t *f = ctx.func;

  f->set_defined();

  if ( f->base() != PRIM_VOID && !f->is_ret_resolved() )
    usererr("error: non-void funcion %s must return a value\n", f->c_str());

  functions.push_back(treefunc_t(f, tree));

  ctx.setglobal();
}

//-----------------------------------------------------------------------------
static ret_res_t validate_ret_stmt(const treenode_t *expr)
{
  if ( ctx.func->base() == PRIM_VOID )
    return expr != NULL ? RET_EXTRA : RET_OK;
  else
    return expr == NULL           ? RET_MISSING
         : !expr->is_int_compat() ? RET_INCOMPAT
         :                          RET_OK_RESOLVED;
}

//-----------------------------------------------------------------------------
static treenode_t *process_ret_stmt(treenode_t *expr, int line)
{
  ret_res_t res = validate_ret_stmt(expr);

  if ( res < RET_OK )
  {
    switch ( res )
    {
      case RET_MISSING:
        usererr("error: line %d - return statements in a non-void function "
                "must return a value\n", line);
        break;
      case RET_EXTRA:
        usererr("error: line %d - return statements in a void function "
                "must not return a value\n", line);
        break;
      case RET_INCOMPAT:
        usererr("error: line %d - return value is not compatible "
                "with function's return type\n", line);
        break;
      default:
        INTERR(1036);
    }
    delete expr;
    return ERRNODE;
  }

  if ( res == RET_OK_RESOLVED )
    ctx.func->set_ret_resolved();

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
      if ( expr.type == TNT_STRCON )
      {
        return param.base() == PRIM_CHAR;
      }
      else if ( expr.type == TNT_SYMBOL )
      {
        return expr.sym->is_array()
            && expr.sym->base() == param.base();
      }
      return false;

    default:
      INTERR(1031);
  }
}

//-----------------------------------------------------------------------------
static call_res_t validate_call(const symbol_t &f, const treenode_t *args)
{
  if ( !f.is_func() )
    return CALL_NOFUNC;

  const symvec_t &params = *f.params();
  size_t nparams = params.size();
  size_t nargs   = count_args(args);

  if ( nparams != nargs )
    return call_res_t(CALL_NUMARGS, nargs);

  tree_iterator_t ti(args);
  for ( size_t i = 0; *ti != NULL && i < nparams; ti++, i++ )
  {
    if ( !check_arg(*params[i], **ti) )
      return call_res_t(CALL_BADARG, i+1);
  }

  return CALL_OK;
}

//-----------------------------------------------------------------------------
static treenode_t *process_call(symbol_t *f, treenode_t *args, int line)
{
  ASSERT(1042, f != NULL);

  if ( f->is_builtin_printf() )
    return process_printf_call(f, args, line);

  call_res_t res = validate_call(*f, args);

  if ( res.code != CALL_OK )
  {
    switch ( res.code )
    {
      case CALL_NUMARGS:
        usererr("error: expected %d arguments for function %s, %d were provided. line %d\n",
                f->params()->size(), f->c_str(), res.info, line);
        break;
      case CALL_BADARG:
        usererr("error: argument %d to function %s is of incompatible type, line %d\n",
                res.info, f->c_str(), line);
        break;
      case CALL_NOFUNC:
        usererr("error: symbol %s used a function but is not of function type, line %d\n",
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
static cctx_res_t validate_call_ctx(const treenode_t &call, bool expr)
{
  if ( call.type == TNT_ERROR )
    return CCTX_OK;

  ASSERT(1043, call.type == TNT_CALL || call.type == TNT_PRINTF);

  primitive_t rt = call.sym->base();

  if ( expr )
    return rt == PRIM_VOID ? CCTX_EXPR : CCTX_OK;
  else
    return rt != PRIM_VOID ? CCTX_STMT : CCTX_OK;
}

//-----------------------------------------------------------------------------
static treenode_t *process_call_ctx(treenode_t *call, int line, bool expr)
{
  ASSERT(1044, call != NULL);

  cctx_res_t res = validate_call_ctx(*call, expr);

  if ( res != CCTX_OK )
  {
    switch ( res )
    {
      case CCTX_EXPR:
        usererr("error: line %d - function %s called as part of an expression "
                "but does not return a value\n",
                line, call->sym->c_str());
        break;
      case CCTX_STMT:
        usererr("error: line %d - function %s called as a standalone statement "
                "but does not have return type void\n",
                line, call->sym->c_str());
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
seq_t &seq_append(seq_t &seq, const treenode_t *cur, treenode_type_t type)
{
  ASSERT(1029, is_seq_type(type));

  treenode_t *to_app = new treenode_t(type, cur, NULL);

  if ( seq.head == NULL )
    seq.head = to_app;
  else
    seq.tail->children[SEQ_NEXT] = to_app;

  seq.tail = to_app;
  return seq;
}

//-----------------------------------------------------------------------------
static symbol_t *process_stmt_id(const char *id, int line)
{
  std::string key(id);
  symbol_t *sym = ctx.get(key); // first check local symbols
  if ( sym == NULL )
  {
    sym = gsyms.get(key); // now global symbols
    if ( sym == NULL )
      usererr("error: use of undeclared identifier %s at line %d\n", key.c_str(), line);
  }
  return sym;
}

//-----------------------------------------------------------------------------
static lookup_res_t validate_array_lookup(const symbol_t &sym, const treenode_t &idx)
{
  return !sym.is_array()      ? AL_ERR_BASE
       : !idx.is_int_compat() ? AL_ERR_IDX
       :                        AL_OK;
}

//-----------------------------------------------------------------------------
static treenode_t *process_stmt_var(const symbol_t *sym, treenode_t *idx, int line)
{
  ASSERT(1045, sym != NULL);

  if ( idx == NULL )
    return new treenode_t(TNT_SYMBOL, sym);

  lookup_res_t res = validate_array_lookup(*sym, *idx);

  if ( res != AL_OK )
  {
    switch ( res )
    {
      case AL_ERR_BASE:
        usererr("error: symbol %s used as an array but is not of array type, line %d\n",
                sym->c_str(), line);
        break;
      case AL_ERR_IDX:
        usererr("error: expression for array index is not of integer type, line %d\n", line);
        break;
      default:
        INTERR(1034);
    }
    delete idx;
    return ERRNODE;
  }

  return new treenode_t(TNT_ARRAY_LOOKUP, sym, idx);
}

//-----------------------------------------------------------------------------
static bool validate_assg(const treenode_t &lhs, const treenode_t &rhs)
{
  if ( lhs.type == TNT_ERROR || rhs.type == TNT_ERROR )
    return true;

  bool lhs_valid = (lhs.type == TNT_SYMBOL && lhs.sym->is_prim())
                 || lhs.type == TNT_ARRAY_LOOKUP;

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
    // TODO delete lhs, rhs
    return ERRNODE;
  }

  return new treenode_t(TNT_ASSG, lhs, rhs);
}

//-----------------------------------------------------------------------------
static vdecl_res_t validate_var_decl(const symbol_t &sym, primitive_t type)
{
  ASSERT(0, type != PRIM_UNKNOWN);

  if ( type == PRIM_VOID )
    return VDECL_BAD_VOID;

  symbol_t *prev = ctx.get(sym.name());
  if ( prev != NULL )
    return vdecl_res_t(VDECL_REDECL, prev->line());

  return VDECL_OK;
}

//-----------------------------------------------------------------------------
static void process_var_decl(symbol_t *sym, primitive_t type)
{
  ASSERT(0, sym != NULL);

  vdecl_res_t res = validate_var_decl(*sym, type);

  if ( res.code != VDECL_OK )
  {
    switch ( res.code )
    {
      case VDECL_REDECL:
        usererr("error: variable %s redeclared at line %d (previous declaration at line %d)\n",
                sym->c_str(), sym->line(), res.info);
        break;
      case VDECL_BAD_VOID:
        usererr("error: void type is only valid for parameter declarations, line %d\n", sym->line());
        break;
      default:
        INTERR(0);
    }
    delete sym;
    return;
  }

  sym->set_base(type);
  ctx.insert(sym);
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
static fdecl_res_t validate_func_decl(const symbol_t &func, primitive_t rt, bool is_extern)
{
  symbol_t *prev = gsyms.get(func.name());
  if ( prev != NULL )
    return fdecl_res_t(FDECL_REDECL, prev->line());

  if ( has_ellipsis(func) )
    return validate_printf_decl(func, rt, is_extern) ? FDECL_PRINTF_OK
                                                     : FDECL_BAD_PRINTF;
  return FDECL_OK;
}

//-----------------------------------------------------------------------------
static void process_fdecl_error(fdecl_res_t res, symbol_t *sym)
{
  switch ( res.code )
  {
    case FDECL_REDECL:
      usererr("error: function %s redeclared at line %d (previous declaration at line %d)\n",
              sym->c_str(), sym->line(), res.info);
      break;
    case FDECL_BAD_PRINTF:
      usererr("error, line %d: ellipsis \"...\" notation is is only valid when declaring "
              "builtin function: extern void printf(char format[], ...);\n",
              sym->line());
      break;
    default:
      INTERR(0);
  }
  delete sym;
}

//-----------------------------------------------------------------------------
static void process_func_list(symvec_t *vec, primitive_t rt, bool is_extern)
{
  ASSERT(1010, vec != NULL);
  ASSERT(1025, rt != PRIM_UNKNOWN);

  for ( symvec_t::iterator i = vec->begin(); i != vec->end(); i++ )
  {
    ASSERT(1011, *i != NULL);

    symbol_t *sym = *i;
    fdecl_res_t res = validate_func_decl(*sym, rt, is_extern);

    if ( res.code < FDECL_OK )
    {
      process_fdecl_error(res, sym);
      continue;
    }

    if ( res.code == FDECL_PRINTF_OK )
      build_print_functions(sym, gsyms);

    sym->set_base(rt);

    if ( is_extern )
      sym->set_extern();

    gsyms.insert(sym);
  }
}

//-----------------------------------------------------------------------------
static array_sfx_t process_array_sfx(int size, int line)
{
  array_sfx_t ret;
  if ( size >= 0 )
  {
    ret.code = ASFX_OK;
    ret.size = size;
  }
  else
  {
    usererr("error: line %d: arrays must have non-negative size\n", line);
    ret.code = ASFX_ERROR;
  }
  return ret;
}

//-----------------------------------------------------------------------------
static symvec_t *sym_list_prepend(symbol_t *first, symvec_t *rest)
{
  symvec_t *vec = rest == NULL ? new symvec_t : rest;

  if ( first != NULL )
    vec->insert(vec->begin(), first);

  return vec;
}

//-----------------------------------------------------------------------------
static symvec_t *sym_list_append(symvec_t *list, symbol_t *last)
{
  symvec_t *ret = list == NULL ? new symvec_t : list;

  if ( last != NULL )
    ret->push_back(last);

  return ret;
}

//-----------------------------------------------------------------------------
static symvec_t *process_param_list(symbol_t *first, symvec_t *rest, symbol_t *ellipsis)
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

  ctx.setglobal();
  yyparse();
  checkerr();

  _gsyms.swap(gsyms);
  _functions.swap(functions);
}
