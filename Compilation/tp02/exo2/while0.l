%{
#include "y.tab.h"
%}

%%
and { return AND; }
or { return OR; }
not { return NOT; }
= { return EQ; }
< { return LT; }
> { return GT; }
<= { return LE; }
>= { return GE; }
[0-9]+ { yylval.value = atoi(yytext); return INTEGER; }
[a-zA-Z][a-zA-Z0-9]* { yylval.value = strdup(yytext); return IDENTIFIER; }
. { return yytext[0]; }
%%

int yywrap()
{
    return 1;
}
