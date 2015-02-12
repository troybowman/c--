%{
  #include <stdlib.h>

  // TODO: we shouldn't need these
  #include <parse.h>
  #include <symbol.h>

  #include "parser.hpp"
  #define YY_DECL extern "C" int yylex()
%}

%option noinput
%option nounput
%option yylineno

%x COMMENT

%%

"int"		 { return INT_TYPE;  }
"char"	 { return CHAR_TYPE; }
"void"	 { return VOID;      }
"while"	 { return WHILE;     }
"return" { return RETURN;    }
"extern" { return EXTERN;    }
"if"		 { return IF;        }
"else"	 { return ELSE;      }
"for"		 { return FOR;       }
"=="		 { return EQ;        }
"!="		 { return NEQ;       }
"<="		 { return LEQ;       }
">="		 { return GEQ;       }
"&&"		 { return AND;       }
"||"		 { return OR;        }
"..."    { return ELLIPSIS;  }

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
">"	{ return yytext[0]; }


[0-9]+ {
         yylval.i = strtol(yytext, NULL, 10);
         return INT;
       }

'[[:print:]]{-}[\]{-}[']' |
'\\n' |
'\\0' {
        yylval.str = strdup(yytext);
        return CHAR;
      }

[[:alpha:]]([[:alpha:]]{+}[_]{+}[0-9]+)? {
                                           yylval.str = strdup(yytext);
                                           return ID;
                                         }

"\""[[:print:]]{-}["]{-}[\n]+"\""	{
                                    yylval.str = strdup(yytext);
                                    return STRING;
                                  }

[[:space:]]+ /* nom */


"/*" { BEGIN(COMMENT); }

<COMMENT>"*/" { BEGIN(INITIAL); }

<COMMENT>([^*]|\n)+|. /* nom */

<COMMENT><<EOF>> {
                   printf("Unterminated comment, line %d\n", yylineno);
                   return 0;
                 }

.	{ return yytext[0]; }

%%
