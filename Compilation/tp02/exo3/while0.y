%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);
%}

%union {
  int ival;
  char *sval;
}

%token <sval> ID
%token <ival> INT
%token ADD SUB MUL DIV ASSIGN
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON
%token IF ELSE WHILE

%%

program:
  stmt_list
  ;

stmt_list:
  stmt SEMICOLON stmt_list
  | stmt SEMICOLON
  ;

stmt:
  assign_stmt
  | if_stmt
  | while_stmt
  ;

assign_stmt:
  ID ASSIGN expr
  ;

if_stmt:
  IF LPAREN expr RPAREN LBRACE stmt_list RBRACE %prec IF
  | IF LPAREN expr RPAREN LBRACE stmt_list RBRACE ELSE LBRACE stmt_list RBRACE
  ;

while_stmt:
  WHILE LPAREN expr RPAREN LBRACE stmt_list RBRACE
  ;

expr:
  ID
  | INT
  | expr ADD expr
  | expr SUB expr
  | expr MUL expr
  | expr DIV expr
  | LPAREN expr RPAREN
  ;

%%

voidyyerror(const char *s) {
  fprintf(stderr, "Erreur : %s\n", s);
}

int main(void) {
  yyparse();
  return 0;
}