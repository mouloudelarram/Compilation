%{
#include <stdio.h>
#include "tokens.h"

int yylex();
void yyerror(const char* message);

%}

%token WHILE IF THEN ELSE SKIP TRUE FALSE NOT AND OR
%token EQUAL NOT_EQUAL LESS_THAN GREATER_THAN LESS_THAN_EQUAL GREATER_THAN_EQUAL
%token PLUS MINUS MULTIPLY DIVIDE MODULO LPAREN RPAREN SEMICOLON ASSIGN DO
%token IDENTIFIER INTEGER

%left PLUS MINUS
%left MULTIPLY DIVIDE MODULO
%nonassoc UMINUS

%%

program : statement
        | program statement
        ;

statement : expression SEMICOLON
          | assignment SEMICOLON
          | conditional_statement
          | while_loop
          | SKIP SEMICOLON
          ;

expression : arithmetic_expression
           | boolean_expression
           ;

arithmetic_expression : INTEGER
                      | IDENTIFIER
                      | arithmetic_expression PLUS arithmetic_expression
                      | arithmetic_expression MINUS arithmetic_expression
                      | arithmetic_expression MULTIPLY arithmetic_expression
                      | arithmetic_expression DIVIDE arithmetic_expression
                      | arithmetic_expression MODULO arithmetic_expression
                      | LPAREN arithmetic_expression RPAREN
                      | MINUS arithmetic_expression %prec UMINUS
                      ;

boolean_expression : TRUE
                   | FALSE
                   | NOT boolean_expression
                   | boolean_expression AND boolean_expression
                   | boolean_expression OR boolean_expression
                   | arithmetic_expression relational_operator arithmetic_expression
                   | LPAREN boolean_expression RPAREN
                   ;

relational_operator : EQUAL
                    | NOT_EQUAL
                    | LESS_THAN
                    | GREATER_THAN
                    | LESS_THAN_EQUAL
                    | GREATER_THAN_EQUAL
                    ;

assignment : IDENTIFIER ASSIGN arithmetic_expression
           ;

conditional_statement : IF boolean_expression THEN program ELSE program
                      ;

while_loop : WHILE boolean_expression DO program
           ;

%%

void yyerror(const char* message) {
    printf("Error: %s\n", message);
}

int main() {
    return yyparse();
}
