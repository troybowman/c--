%{
class parser_ctx_t;
#include "parser.hpp"
%}

%option yylineno
%option reentrant
%option bison-bridge

/* avoid unused warnings */
%option noinput
%option nounput

%x COMMENT

%%

"int"    { return INT_TYPE;  }
"char"   { return CHAR_TYPE; }
"void"   { return VOID; }
"while"  { return WHILE; }
"return" { return RETURN; }
"extern" { return EXTERN; }
"if"     { return IF; }
"else"   { return ELSE; }
"for"    { return FOR; }
"=="     { return EQ; }
"!="     { return NEQ; }
"<="     { return LEQ; }
">="     { return GEQ; }
"&&"     { return AND; }
"||"     { return OR; }
"..."    { return ELLIPSIS; }
"<<"     { return SHL; }
">>"     { return SHR; }
"+="     { return PEQ; }
"-="     { return MEQ; }
"*="     { return TEQ; }
"/="     { return DEQ; }
"&="     { return AEQ; }
"|="     { return OEQ; }
"^="     { return XEQ; }

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
">" |
"&" |
"|" |
"^" |
"~" { return yytext[0]; }

0x[a-zA-Z0-9]+ { yylval->i = strtol(yytext, NULL, 16); return INT; }

[0-9]+ { yylval->i = strtol(yytext, NULL, 10); return INT; }

'[[:print:]]{-}[\]{-}[']' |
'\\n' |
'\\0' { yylval->str = strdup(yytext); return CHAR; }

"main" { yylval->str = strdup(yytext); return MAIN; }

[[:alpha:]]([[:alpha:]]{+}[_]{+}[0-9]+)? { yylval->str = strdup(yytext); return ID; }

"\""[[:print:]]{-}["]{-}[\n]*"\"" { yylval->str = strdup(yytext); return STRING; }

[[:space:]]+ /* nom */

"/*" { BEGIN(COMMENT); }

<COMMENT>"*/" { BEGIN(INITIAL); }

<COMMENT>([^*]|\n)+|. /* nom */

<COMMENT><<EOF>> { fprintf(stderr, "Unterminated comment, line %d\n", yylineno); return 0; }

. { return yytext[0]; }

%%
