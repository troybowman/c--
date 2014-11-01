%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <errno.h>
  #include <string.h>

  extern FILE *yyin;
  extern int yylex();
  extern int yylineno;
  int yyerror(const char *s);
%}

%union
{
  int i;
  char *str;
}

%token<i> INT
%token<str> CHAR STRING ID

%token INT_TYPE CHAR_TYPE VOID_TYPE
%token WHILE RETURN EXTERN IF ELSE FOR
%token EQ NEQ LEQ GEQ AND OR

%start prog

%%

prog : prog decl  ';' /* done - trailing decls are fine */
     | prog error ';' { yyerrok; }
     | /* empty */
     ;

decl : type var_decl decl_list
     ;

type : INT_TYPE
     | CHAR_TYPE
     ;

var_decl : ID
         | ID '[' INT ']'
         ;

decl_list : decl_list ',' var_decl
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
