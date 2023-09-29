/* A Bison parser, made by GNU Bison 3.7.5.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    WHILE = 258,                   /* WHILE  */
    IF = 259,                      /* IF  */
    THEN = 260,                    /* THEN  */
    ELSE = 261,                    /* ELSE  */
    SKIP = 262,                    /* SKIP  */
    TRUE = 263,                    /* TRUE  */
    FALSE = 264,                   /* FALSE  */
    NOT = 265,                     /* NOT  */
    AND = 266,                     /* AND  */
    OR = 267,                      /* OR  */
    EQUAL = 268,                   /* EQUAL  */
    NOT_EQUAL = 269,               /* NOT_EQUAL  */
    LESS_THAN = 270,               /* LESS_THAN  */
    GREATER_THAN = 271,            /* GREATER_THAN  */
    LESS_THAN_EQUAL = 272,         /* LESS_THAN_EQUAL  */
    GREATER_THAN_EQUAL = 273,      /* GREATER_THAN_EQUAL  */
    PLUS = 274,                    /* PLUS  */
    MINUS = 275,                   /* MINUS  */
    MULTIPLY = 276,                /* MULTIPLY  */
    DIVIDE = 277,                  /* DIVIDE  */
    MODULO = 278,                  /* MODULO  */
    LPAREN = 279,                  /* LPAREN  */
    RPAREN = 280,                  /* RPAREN  */
    SEMICOLON = 281,               /* SEMICOLON  */
    ASSIGN = 282,                  /* ASSIGN  */
    DO = 283,                      /* DO  */
    IDENTIFIER = 284,              /* IDENTIFIER  */
    INTEGER = 285,                 /* INTEGER  */
    UMINUS = 286                   /* UMINUS  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define WHILE 258
#define IF 259
#define THEN 260
#define ELSE 261
#define SKIP 262
#define TRUE 263
#define FALSE 264
#define NOT 265
#define AND 266
#define OR 267
#define EQUAL 268
#define NOT_EQUAL 269
#define LESS_THAN 270
#define GREATER_THAN 271
#define LESS_THAN_EQUAL 272
#define GREATER_THAN_EQUAL 273
#define PLUS 274
#define MINUS 275
#define MULTIPLY 276
#define DIVIDE 277
#define MODULO 278
#define LPAREN 279
#define RPAREN 280
#define SEMICOLON 281
#define ASSIGN 282
#define DO 283
#define IDENTIFIER 284
#define INTEGER 285
#define UMINUS 286

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
