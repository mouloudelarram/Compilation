#include "syntax_tree.h"

// Constructeur pour un nœud d'expression arithmétique
ExprNode* createExprNode(TokenType type, ExprNode* left, ExprNode* right) {
    ExprNode* node = (ExprNode*)malloc(sizeof(ExprNode));
    node->type = type;
    node->left = left;
    node->right = right;
    return node;
}

// Constructeur pour un nœud d'expression booléenne
BoolNode* createBoolNode(BoolType type, ExprNode* left, ExprNode* right) {
    BoolNode* node = (BoolNode*)malloc(sizeof(BoolNode));
    node->type = type;
    node->left = left;
    node->right = right;
    return node;
}

// Constructeur pour un nœud de commande
CmdNode* createCmdNode(CmdType type, ExprNode* condition, CmdNode* trueCmd, CmdNode* falseCmd) {
    CmdNode* node = (CmdNode*)malloc(sizeof(CmdNode));
    node->type = type;
    node->condition = condition;
    node->trueCmd = trueCmd;
    node->falseCmd = falseCmd;
    return node;
}

// Accès à l'étiquette d'un nœud d'expression arithmétique
TokenType getExprNodeType(ExprNode* node) {
    return node->type;
}

// Accès à l'étiquette d'un nœud d'expression booléenne
BoolType getBoolNodeType(BoolNode* node) {
    return node->type;
}

// Accès à l'étiquette d'un nœud de commande
CmdType getCmdNodeType(CmdNode* node) {
    return node->type;
}

// Accès aux fils gauche et droit d'un nœud d'expression arithmétique
ExprNode* getExprNodeLeft(ExprNode* node) {
    return node->left;
}

ExprNode* getExprNodeRight(ExprNode* node) {
    return node->right;
}

// Accès aux fils gauche et droit d'un nœud d'expression booléenne
ExprNode* getBoolNodeLeft(BoolNode* node) {
    return node->left;
}

ExprNode* getBoolNodeRight(BoolNode* node) {
    return node->right;
}

// Accès aux fils d'un nœud de commande
ExprNode* getCmdNodeCondition(CmdNode* node) {
    return node->condition;
}

CmdNode* getCmdNodeTrueCmd(CmdNode* node) {
    return node->trueCmd;
}

CmdNode* getCmdNodeFalseCmd(CmdNode* node) {
    return node->falseCmd;
}
