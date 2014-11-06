%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <errno.h>
  #include <string.h>

  #include <symbols.h>
  #include <messages.h>

  extern "C" FILE *yyin;
  extern "C" int yylex();
  extern "C" int yylineno;
  int yyerror(const char *s);

#ifndef NDEBUG
  dbg_flags_t dbg_flags = 0;
#endif

  symtab_t gsyms; // global symbol table
  symtab_t lsyms; // local symbol table

  static void insert_gvar(symbol_t *sym, primitive_t prim);
  static void process_gvar_list(symlist_t *list, primitive_t type);
  static void process_func_list(
    symlist_t *list,
    return_type_t rt,
    bool is_extern);
%}

%union
{
  int i;
  char *str;
  primitive_t prim;
  symbol_t *sym;
  symlist_t *symlist;
  param_t param;
  paramvec_t *paramvec;
}

%token<i> INT
%token<str> CHAR STRING ID

%token INT_TYPE CHAR_TYPE VOID
%token WHILE RETURN EXTERN IF ELSE FOR
%token EQ NEQ LEQ GEQ AND OR

%type<prim> type
%type<sym> var_decl func_decl
%type<symlist> var_decls  var_decl_list
%type<symlist> func_decls func_decl_list
%type<param> param_decl
%type<paramvec> param_decl_list

%start prog

%%

prog : prog decl  ';' /* done - trailing decls are fine */
     | prog error ';' { yyerrok; }
     | /* empty */
     ;

decl :        type var_decls  { process_gvar_list($2, $1);                       }
     | EXTERN type func_decls { process_func_list($3, return_type_t($2), true);  }
     | EXTERN VOID func_decls { process_func_list($3, RT_VOID,           true);  }
     |        type func_decls { process_func_list($2, return_type_t($1), false); }
     |        VOID func_decls { process_func_list($2, RT_VOID,           false); }
     ;

type : INT_TYPE  { $$ = PRIM_INT; }
     | CHAR_TYPE { $$ = PRIM_CHAR; }
     ;

var_decls : var_decl var_decl_list
            {
              symlist_t *list = $2 == NULL ? new symlist_t() : $2;
              if ( $1 != NULL )
                list->push_back($1);
              $$ = list;
            }
          ;

var_decl : ID
           {
             $$ = new symbol_t($1, yylineno, ST_PRIMITIVE, ST_UNKNOWN);
             free($1);
           }
         | ID '[' INT ']'
           {
             if ( $3 >= 0 )
               $$ = new symbol_t($1, yylineno, ST_ARRAY, PRIM_UNKNOWN, $3);
             else
             {
               fprintf(stderr, "error, line %d: arrays must have non-negative size\n", yylineno);
               $$ = NULL;
             }
             free($1);
           }
         ;

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

func_decls : func_decl func_decl_list
             {
               symlist_t *list = $2 == NULL ? new symlist_t() : $2;
               list->push_back($1);
               $$ = list;
             }
           ;

func_decl : ID '(' VOID ')'
            {
              $$ = new symbol_t($1, yylineno, ST_FUNCTION,
                                RT_UNKNOWN, NULL, NULL, NULL, false);
              free($1);
            }
          | ID '(' param_decl param_decl_list ')'
            {
              paramvec_t *params = $4 == NULL
                                    ? new paramvec_t()
                                    : $4;
              params->insert(params->begin(), $3);
              int size = params->size();
              for ( int i = 0; i < size; i++ )
                params->at(i).idx = i;
              $$ = new symbol_t($1, yylineno, ST_FUNCTION,
                                RT_UNKNOWN, params, NULL, NULL, false);
              free($1);
            }
          ;

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

param_decl : type ID
             {
               $$.idx = -1;
               $$.sym = new symbol_t($2, yylineno, ST_PRIMITIVE, $1);
               free($2)
             }
           | type ID '[' ']'
             {
               $$.idx = -1;
               $$.sym = new symbol_t($2, yylineno, ST_ARRAY, $1, -1);
               free($2);
             }
           ;

param_decl_list : param_decl_list ',' param_decl
                  {
                    paramvec_t *params = $1;
                    if ( params == NULL )
                      params = new paramvec_t();
                    params->push_back($3);
                    $$ = params;
                  }
                | /* empty */ { $$ = NULL; }
                ;

%%

//-----------------------------------------------------------------------------
static bool param_check(const paramvec_t &p1, const paramvec_t &p2)
{
  if ( p1.size() != p2.size() )
    return false;

  int size = p1.size();
  for ( int i = 0; i < size; i++ )
  {
    symbol_t *s1 = p1[i].sym;
    symbol_t *s2 = p2[i].sym;

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
        INTERR(5555);
    }
  }
  return true;
}

//-----------------------------------------------------------------------------
enum col_res_t
{
  COL_OK,
  COL_REDECL,
  COL_PARAMS
};

//-----------------------------------------------------------------------------
static col_res_t handle_collision(const symbol_t &prev, const symbol_t &sym)
{
  ASSERT(6666, prev.name == sym.name);

  if ( prev.type != ST_FUNCTION
    || sym.type  != ST_FUNCTION
    || prev.func.rt_type != sym.func.rt_type
    || prev.func.is_extern
    || prev.func.syntax_tree != NULL
    || sym.func.syntax_tree  == NULL )
  {
    return COL_REDECL;
  }

  if ( !param_check(*prev.func.params, *sym.func.params) )
    return COL_PARAMS;

  return COL_OK;
}

//-----------------------------------------------------------------------------
static void insert_gsym(symbol_t *sym)
{
  if ( gsyms[sym->name] != NULL )
  {
    symbol_t *prev = gsyms[sym->name];
    col_res_t res = handle_collision(*prev, *sym);

    if ( res != COL_OK )
    {
      if ( res == COL_PARAMS )
      {
        fprintf(stderr,
                "error: paramters for function %s defined at line %d "
                "do not match the parameters in its declaration at line %d\n",
                sym->name.c_str(), sym->line, prev->line);
      }
      else
      {
        fprintf(stderr,
                "error, symbol %s redeclared at line %d "
                "(previous declaration at line %d)\n",
                sym->name.c_str(), sym->line, prev->line);
      }
      delete sym;
      return;
    }
  }
  gsyms[sym->name] = sym;
}

//-----------------------------------------------------------------------------
static void insert_gvar(symbol_t *sym, primitive_t prim)
{
  if ( sym != NULL )
  {
    switch ( sym->type )
    {
      case ST_PRIMITIVE:
        sym->prim = prim;
        break;
      case ST_ARRAY:
        sym->array.type = prim;
        break;
      default:
        INTERR(1111);
    }
    insert_gsym(sym);
  }
}

//-----------------------------------------------------------------------------
static void process_gvar_list(symlist_t *list, primitive_t type)
{
  if ( list == NULL )
    return;
  symlist_t::iterator i;
  for ( i = list->begin(); i != list->end(); i++ )
    insert_gvar(*i, type);
  delete list;
}

//-----------------------------------------------------------------------------
static void process_func_list(symlist_t *list, return_type_t rt_type, bool is_extern)
{
  if ( list == NULL )
    return;
  symlist_t::iterator i;
  for ( i = list->begin(); i != list->end(); i++ )
  {
    symbol_t *sym = *i;
    sym->func.rt_type = rt_type;
    sym->func.is_extern = is_extern;
    insert_gsym(sym);
  }
  delete list;
}

//-----------------------------------------------------------------------------
static void usage(const char *prog)
{
#ifndef NDEBUG
  const char *msg = "usage: %s [-v dbg_flags] filename\n";
#else
  const char *msg = "usage: %s filename\n";
#endif
  fprintf(stderr, msg, prog);
  exit(1);
}

//-----------------------------------------------------------------------------
static bool parseargs(int argc, char **argv)
{
  const char *infile = NULL;

  if ( argc == 2 )
  {
    infile = argv[1];
  }
#ifndef NDEBUG
  else
  {
    if ( argc != 4 || strcmp("-v", argv[1]) != 0 )
      return false;
    dbg_flags |= dbg_flags_t(atoi(argv[2]));
    infile = argv[3];
  }
#else
  else
  {
    return false;
  }
#endif
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
  return 0;
}

//-----------------------------------------------------------------------------
int yyerror(const char *s)
{
  fprintf(stderr, "%s, line: %d\n", s, yylineno);
  return 3;
}
