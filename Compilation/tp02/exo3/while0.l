%{
#include "y.tab.h"
%}

%%

[ \t\n]+      /* Ignorer les espaces, les tabulations et les sauts de ligne */
"+"           { return ADD; }
"-"           { return SUB; }
"*"           { return MUL; }
"/"           { return DIV; }
"="           { return ASSIGN; }
"("           { return LPAREN; }
")"           { return RPAREN; }
"{"           { return LBRACE; }
"}"           { return RBRACE; }
";"           { return SEMICOLON; }
"if"          { return IF; }
"else"        { return ELSE; }
"while"       { return WHILE; }
[a-zA-Z]+     { yylval.sval = strdup(yytext); return ID; }
[0-9]+        { yylval.ival = atoi(yytext); return INT; }

%%

int yywrap() {
  return 1;
}