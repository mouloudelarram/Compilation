%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Définition des tokens
#define AND 257
#define OR 258
#define NOT 259
#define EQ 260
#define LT 261
#define GT 262
#define LE 263
#define GE 264
#define IDENTIFIER 265
#define INTEGER 266

// Déclaration des fonctions
int yylex();
void yyerror(const char* s);

%}

// Règles de priorité des opérateurs
%left AND OR
%right NOT
%left EQ LT GT LE GE

// Définition des règles de grammaire
%start expression
%token <value> INTEGER IDENTIFIER

%%

expression : INTEGER { printf("Résultat : %d\n", $1); }
            | IDENTIFIER { printf("Résultat : %s\n", $1); }
            | expression AND expression { printf("Résultat : %d\n", $1 && $3); }
            | expression OR expression { printf("Résultat : %d\n", $1 || $3); }
            | NOT expression { printf("Résultat : %d\n", !$2); }
            | expression EQ expression { printf("Résultat : %d\n", $1 == $3); }
            | expression LT expression { printf("Résultat : %d\n", $1 < $3); }
            | expression GT expression { printf("Résultat : %d\n", $1 > $3); }
            | expression LE expression { printf("Résultat : %d\n", $1 <= $3); }
            | expression GE expression { printf("Résultat : %d\n", $1 >= $3); }
            ;

%%

int main()
{
    yyparse();
    return 0;
}

void yyerror(const char* s)
{
    fprintf(stderr, "%s\n", s);
}

