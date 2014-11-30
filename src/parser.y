%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <errno.h>
  #include <string.h>

  #include <symbol.h>
  #include <treenode.h>
  #include <messages.h>

  extern "C" FILE *yyin;
  extern "C" int yylex();
  extern "C" int yylineno;
  int yyerror(const char *s);

  symtab_t gsyms;      // global symbol table
  symlist_t functions; // functions, in order as they appear in the source file

  //---------------------------------------------------------------------------
  static struct
  {
    symtab_t *syms;    // pointer to currently active symbol table
    return_type_t rt;  // return type of current function
    bool ret_resolved; // have we seen a 'return expr' statement yet? (for non-void funcs)

    void setglobal()
    {
      syms = &gsyms;
      rt = RT_UNKNOWN;
      ret_resolved = true;
    }
    void setlocal(symtab_t *_syms, return_type_t _rt = RT_UNKNOWN)
    {
      syms = _syms;
      rt = _rt;
      ret_resolved = _rt == RT_VOID;
    }
    void trash() { delete syms; setglobal(); }
  } ctx;

  //---------------------------------------------------------------------------
  static void process_var_list(symlist_t *list, primitive_t type);
  static void process_func_list(symlist_t *list, return_type_t rt, bool is_extern);

  // use a temporary symbol table to validate parameter declarations
  static inline void param_on() { ctx.setlocal(new symtab_t()); }
  static inline void param_off() { ctx.trash(); }

  static void f_enter(symbol_t *f, return_type_t rt); // initialize func def
  static void f_leave(symbol_t *f, treenode_t *tree);

  static symbol_t *process_var_decl(const char *name, int line, array_sfx_t asfx);

  static seq_t &seq_append(seq_t &seq, const treenode_t *app, treenode_type_t type);

  static   symbol_t *process_stmt_id (const char *id, int line);
  static treenode_t *process_stmt_var(const symbol_t *sym, treenode_t *idx, int line);

  static treenode_t *process_assg(treenode_t *lhs, treenode_t *rhs, int line);

  static treenode_t *process_call(const symbol_t *sym, treenode_t *args, int line);
  static treenode_t *process_call_ctx(treenode_t *call, int line, bool expr);

  static treenode_t *process_ret_stmt(treenode_t *expr, int line);

  //---------------------------------------------------------------------------
#ifndef NDEBUG
  dbg_flags_t dbg_flags = 0;
#endif
%}

%union
{
  int i;
  char *str;
  primitive_t prim;
  symbol_t *sym;
  symlist_t *symlist;
  paramvec_t *paramvec;
  treenode_t *tree;
  symtab_t *symtab;
  array_sfx_t asfx;
  seq_t seq;
}

%token<i>   INT
%token<str> CHAR STRING ID

%token INT_TYPE CHAR_TYPE VOID
%token WHILE RETURN EXTERN IF ELSE FOR
%token EQ NEQ LEQ GEQ AND OR

%type<prim>     type
%type<sym>      var_decl func_decl param_decl
%type<symlist>  var_decls var_decl_list func_decls func_decl_list
%type<paramvec> params param_decl_list
%type<tree>     func_body stmt stmt_var stmt_array_sfx expr call args ret_expr
%type<asfx>     decl_array_sfx param_array_sfx
%type<seq>      stmts arg_list

%start prog

%%

/*---------------------------------------------------------------------------*/
prog : prog decl  ';'
     | prog error ';' { yyerrok; }
     | prog func
     | /* empty */
     ;

/*---------------------------------------------------------------------------*/
decl :        type var_decls  { process_var_list ($2, $1);                       delete $2; }
     | EXTERN type func_decls { process_func_list($3, return_type_t($2), true);  delete $3; }
     | EXTERN VOID func_decls { process_func_list($3, RT_VOID,           true);  delete $3; }
     |        type func_decls { process_func_list($2, return_type_t($1), false); delete $2; }
     |        VOID func_decls { process_func_list($2, RT_VOID,           false); delete $2; }
     ;

/*---------------------------------------------------------------------------*/
type : INT_TYPE  { $$ = PRIM_INT; }
     | CHAR_TYPE { $$ = PRIM_CHAR; }
     ;

/*---------------------------------------------------------------------------*/
var_decls : var_decl var_decl_list
            {
              symlist_t *list = $2 == NULL ? new symlist_t() : $2;
              if ( $1 != NULL )
                list->insert(list->begin(), $1);
              $$ = list;
            }
          ;

/*---------------------------------------------------------------------------*/
var_decl : ID decl_array_sfx
           {
             $$ = process_var_decl($1, yylineno, $2);
             free($1);
           }
         ;

/*---------------------------------------------------------------------------*/
decl_array_sfx : '[' INT ']'
            {
              if ( $2 >= 0 )
              {
                $$.code = ASFX_OK;
                $$.size = $2;
              }
              else
              {
                usererr("error: line %d: arrays must have non-negative size\n", yylineno);
                $$.code = ASFX_ERROR;
              }
            }
          | /* empty */ { $$.code = ASFX_NONE; }
          ;

/*---------------------------------------------------------------------------*/
var_decl_list : var_decl_list ',' var_decl
                {
                  symlist_t *symlist = $1;
                  if ( symlist == NULL )
                    symlist = new symlist_t();
                  if ( $3 != NULL )
                    symlist->push_back($3);
                  $$ = symlist;
                }
              | /* empty */ { $$ = NULL; }
              ;

/*---------------------------------------------------------------------------*/
func_decls : func_decl func_decl_list
             {
               symlist_t *list = $2 == NULL ? new symlist_t() : $2;
               list->insert(list->begin(), $1);
               $$ = list;
             }
           ;

/*---------------------------------------------------------------------------*/
func_decl : ID '(' { param_on(); } params { param_off(); } ')'
            {
              ASSERT(0, $4 != NULL);
              $$ = new symbol_t($1, yylineno, ST_FUNCTION, RT_UNKNOWN,
                                $4, NULL, NULL, false, false);
            }
          ;

/*---------------------------------------------------------------------------*/
func_decl_list : func_decl_list ',' func_decl
                 {
                   symlist_t *symlist = $1;
                   if ( symlist == NULL )
                     symlist = new symlist_t();
                   symlist->push_back($3);
                   $$ = symlist;
                 }
               | /* empty */ { $$ = NULL; }
               ;

/*---------------------------------------------------------------------------*/
params : param_decl param_decl_list /* TODO: no idea why i did this backwards */
         {
           paramvec_t *params = $2 == NULL
                              ? new paramvec_t()
                              : $2;
           params->insert(params->begin(), $1);
           $$ = params;
         }
       | VOID { $$ = new paramvec_t(); }
       ;

/*---------------------------------------------------------------------------*/
param_decl : type ID param_array_sfx
             {
               symbol_t *sym = process_var_decl($2, yylineno, $3);
               if ( sym != NULL )
               {
                 if ( sym->type == ST_PRIMITIVE )
                   sym->prim = $1;
                 else
                   sym->array.type = $1;
               }
               $$ = sym;
               free($2);
             }
           ;

/*---------------------------------------------------------------------------*/
param_array_sfx : '[' ']'     { $$.code = ASFX_OK; $$.size = -1; }
                | /* empty */ { $$.code = ASFX_NONE; }
                ;

/*---------------------------------------------------------------------------*/
param_decl_list : param_decl_list ',' param_decl
                  {
                    paramvec_t *params = $1;
                    if ( params == NULL )
                      params = new paramvec_t();
                    if ( $3 != NULL )
                      params->push_back($3);
                    $$ = params;
                  }
                | /* empty */ { $$ = NULL; }
                ;

/*---------------------------------------------------------------------------*/
func : type func_decl
       '{'
          { f_enter($2, return_type_t($1)); }
          func_body
          { f_leave($2, $5); }
       '}'
     | VOID func_decl
       '{'
          { f_enter($2, RT_VOID); }
          func_body
          { f_leave($2, $5); }
       '}'
     | error '{' { purge_and_exit(FATAL_FUNCDEF); } /* avoid processing an invaild function */
     | error '}' { yyerrok; }  /* function never began, start over at '}' */
     ;

/*---------------------------------------------------------------------------*/
func_body : local_decls stmts { $$ = $2.head; }
          ;

/*---------------------------------------------------------------------------*/
local_decls : local_decls type var_decls ';' { process_var_list($3, $2); }
            | local_decls error          ';' { yyerrok; } /* TODO: this handles errors in statements as well */
            | /* empty */
            ;

/*---------------------------------------------------------------------------*/
stmts : stmts stmt  { $$ = seq_append($1, $2, TNT_STMT); }
      | /* empty */ { $$.head = NULL; $$.tail = NULL; }
      ;

/*---------------------------------------------------------------------------*/
stmt : stmt_var '=' expr ';' { $$ = process_assg($1, $3, yylineno); }
     | call ';'              { $$ = process_call_ctx($1, yylineno, false); }
     | RETURN ret_expr ';'   { $$ = process_ret_stmt($2, yylineno); }
     ;

/*---------------------------------------------------------------------------*/
ret_expr : expr        { $$ = $1; }
         | /* empty */ { $$ = NULL; }

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

/*---------------------------------------------------------------------------*/
args : expr arg_list
       {
         // append arg_list to 1st arg
         treenode_t *head = new treenode_t(TNT_ARG, $1, NULL);
         head->val = 1;
         if ( $2.head != NULL )
         {
           head->children[SEQ_NEXT] = $2.head;
           head->val += $2.head->val;
         }
         $$ = head;
       }
     | /* empty */ { $$ = NULL; }
     ;

/*---------------------------------------------------------------------------*/
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

/*---------------------------------------------------------------------------*/
stmt_array_sfx : '[' expr ']' { $$ = $2; }
               | /* empty */  { $$ = NULL; }
               ;

/*---------------------------------------------------------------------------*/
expr : INT      { $$ = new treenode_t(TNT_INTCON, $1); }
     | CHAR     { $$ = new treenode_t(TNT_CHARCON, $1); }
     | STRING   { $$ = new treenode_t(TNT_STRCON, $1); }
     | call     { $$ = process_call_ctx($1, yylineno, true); }
     | stmt_var { $$ = $1; }
     ;

%%

//-----------------------------------------------------------------------------
enum ret_res_t
{
  RET_EXTRA,
  RET_MISSING,
  RET_INCOMPAT,
  RET_OK,
  RET_OK_RESOLVED
};

//-----------------------------------------------------------------------------
static ret_res_t validate_ret_stmt(const treenode_t *expr)
{
  ASSERT(0, ctx.rt != RT_UNKNOWN);

  if ( ctx.rt == RT_VOID )
    return expr != NULL ? RET_EXTRA : RET_OK;
  else
    return expr == NULL           ? RET_MISSING
         : !expr->is_int_compat() ? RET_INCOMPAT
         : RET_OK_RESOLVED;
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
        INTERR(0);
    }
    delete expr;
    return ERRNODE;
  }

  if ( res == RET_OK_RESOLVED )
    ctx.ret_resolved = true;

  return new treenode_t(TNT_RET, expr);
}

//-----------------------------------------------------------------------------
struct arg_res_t
{
  int code;
#define ARGS_OK       0
#define ARGS_INCOMPAT 1
#define ARGS_NUM      2
  int info;
  arg_res_t(int c, int i = -1) : code(c), info(i) {}
};

//-----------------------------------------------------------------------------
static bool check_arg(const symbol_t &param, const treenode_t &expr)
{
  bool ok = false;
  switch ( param.type )
  {
    case ST_PRIMITIVE:
      ok = expr.is_int_compat();
      break;
    case ST_ARRAY:
      if ( expr.type == TNT_STRCON )
      {
        ok = param.array.type == PRIM_CHAR;
      }
      else if ( expr.type == TNT_SYMBOL )
      {
        const symbol_t *sym = expr.sym;
        ok = sym->type == ST_ARRAY
          && sym->array.type == param.array.type;
      }
      break;
    default:
      INTERR(1031);
  }
  return ok;
}

//-----------------------------------------------------------------------------
static arg_res_t validate_call(const symbol_t &f, const treenode_t *args)
{
  ASSERT(0, f.type == ST_FUNCTION);
  paramvec_t *params = f.func.params;

  int nparams = params->size();
  int nargs = args == NULL ? 0 : args->val;

  if ( nargs != nparams )
    return arg_res_t(ARGS_NUM, nargs);

  const treenode_t *curarg = args;
  for ( int i = 0; i < nparams; i++ )
  {
    if ( !check_arg(*params->at(i), *curarg->children[SEQ_CUR]) )
      return arg_res_t(ARGS_INCOMPAT, i+1);

    curarg = curarg->children[SEQ_NEXT];
  }

  return arg_res_t(ARGS_OK);
}

//-----------------------------------------------------------------------------
static treenode_t *process_call(const symbol_t *f, treenode_t *args, int line)
{
  ASSERT(0, f != NULL);

  arg_res_t res = validate_call(*f, args);

  if ( res.code != ARGS_OK )
  {
    switch ( res.code )
    {
      case ARGS_NUM:
        usererr("error: expected %d arguments for function %s, %d were provided. line %d\n",
                f->func.params->size(), f->name.c_str(), res.info, line);
        break;
      case ARGS_INCOMPAT:
        usererr("error: argument %d to function %s is of incompatible type, line %d\n",
                res.info, f->name.c_str(), line);
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
enum cctx_res_t
{
  CCTX_OK,
  CCTX_EXPR,
  CCTX_STMT
};

//-----------------------------------------------------------------------------
static cctx_res_t validate_call_ctx(const treenode_t &call, bool expr)
{
  if ( call.type == TNT_ERROR )
    return CCTX_OK;

  ASSERT(0, call.type == TNT_CALL);

  return_type_t rt = call.sym->func.rt_type;
  if ( expr )
    return rt == RT_VOID ? CCTX_EXPR : CCTX_OK;
  else
    return rt != RT_VOID ? CCTX_STMT : CCTX_OK;
}

//-----------------------------------------------------------------------------
static treenode_t *process_call_ctx(treenode_t *call, int line, bool expr)
{
  ASSERT(0, call != NULL);

  cctx_res_t res = validate_call_ctx(*call, expr);

  if ( res != CCTX_OK )
  {
    switch ( res )
    {
      case CCTX_EXPR:
        usererr("error: line %d - function %s called as part of an expression "
                "but does not return a value\n",
                line, call->sym->name.c_str());
        break;
      case CCTX_STMT:
        usererr("error: line %d - function %s called as a standalone statement "
                "but does not have return type void\n",
                line, call->sym->name.c_str());
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
static seq_t &seq_append(seq_t &seq, const treenode_t *cur, treenode_type_t type)
{
  ASSERT(1028, cur != NULL);
  ASSERT(1029, is_seq_type(type));

  treenode_t *to_app = new treenode_t(type, cur, NULL);

  if ( seq.head == NULL )
  {
    seq.head = to_app;
    seq.head->val = 1;
  }
  else
  {
    seq.tail->children[SEQ_NEXT] = to_app;
    seq.head->val++;
  }

  seq.tail = to_app;
  return seq;
}

//-----------------------------------------------------------------------------
static symbol_t *process_stmt_id(const char *id, int line)
{
  std::string key(id);
  symbol_t *sym = ctx.syms->get(key); // first check local symbols
  if ( sym == NULL )
  {
    sym = gsyms.get(key); // now global symbols
    if ( sym == NULL )
      usererr("error: use of undeclared identifier %s at line %d\n", key.c_str(), line);
  }
  return sym;
}

//-----------------------------------------------------------------------------
enum lookup_res_t
{
  AL_OK,
  AL_ERR_BASE,
  AL_ERR_IDX
};

//-----------------------------------------------------------------------------
static inline lookup_res_t validate_array_lookup(const symbol_t &sym, const treenode_t &idx)
{
  return sym.type != ST_ARRAY ? AL_ERR_BASE
       : !idx.is_int_compat() ? AL_ERR_IDX
       : AL_OK;
}

//-----------------------------------------------------------------------------
static treenode_t *process_stmt_var(const symbol_t *sym, treenode_t *idx, int line)
{
  ASSERT(0, sym != NULL);

  if ( idx == NULL )
    return new treenode_t(TNT_SYMBOL, sym);

  lookup_res_t res = validate_array_lookup(*sym, *idx);

  if ( res != AL_OK )
  {
    switch( res )
    {
      case AL_ERR_BASE:
        usererr("error: symbol %s used as an array but is not of array type, line %d\n",
                sym->name.c_str(), line);
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

  bool lhs_valid = (lhs.type == TNT_SYMBOL && lhs.sym->type == ST_PRIMITIVE)
                 || lhs.type == TNT_ARRAY_LOOKUP;

  return lhs_valid ? rhs.is_int_compat() : false;
}

//-----------------------------------------------------------------------------
static treenode_t *process_assg(treenode_t *lhs, treenode_t *rhs, int line)
{
  ASSERT(0, lhs != NULL);
  ASSERT(0, rhs != NULL);

  if ( !validate_assg(*lhs, *rhs) )
  {
    usererr("error: invalid operand types for assignment, line %d\n", line);
    // TODO delete lhs, rhs
    return ERRNODE;
  }

  return new treenode_t(TNT_ASSG, lhs, rhs);
}

//-----------------------------------------------------------------------------
static symbol_t *process_var_decl(const char *name, int line, array_sfx_t asfx)
{
  if ( asfx.code == ASFX_ERROR )
    return NULL;

  symbol_t *prev = ctx.syms->get(std::string(name));
  if ( prev != NULL )
  {
    usererr("error: variable %s redeclared at line %d (previous declaration at line %d)\n",
            prev->name.c_str(), yylineno, prev->line);
    return NULL;
  }

  symbol_t *sym = asfx.code == ASFX_NONE
                ? new symbol_t(name, line, ST_PRIMITIVE, PRIM_UNKNOWN)
                : new symbol_t(name, line, ST_ARRAY, PRIM_UNKNOWN, asfx.size);
  ctx.syms->insert(sym);
  return sym;
}

//-----------------------------------------------------------------------------
static bool check_params(const paramvec_t &p1, const paramvec_t &p2)
{
  if ( p1.size() != p2.size() )
    return false;

  int size = p1.size();
  for ( int i = 0; i < size; i++ )
  {
    symbol_t *s1 = p1[i];
    symbol_t *s2 = p2[i];

    switch ( s1->type )
    {
      case ST_PRIMITIVE:
        if ( s2->type != ST_PRIMITIVE || s2->prim != s1->prim )
          return false;
        break;
      case ST_ARRAY:
        if ( s2->type != ST_ARRAY || s2->array.type != s1->array.type )
          return false;
        break;
      default:
        INTERR(1021);
    }
  }
  return true;
}

//-----------------------------------------------------------------------------
enum col_res_t
{
  COL_OK,
  COL_PARAMS,
  COL_REDECL,
  COL_REDEF,
  COL_EXT,
  COL_RET
};

//-----------------------------------------------------------------------------
static col_res_t validate_collision(const symbol_t &prev, const symbol_t &sym)
{
  ASSERT(1001, prev.name == sym.name);

  return prev.type != ST_FUNCTION                           ? COL_REDECL
       : prev.func.is_extern                                ? COL_EXT
       : prev.func.defined                                  ? COL_REDEF
       : !check_params(*prev.func.params, *sym.func.params) ? COL_PARAMS
       : prev.func.rt_type != sym.func.rt_type              ? COL_RET
       : COL_OK;
}

//-----------------------------------------------------------------------------
static void init_lsyms(symbol_t &f)
{
  f.func.symbols = new symtab_t();

  symtab_t *syms = f.func.symbols;
  paramvec_t *params = f.func.params;

  int size = params->size();
  for ( int i = 0; i < size; i++ )
  {
    symbol_t *p = params->at(i);
    ASSERT(1003, syms->get(p->name) == NULL);
    syms->insert(p);
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
              f.name.c_str(), f.line, prev.line);
      break;
    case COL_REDECL:
      usererr("error: symbol %s redeclared as a function at line %d "
              "(previous declaration at line %d)\n",
              f.name.c_str(), f.line, prev.line);
      break;
    case COL_PARAMS:
      usererr("error: parameters in definition of function %s at line %d "
              "do not match the parameters in its declaration at line %d\n",
              f.name.c_str(), f.line, prev.line);
      break;
    case COL_RET:
      usererr("error: return type for function %s at line %d "
              "does not match the return type in its declaration at line %d\n",
              f.name.c_str(), f.line, prev.line);
      break;
    case COL_EXT:
      usererr("error: function %s is defined at line %d "
              "but is declared extern at line %d\n",
              f.name.c_str(), f.line, prev.line);
      break;
    default:
      INTERR(1012);
  }
}

//-----------------------------------------------------------------------------
static void f_enter(symbol_t *f, return_type_t rt)
{
  ASSERT(1004, f != NULL);
  ASSERT(1000, f->type == ST_FUNCTION);

  f->func.rt_type = rt;

  symbol_t *prev = ctx.syms->get(f->name);
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
    // existing symbol for declaration is replaced with the definition
    delete prev;
  }
  init_lsyms(*f);
  ctx.syms->insert(f);

  ctx.setlocal(f->func.symbols, f->func.rt_type);
}

//-----------------------------------------------------------------------------
static void f_leave(symbol_t *f, treenode_t *tree)
{
  ASSERT(1005, f != NULL);

  f->func.syntax_tree = tree;
  f->func.defined = true;

  if ( !ctx.ret_resolved )
    usererr("error: non-void funcion %s must return a value\n", f->name.c_str());

  functions.push_back(f);

  ctx.setglobal();
}

//-----------------------------------------------------------------------------
static void process_var_list(symlist_t *list, primitive_t prim)
{
  ASSERT(1007, list != NULL);

  symlist_t::iterator i;
  for ( i = list->begin(); i != list->end(); i++ )
  {
    ASSERT(1008, *i != NULL);
    symbol_t *sym = *i;
    switch ( sym->type )
    {
      case ST_PRIMITIVE:
        sym->prim = prim;
        break;
      case ST_ARRAY:
        sym->array.type = prim;
        break;
      default:
        INTERR(1022);
    }
  }
}

//-----------------------------------------------------------------------------
static void process_func_list(symlist_t *list, return_type_t rt_type, bool is_extern)
{
  ASSERT(1010, list != NULL);
  ASSERT(1025, rt_type != RT_UNKNOWN);

  symlist_t::iterator i;
  for ( i = list->begin(); i != list->end(); i++ )
  {
    ASSERT(1011, *i != NULL);

    symbol_t *sym = *i;
    symbol_t *prev = ctx.syms->get(sym->name);
    if ( prev != NULL )
    {
      usererr("error: function %s redeclared at line %d (previous declaration at line %d)\n",
              sym->name.c_str(), sym->line, prev->line);
      delete sym;
      continue;
    }

    sym->func.rt_type = rt_type;
    sym->func.is_extern = is_extern;
    ctx.syms->insert(sym);
  }
}

//-----------------------------------------------------------------------------
static void usage(const char *prog)
{
  const char *msg =
#ifndef NDEBUG
    "usage: %s [-v dbg_flags] filename\n";
#else
    "usage: %s filename\n";
#endif
  fprintf(stderr, msg, prog);
  exit(FATAL_USAGE);
}

//-----------------------------------------------------------------------------
static bool parseargs(int argc, char **argv)
{
  const char *infile = NULL;

  if ( argc == 2 )
  {
    infile = argv[1];
  }
  else
  {
#ifndef NDEBUG
    if ( argc != 4 || strcmp("-v", argv[1]) != 0 )
      return false;
    dbg_flags |= dbg_flags_t(atoi(argv[2]));
    infile = argv[3];
#else
    return false;
#endif
  }
  yyin = fopen(infile, "r");
  if ( yyin == NULL )
  {
    fprintf(stderr, "cannot open file %s: %s\n" , infile, strerror(errno));
    return false;
  }
  return true;
}

//-----------------------------------------------------------------------------
int main(int argc, char **argv)
{
  if ( !parseargs(argc, argv) )
    usage(argv[0]);

  ctx.setglobal();
  yyparse();
  checkerr();

  DBG_SUMMARY(dbg_flags);
  CHECK_CODEGEN_FLAGS(dbg_flags);

  return 0;
}

//-----------------------------------------------------------------------------
int yyerror(const char *s)
{
  usererr("%s, line: %d\n", s, yylineno);
  return 3;
}
