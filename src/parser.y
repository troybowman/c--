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
  static inline void process_gvar_list(primitive_t type, symlist_t *list)
  {
    if ( list == NULL )
      return;
    symlist_t::iterator i;
    for ( i = list->begin(); i != list->end(); i++ )
      insert_gvar(*i, type);
  }
%}

%union
{
  int i;
  char *str;
  symbol_t *sym;
  primitive_t prim;
  symlist_t *symlist;
}

%token<i> INT
%token<str> CHAR STRING ID

%token INT_TYPE CHAR_TYPE VOID
%token WHILE RETURN EXTERN IF ELSE FOR
%token EQ NEQ LEQ GEQ AND OR

%type<prim> type
%type<sym> var_decl
%type<symlist> var_decl_list

%start prog

%%

prog : prog decl  ';' /* done - trailing decls are fine */
     | prog error ';' { yyerrok; }
     | /* empty */
     ;

decl : type var_decl var_decl_list
       {
         insert_gvar($2, $1);
         process_gvar_list($1, $3);
         if ( $3 != NULL )
           delete $3;
       }
     | EXTERN type func_decls
     | EXTERN VOID func_decls
     |        type func_decls
     |        VOID func_decls
     ;

type : INT_TYPE  { $$ = PRIM_INT; }
     | CHAR_TYPE { $$ = PRIM_CHAR; }
     ;

var_decl : ID
           {
             $$ = new symbol_t($1, yylineno);
             free($1);
           }
         | ID '[' INT ']'
           {
             if ( $3 >= 0 )
             {
               $$ = new symbol_t($1, $3, yylineno);
             }
             else
             {
               fprintf(stderr,
                       "error, line %d: arrays must have non-negative size\n",
                       yylineno);
               $$ = NULL;
             }
             free($1);
           }
         ;

var_decl_list : var_decl_list ',' var_decl
                {
                  symlist_t *symlist = $1;
                  if ( $1 == NULL )
                    symlist = new symlist_t();
                  if ( $3 != NULL )
                    symlist->push_back($3);
                  $$ = symlist;
                }
              | /* empty */ { $$ = NULL; }
              ;

func_decls : func_decl func_decl_list
           ;

func_decl : ID '(' param_decls ')'
          ;

func_decl_list : func_decl_list ',' func_decl
               | /* empty */
               ;

param_decls : VOID
            | param_decl param_decl_list
            ;

param_decl : type ID
           | type ID '[' ']'
           ;

param_decl_list : param_decl_list ',' param_decl
                | /* empty */
                ;

%%

//-----------------------------------------------------------------------------
static bool insert_gsym(symbol_t *sym)
{
  if ( sym->type == ST_FUNCTION )
  {
    // check if defined or declared
  }
  else if ( gsyms[sym->name] != NULL )
  {
    fprintf(stderr,
            "error, symbol %s redeclared at line %d "
            "(previous declaration at line %d)\n",
            sym->name.c_str(), sym->line, gsyms[sym->name]->line);
    delete sym;
    return false;
  }
  gsyms[sym->name] = sym;
  return true;
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
    if ( argc != 4 )
      return false;

    if ( strcmp("-v", argv[1]) != 0 )
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
