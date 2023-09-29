%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;

int yylex();
void yyerror(char *);

%}
%union{ int num; char* variable ;}
%token NUMBER VARIABLE
%left '+' '-'
%left '*' '/'
%right '^'


%%
expression : NUMBER
           | VARIABLE
           | expression '+' expression
           | expression '-' expression
           | expression '*' expression
           | expression '/' expression
           | expression '^' expression
           | '(' expression ')'
           ;

%%

void yyerror(char *s) {
    printf("Erreur de syntaxe : %s\n", s);
    exit(1);
}

int main() {
    char input[100];

    printf("Entrez une expression mathématique (ou 'q' pour quitter) :\n");

    while (1) {
        printf("> ");
        fgets(input, sizeof(input), stdin);

        if (input[0] == 'q') {
            break;
        }

        yyin = fmemopen(input, strlen(input), "r");
        if (yyin == NULL) {
            printf("Erreur lors de l'ouverture du flux d'entrée\n");
            continue;
        }

        if (yyparse() == 0) {
            printf("Formule mathématique correcte.\n");
        } else {
            printf("Formule mathématique incorrecte.\n");
        }

        fclose(yyin);
    }

    return 0;
}
