%{
  #include<stdlib.h>
#ifndef TABLE_C
  #define TABLE_C
  #include "table.c"
#endif
  #include "parser.tab.h"
  //extern int yylval;
%}

%option nounput
%option noinput
%option yylineno
%x COMMENT

%%

"while"		{ return WHILE; }
"return"	{ return RETURN; }
"char"		{ yylval.type = CHAR_TYPE; return CHAR; }
"int"		{ yylval.type = INT_TYPE; return INT; }
"void"		{ yylval.type = VOID_TYPE; return VOID; }
"extern"	{ return EXTERN; }
"if"		{ return IF; }
"else"		{ return ELSE; }
"for"		{ return FOR; }
"=="		{ return EQUALS; }
"!="		{ return NOT_EQUAL; }
"<="		{ return LT_EQUAL; }
">="		{ return GT_EQUAL; }
"&&"		{ return AND; }
"||"		{ return OR; }
			
"[" |
"]" |
"(" |
")" |
"{" |
"}" |
"," |
";" |
"-" |
"!" |
"+" |
"*" |
"/" |
"=" |
"<" |
">"	         { return yytext[0]; }


[0-9]+		 { yylval.con = atoi(yytext); return INT_CON; }

'[[:print:]]{-}[\]{-}[']' |			
'\\n'		  	  |			
'\\0'						{ /*printf("found Charcon\n");*/ yylval.charCon = strdup(yytext); return CHAR_CON; }

[[:alpha:]]{+}[_]   |      
[[:alpha:]][[:alpha:]]{+}[_]{+}[0-9]+           { yylval.id = strdup(yytext); return ID; }

"\""[[:print:]]{-}["]{-}[\n]+"\""		{ /*printf("found stringcon\n");*/ yylval.stringCon = strdup(yytext); return STRING_CON; }	

[[:space:]]+


"/*"			 { BEGIN(COMMENT); }
<COMMENT>"*/"   	 { BEGIN(INITIAL); }
<COMMENT>([^*]|\n)+|.	
<COMMENT><<EOF>>	 { printf("Unterminated comment, line %d\n", yylineno); return 0; }

.			 { /*printf("found error token\n");*/ return yytext[0]; }
 
%%
