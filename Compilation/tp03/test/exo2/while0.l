%{
#include "syntax_tree.h"
#include "y.tab.h" // Inclure le fichier d'en-tête généré par Yacc (y.tab.h)
%}

%%
[ \t\n]+  /* ignorer les espaces, les tabulations et les sauts de ligne */

"while"    { return WHILE; }
"if"       { return IF; }
"else"     { return ELSE; }
"print"    { return PRINT; }
[A-Za-z]+  { yylval.expr = createExprNode(VARIABLE, NULL, NULL); return VARIABLE; }
[0-9]+     { yylval.expr = createExprNode(INTEGER, NULL, NULL); return INTEGER; }
"+"        { return '+'; }
"-"        { return '-'; }
"*"        { return '*'; }
"/"        { return '/'; }
"="        { return '='; }
"("        { return '('; }
")"        { return ')'; }
";"        { return ';'; }
.          { yyerror("Caractère inconnu"); }

%%

int yywrap(void) {
    return 1;
}

int main(void) {
    yyparse();
    return 0;
}
