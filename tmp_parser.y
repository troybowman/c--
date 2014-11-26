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

#ifndef NDEBUG
  dbg_flags_t dbg_flags = 0;
#endif

  symtab_t gsyms; // global symbol table
  bool usererr = false; // don't generate code if we encountered an error
  symlist_t functions; // functions, in order as they appear in the source file

  // pointer to current active symbol table.
  // (could be &gsyms, the current local symtab,
  //  or a temporary symtab for parameters)
  static symtab_t *cursyms = &gsyms;

  static void process_var_list(symlist_t *, primitive_t);
  static void process_func_list(symlist_t *, return_type_t, bool);

  // use a temporary symbol table to validate parameter declarations
  static inline void param_on() { cursyms = new symtab_t(); }
  static inline void param_off() { delete cursyms; cursyms = &gsyms; }

  // initialize/complete function definition
  static void f_enter(symbol_t *, return_type_t);
  static void f_leave(symbol_t *, treenode_t *);

  static symbol_t *process_var_decl(const char *, int, array_sfx_t);

  static void append_stmt(stmt_summary_t *, treenode_t *);
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
  stmt_summary_t *ss;
}

%token<i> INT
%token<str> CHAR STRING ID

%token INT_TYPE CHAR_TYPE VOID
%token WHILE RETURN EXTERN IF ELSE FOR
%token EQ NEQ LEQ GEQ AND OR

%type<prim>     type
%type<sym>      var_decl func_decl param_decl
%type<symlist>  var_decls  var_decl_list func_decls func_decl_list
%type<paramvec> params param_decl_list
%type<asfx>     array_sfx param_array_sfx
%type<tree>     func_body
%type<ss>       stmts

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
var_decl : ID array_sfx
           {
             $$ = process_var_decl($1, yylineno, $2);
             free($1);
           }
         ;

/*---------------------------------------------------------------------------*/
array_sfx : '[' INT ']'
            {
              if ( $2 >= 0 )
              {
                $$.code = ASFX_OK;
                $$.val = $2;
              }
              else
              {
                USERERR("error: line %d: arrays must have non-negative size\n", yylineno);
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
              $$ = new symbol_t($1, yylineno, ST_FUNCTION,
                                RT_UNKNOWN, $4, NULL, NULL, false);
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
params : param_decl param_decl_list
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
param_array_sfx : '[' ']'     { $$.code = ASFX_OK;   $$.val = -1; }
                | /* empty */ { $$.code = ASFX_NONE; $$.val = -1; }
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
     | error '{' { exit(FATAL_FUNCDEF); } /* avoid processing an invaild function */
     | error '}' { yyerrok; }             /* function never began, start over at '}' */
     ;

/*---------------------------------------------------------------------------*/
func_body : local_decls stmts { $$ = $2->head; }
          ;

/*------------------------------------------------------------------------*/
local_decls : local_decls type var_decls ';' { process_var_list($3, $2); }
            | local_decls error          ';' { yyerrok; }
            | /* empty */
            ;

/*---------------------------------------------------------------------------*/
stmts : stmts stmt  { append_stmt($1, $2); $$ = $1; }
      | /* empty */
        {
          treenode_t *init = new treenode_t(TNT_STMT, NULL, NULL);
          $$ = new stmt_summary_t(init, init);
        }
      ;

/*---------------------------------------------------------------------------*/
stmt : assg  ';' { $$ = $1; }
     | error ';' { yyerrok; }
     ;

/*---------------------------------------------------------------------------*/
assg : stmt_var '=' expr
       {
         symbol_t *sym = validate_stmt_id($1);
         $$ = sym == NULL
            ? new treenode_t(TNT_ERROR)
            : process_assg(sym, $2, $4, yylineno);
         free($1);
       }
     ;

/*---------------------------------------------------------------------------*/
stmt_var : ID stmt_array_sfx
          {
            symbol_t *sym = validate_stmt_id($1, yylineno);
            $$ = sym == NULL
               ? new treenode_t(TNT_ERROR)
               : process_stmt_var(sym, $2, yylineno);
            free($1);
          }
        ;

/*---------------------------------------------------------------------------*/
stmt_array_sfx : '[' expr ']' { $$ = $2; }
               | /* empty */  { $$ = NULL; }
               ;

/*---------------------------------------------------------------------------*/
expr : INT    { $$ = new treenode_t(TNT_INTCON, $1);  }
     | CHAR   { $$ = new treenode_t(TNT_CHARCON, $1); }
     | STRING { $$ = new treenode_t(TNT_STRCON, $1);  }
     ;

%%

//-----------------------------------------------------------------------------
static symbol_t *validate_stmt_id(const char *name, int line)
{
  symbol_t *sym = cursyms->get(std::string(name));
  if ( sym == NULL )
  {
    USERERR("error: use of undeclared identifier %s at line %d\n", name, line);
    return NULL;
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
static inline lookup_res_t validate_array_lookup(const symbol &sym, const treenode_t &idx)
{
  return sym.type != ST_ARRAY ? AL_ERR_BASE
       : !idx.is_int_compat() ? AL_ERR_IDX
       : AL_OK;
}

//-----------------------------------------------------------------------------
static treenode_t *process_stmt_var(const symbol_t *sym, treenode_t *idx, int line)
{
  ASSERT(1017, sym != NULL);
  ASSERT(1018, idx != NULL);

  if ( idx == NULL )
    return new treenode_t(TNT_SYMBOL, sym);

  lookup_res_t res = validate_array_lookup(*sym, *idx);
  if ( res != AL_OK )
  {
    switch ( res )
    {
      case AL_ERR_BASE:
        USERERR("error: symbol %s used as an array but is not of array type, line %d\n",
                 sym->name.c_str(), line);
        break;
      case AL_ERR_IDX:
        USERERR("error: expression for array index is not of integer type, line %d\n", line);
        break;
      default
        INTERR(0);
    }
    delete idx;
    return new treenode_t(TNT_ERROR);
  }

  treenode_t *base = new treenode_t(TNT_SYMBOL, sym);
  return new treenode_t(TNT_ARRAY_LOOKUP, base, idx);
}


//-----------------------------------------------------------------------------
enum assg_res_t
{
  ASSG_OK,
  ASSG_COMPAT,
  ASSG_LOOKUP
};

//-----------------------------------------------------------------------------
static bool validate_assg(
    const symbol_t *sym,
    const treenode_t *idx,
    const treenode_t *rhs)
{
  if ( idx != NULL && idx->type == TNT_ERROR )
    return ASSG_OK; // already processed an error - continue silently




}

//-----------------------------------------------------------------------------
static treenode_t *process_assg(
    const symbol_t *sym,
    treenode_t *idx,
    treenode_t *rhs,
    int line)
{
  assg_res_t res = validate_assg(sym, idx, rhs);
  if ( res != ASSG_OK )
  {
    switch ( res )
    {

    }
    return new treenode_t(TNT_ERROR);
  }
  treenode_t *sym = new treenode_t(TNT_SYMBOL, )
  treenode_t *lhs = idx != NULL
                  ? new treenode_t(TNT_ARRAY_LOOKUP)


}


//-----------------------------------------------------------------------------
static void append_stmt(stmt_summary_t *ss, treenode_t *node)
{
  ASSERT(1013, ss != NULL);
  ASSERT(1014, stmt != NULL);

  treenode_t *tail = ss->tail;

  ASSERT(1015, tail->type == TNT_STMT);
  ASSERT(1016, tail->children[STMT_NEXT] == NULL);

  treenode_t *stmt = new treenode_t(TNT_STMT, node, NULL);
  tail->children[STMT_NEXT] = stmt;
  ss->tail = stmt;
}

//-----------------------------------------------------------------------------
static symbol_t *process_var_decl(const char *name, int line, array_sfx_t asfx)
{
  if ( asfx.code == ASFX_ERROR )
    return NULL;

  symbol_t *prev = cursyms->get(std::string(name));
  if ( prev != NULL )
  {
    USERERR("error: variable %s redeclared at line %d (previous declaration at line %d)\n",
            prev->name.c_str(), yylineno, prev->line);
    return NULL;
  }

  symbol_t *sym = asfx.code == ASFX_NONE
                ? new symbol_t(name, line, ST_PRIMITIVE, PRIM_UNKNOWN)
                : new symbol_t(name, line, ST_ARRAY, PRIM_UNKNOWN, asfx.val);
  cursyms->insert(sym);
  return sym;
}

//-----------------------------------------------------------------------------
static bool param_check(const paramvec_t &p1, const paramvec_t &p2)
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
        INTERR(0);
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
  COL_RET
};

//-----------------------------------------------------------------------------
static col_res_t handle_collision(const symbol_t &prev, const symbol_t &sym)
{
  ASSERT(1000, sym.type == ST_FUNCTION);
  ASSERT(1001, prev.name == sym.name);

  return prev.type != ST_FUNCTION                          ? COL_REDECL
       : prev.func.syntax_tree != NULL                     ? COL_REDEF
       : !param_check(*prev.func.params, *sym.func.params) ? COL_PARAMS
       : prev.func.rt_type != sym.func.rt_type             ? COL_RET
       : COL_OK;
}

//-----------------------------------------------------------------------------
static void init_lsyms(symbol_t *f)
{
  ASSERT(1002, f != NULL);
  f->func.symbols = new symtab_t();

  symtab_t *syms = f->func.symbols;
  paramvec_t *params = f->func.params;

  int size = params->size();
  for ( int i = 0; i < size; i++ )
  {
    symbol_t *p = params->at(i);
    ASSERT(1003, syms->get(p->name) == NULL);
    syms->insert(p);
  }
}

//-----------------------------------------------------------------------------
static void f_enter(symbol_t *f, return_type_t rt)
{
  ASSERT(1004, f != NULL);

  f->func.rt_type = rt;

  symbol_t *prev = cursyms->get(f->name);
  if ( prev != NULL )
  {
    col_res_t res = handle_collision(*prev, *f);

    if ( res != COL_OK )
    {
      switch ( res )
      {
        case COL_REDEF:
          USERERR("error: function %s redefined at line %d "
                  "(previous definition starts at line %d)\n",
                  f->name.c_str(), f->line, prev->line);
          break;
        case COL_REDECL:
          USERERR("error: symbol %s redeclared as a function at line %d "
                  "(previous declaration at line %d)\n",
                  f->name.c_str(), f->line, prev->line);
          break;
        case COL_PARAMS:
          USERERR("error: parameters in definition of function %s at line %d "
                  "do not match the parameters in its declaration at line %d\n",
                  f->name.c_str(), f->line, prev->line);
          break;
        case COL_RET:
          USERERR("error: return type for function %s at line %d "
                  "does not match the return type in its declaration at line %d\n",
                  f->name.c_str(), f->line, prev->line);
          break;
        default:
          INTERR(1012);
      }
      exit(FATAL_FUNCDEF); // these errors invalidate an entire function definition. we do not try to recover from them
    }
    // symbol for declaration is replaced with the new symbol
    delete prev;
  }
  cursyms->insert(f);

  init_lsyms(f);
  cursyms = f->func.symbols;
}
//-----------------------------------------------------------------------------
static void f_leave(symbol_t *f, treenode_t *tree)
{
  ASSERT(1005, f != NULL);
  ASSERT(1006, tree != NULL);

  f->func.syntax_tree = tree;
  functions.push_back(f);

  cursyms = &gsyms;
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
        INTERR(0);
    }
  }
}

//-----------------------------------------------------------------------------
static void process_func_list(symlist_t *list, return_type_t rt_type, bool is_extern)
{
  ASSERT(1010, list != NULL);

  symlist_t::iterator i;
  for ( i = list->begin(); i != list->end(); i++ )
  {
    ASSERT(1011, *i != NULL);

    symbol_t *sym = *i;
    symbol_t *prev = cursyms->get(sym->name);
    if ( prev != NULL )
    {
      USERERR("error: function %s redeclared at line %d (previous declaration at line %d)\n",
              sym->name.c_str(), sym->line, prev->line);
      delete sym;
      continue;
    }
    sym->func.rt_type = rt_type;
    sym->func.is_extern = is_extern;
    cursyms->insert(sym);
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

  yyparse();

  DBG_SUMMARY(dbg_flags);
  CHECK_CODEGEN_FLAGS(dbg_flags);

  return 0;
}

//-----------------------------------------------------------------------------
int yyerror(const char *s)
{
  fprintf(stderr, "%s, line: %d\n", s, yylineno);
  return 3;
}
