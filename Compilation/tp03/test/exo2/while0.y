%{
#include <stdio.h>
#include "syntax_tree.h"

// Déclaration de la fonction yyparse pour éviter les avertissements
int yyparse(void);

// Variable globale pour stocker la racine de l'arbre syntaxique
CmdNode* root;

// Fonction de gestion des erreurs de syntaxe
void yyerror(const char* s) {
    fprintf(stderr, "Erreur de syntaxe : %s\n", s);
}

%}

%union {
    ExprNode* expr;
    CmdNode* cmd;
}

%token <expr> INTEGER VARIABLE
%token <cmd> WHILE IF ELSE PRINT
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%nonassoc IFX

%%
program : cmd_list { root = $1; }

cmd_list : cmd_list cmd ';' { $$ = createCmdNode(ASSIGN, NULL, $1, $2); }
         | cmd ';' { $$ = createCmdNode(ASSIGN, NULL, NULL, $1); }

cmd : PRINT expr { $$ = createCmdNode(PRINT, NULL, NULL, $2); }
    | VARIABLE '=' expr { $$ = createCmdNode(ASSIGN, $1, NULL, $3); }
    | WHILE '(' expr ')' cmd { $$ = createCmdNode(WHILE, $3, $5, NULL); }
    | IF '(' expr ')' cmd %prec IFX { $$ = createCmdNode(IF, $3, $5, NULL); }
    | IF '(' expr ')' cmd ELSE cmd { $$ = createCmdNode(IF, $3, $5, $7); }

expr : INTEGER { $$ = createExprNode(INTEGER, NULL, NULL); }
     | VARIABLE { $$ = createExprNode(VARIABLE, NULL, NULL); }
     | '-' expr %prec UMINUS { $$ = createExprNode(SUBTRACT, NULL, $2); }
     | expr '+' expr { $$ = createExprNode(ADD, $1, $3); }
     | expr '-' expr { $$ = createExprNode(SUBTRACT, $1, $3); }
     | expr '*' expr { $$ = createExprNode(MULTIPLY, $1, $3); }
     | expr '/' expr { $$ = createExprNode(DIVIDE, $1, $3); }
     | '(' expr ')' { $$ = $2; }

%%

int main(void) {
    yyparse();
    // Utilisez la variable globale 'root' pour accéder à la racine de l'arbre syntaxique
    // Effectuez les opérations souhaitées sur l'arbre syntaxique ici
    return 0;
}
