%{
#include "y.tab.h"
%}

%%
[ \t]                 /* Ignorer les espaces et les tabulations */
[0-9]+                { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9]{0,1}  { yylval.variable = strdup(yytext); return VARIABLE; }
.                     { return yytext[0]; }
%%

int yywrap() {
    return 1;
}
