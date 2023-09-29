#ifndef SYNTAX_TREE_H
#define SYNTAX_TREE_H

#include <stdlib.h>

// Types d'étiquettes pour les nœuds d'expression arithmétique
typedef enum {
    ADD,      // Addition
    SUBTRACT, // Soustraction
    MULTIPLY, // Multiplication
    DIVIDE    // Division
} TokenType;

// Types d'étiquettes pour les nœuds d'expression booléenne
typedef enum {
    AND, // ET logique
    OR,  // OU logique
    NOT  // NON logique
} BoolType;

// Types d'étiquettes pour les nœuds de commande
typedef enum {
    ASSIGN,  // Affectation
    IF,      // Condition If
    WHILE    // Boucle While
} CmdType;

// Structure d'un nœud d'expression arithmétique
typedef struct ExprNode {
    TokenType type;
    struct ExprNode* left;
    struct ExprNode* right;
} ExprNode;

// Structure d'un nœud d'expression booléenne
typedef struct BoolNode {
    BoolType type;
    struct ExprNode* left;
    struct ExprNode* right;
} BoolNode;

// Structure d'un nœud de commande
typedef struct CmdNode {
    CmdType type;
    struct ExprNode* condition;
    struct CmdNode* trueCmd;
    struct CmdNode* falseCmd;
} CmdNode;

// Constructeur pour un nœud d'expression arithmétique
ExprNode* createExprNode(TokenType type, ExprNode* left, ExprNode* right);

// Constructeur pour un nœud d'expression booléenne
BoolNode* createBoolNode(BoolType type, ExprNode* left, ExprNode* right);

// Constructeur pour un nœud de commande
CmdNode* createCmdNode(CmdType type, ExprNode* condition, CmdNode* trueCmd, CmdNode* falseCmd);

// Accès à l'étiquette d'un nœud d'expression arithmétique
TokenType getExprNodeType(ExprNode* node);

// Accès à l'étiquette d'un nœud d'expression booléenne
BoolType getBoolNodeType(BoolNode* node);

// Accès à l'étiquette d'un nœud de commande
CmdType getCmdNodeType(CmdNode* node);

// Accès aux fils gauche et droit d'un nœud d'expression arithmétique
ExprNode* getExprNodeLeft(ExprNode* node);

ExprNode* getExprNodeRight(ExprNode* node);

// Accès aux fils gauche et droit d'un nœud d'expression booléenne
ExprNode* getBoolNodeLeft(BoolNode* node);

ExprNode* getBoolNodeRight(BoolNode* node);

// Accès aux fils d'un nœud de commande
ExprNode* getCmdNodeCondition(CmdNode* node);

CmdNode* getCmdNodeTrueCmd(CmdNode* node);

CmdNode* getCmdNodeFalseCmd(CmdNode* node);

#endif  // SYNTAX_TREE_H
