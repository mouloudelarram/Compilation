%{
#include "while0.y"
#include "../exo1/arbre_syntaxique.h"
%}

%%
[ \t\n]          /* Ignorer les espaces, tabulations et sauts de ligne */

"while"          { return WHILE; }
"do"             { return DO; }
"end"            { return END; }
"if"             { return IF; }
"then"           { return THEN; }
"else"           { return ELSE; }
"endif"          { return ENDIF; }
"print"          { return PRINT; }
[0-9]+           { yylval.numValue = atoi(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9]* { yylval.id = strdup(yytext); return IDENTIFIER; }
"+"              { return PLUS; }
"-"              { return MINUS; }
"*"              { return MULTIPLY; }
"/"              { return DIVIDE; }
"="              { return ASSIGN; }
"<"              { return LESS_THAN; }
">"              { return GREATER_THAN; }
"=="             { return EQUAL; }
"!="             { return NOT_EQUAL; }
"&&"             { return AND; }
"||"             { return OR; }
"!"              { return NOT; }
"("              { return LEFT_PAREN; }
")"              { return RIGHT_PAREN; }
";"              { return SEMICOLON; }
.                { printf("Caractère inconnu : %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
