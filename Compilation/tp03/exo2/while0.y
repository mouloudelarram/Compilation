%{
#include <stdio.h>
#include <stdlib.h>
#include "../exo1/arbre_syntaxique.h"

extern int yylex();
extern int yyparse();
extern int yylineno;

SyntaxTreeNode* root;

void yyerror(const char* error) {
    fprintf(stderr, "Erreur de syntaxe à la ligne %d : %s\n", yylineno, error);
}

SyntaxTreeNode* createArithmeticExpressionNode(const char* label, SyntaxTreeNode* child1, SyntaxTreeNode* child2, SyntaxTreeNode* child3) {
    SyntaxTreeNode* node = (SyntaxTreeNode*)malloc(sizeof(SyntaxTreeNode));
    node->type = ARITHMETIC_EXPRESSION;
    strcpy(node->label, label);
    node->children[0] = child1;
    node->children[1] = child2;
    node->children[2] = child3;
    return node;
}

SyntaxTreeNode* createBooleanExpressionNode(const char* label, SyntaxTreeNode* child1, SyntaxTreeNode* child2, SyntaxTreeNode* child3) {
    SyntaxTreeNode* node = (SyntaxTreeNode*)malloc(sizeof(SyntaxTreeNode));
    node->type = BOOLEAN_EXPRESSION;
    strcpy(node->label, label);
    node->children[0] = child1;
    node->children[1] = child2;
    node->children[2] = child3;
    return node;
}

SyntaxTreeNode* createCommandNode(const char* label, SyntaxTreeNode* child1, SyntaxTreeNode* child2, SyntaxTreeNode* child3) {
    SyntaxTreeNode* node = (SyntaxTreeNode*)malloc(sizeof(SyntaxTreeNode));
    node->type = COMMAND;
    strcpy(node->label, label);
    node->children[0] = child1;
    node->children[1] = child2;
    node->children[2] = child3;
    return node;
}
%}

%union {
    int numValue;
    char* id;
    SyntaxTreeNode* node;
}

%token <numValue> NUMBER
%token <id> IDENTIFIER
%token WHILE DO END IF THEN ELSE ENDIF PRINT
%token PLUS MINUS MULTIPLY DIVIDE ASSIGN
%token LESS_THAN GREATER_THAN EQUAL NOT_EQUAL
%token AND OR NOT
%token LEFT_PAREN RIGHT_PAREN SEMICOLON

%type <node> command
%type <node> expression
%type <node> arithmetic_expression
%type <node> boolean_expression

%left OR
%left AND
%left EQUAL NOT_EQUAL
%left LESS_THAN GREATER_THAN
%left PLUS MINUS
%left MULTIPLY DIVIDE
%right NOT

%%
program : command { root = $1; }
        ;

command : WHILE expression DO command END { root = createCommandNode("while", $2, $4, NULL); }
        | IF expression THEN command ELSE command ENDIF { root = createCommandNode("if", $2, $4, $6); }
        | PRINT expression SEMICOLON { root = createCommandNode("print", $2, NULL, NULL); }
        ;

expression : arithmetic_expression { root = $1; }
           | boolean_expression { root = $1; }
           ;

arithmetic_expression : NUMBER { root = createArithmeticExpressionNode("number", NULL, NULL, NULL); }
                      | IDENTIFIER { root = createArithmeticExpressionNode("identifier", NULL, NULL, NULL); }
                      | arithmetic_expression PLUS arithmetic_expression { root = createArithmeticExpressionNode("+", $1, $3, NULL); }
                      | arithmetic_expression MINUS arithmetic_expression { root = createArithmeticExpressionNode("-", $1, $3, NULL); }
                      | arithmetic_expression MULTIPLY arithmetic_expression { root = createArithmeticExpressionNode("*", $1, $3, NULL); }
                      | arithmetic_expression DIVIDE arithmetic_expression { root = createArithmeticExpressionNode("/", $1, $3, NULL); }
                      | LEFT_PAREN arithmetic_expression RIGHT_PAREN { root = $2; }
                      ;

boolean_expression : expression EQUAL expression { root = createBooleanExpressionNode("==", $1, $3, NULL); }
                   | expression NOT_EQUAL expression { root = createBooleanExpressionNode("!=", $1, $3, NULL); }
                   | expression LESS_THAN expression { root = createBooleanExpressionNode("<", $1, $3, NULL); }
                   | expression GREATER_THAN expression { root = createBooleanExpressionNode(">", $1, $3, NULL); }
                   | expression AND expression { root = createBooleanExpressionNode("&&", $1, $3, NULL); }
                   | expression OR expression { root = createBooleanExpressionNode("||", $1, $3, NULL); }
                   | NOT boolean_expression { root = createBooleanExpressionNode("!", $2, NULL, NULL); }
                   ;

%%
int main() {
    yyparse();
    printf("Parsing completed.\n");
    return 0;
}
