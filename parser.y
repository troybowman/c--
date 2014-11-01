%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <errno.h>
  #include <string.h>

  extern "C" FILE *yyin;
  extern "C" int yylex();
  extern "C" int yylineno;
  int yyerror(const char *s);
%}

%union
{
  int i;
  char *str;
}

%token<i> INT
%token<str> CHAR STRING ID

%token INT_TYPE CHAR_TYPE VOID
%token WHILE RETURN EXTERN IF ELSE FOR
%token EQ NEQ LEQ GEQ AND OR

%start prog

%%

prog : prog decl  ';' /* done - trailing decls are fine */
     | prog error ';' { yyerrok; }
     | /* empty */
     ;

decl : type var_decl var_decl_list
     | EXTERN type func_decls
     | EXTERN VOID func_decls
     |        type func_decls
     |        VOID func_decls
     ;

type : INT_TYPE
     | CHAR_TYPE
     ;

var_decl : ID
         | ID '[' INT ']'
         ;

var_decl_list : var_decl_list ',' var_decl
              | /* empty */
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

int main(int argc, char **argv)
{
  if ( argc != 2 )
  {
    fprintf(stderr, "usage: %s <filename>\n", argv[0]);
    return 1;
  }

  yyin = fopen(argv[1], "r");
  if ( yyin == NULL )
  {
    fprintf(stderr, "cannot open file %s:%s\n", argv[1], strerror(errno));
    return 2;
  }

  yyparse();
  return 0;
}

int yyerror(const char *s)
{
  fprintf(stderr, "%s, line: %d\n", s, yylineno);
  return 3;
}
