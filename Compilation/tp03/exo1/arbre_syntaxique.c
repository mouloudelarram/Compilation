#include "arbre_syntaxique.h"
#include <stdlib.h>
#include <string.h>

SyntaxTreeNode* createArithmeticExpression(const char* label, SyntaxTreeNode* child1, SyntaxTreeNode* child2, SyntaxTreeNode* child3) {
    SyntaxTreeNode* newNode = (SyntaxTreeNode*)malloc(sizeof(SyntaxTreeNode));
    newNode->type = ARITHMETIC_EXPRESSION;
    strcpy(newNode->label, label);
    newNode->children[0] = child1;
    newNode->children[1] = child2;
    newNode->children[2] = child3;
    return newNode;
}

SyntaxTreeNode* createBooleanExpression(const char* label, SyntaxTreeNode* child1, SyntaxTreeNode* child2, SyntaxTreeNode* child3) {
    SyntaxTreeNode* newNode = (SyntaxTreeNode*)malloc(sizeof(SyntaxTreeNode));
    newNode->type = BOOLEAN_EXPRESSION;
    strcpy(newNode->label, label);
    newNode->children[0] = child1;
    newNode->children[1] = child2;
    newNode->children[2] = child3;
    return newNode;
}

SyntaxTreeNode* createCommand(const char* label, SyntaxTreeNode* child1, SyntaxTreeNode* child2, SyntaxTreeNode* child3) {
    SyntaxTreeNode* newNode = (SyntaxTreeNode*)malloc(sizeof(SyntaxTreeNode));
    newNode->type = COMMAND;
    strcpy(newNode->label, label);
    newNode->children[0] = child1;
    newNode->children[1] = child2;
    newNode->children[2] = child3;
    return newNode;
}

const char* getLabel(SyntaxTreeNode* node) {
    return node->label;
}

SyntaxTreeNode* getChild(SyntaxTreeNode* node, int index) {
    if (index >= 0 && index < 3)
        return node->children[index];
    else
        return NULL;
}















































/*
#include "tree.h"
#include <stdlib.h>

Node* createNode(char label) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->label = label;
    newNode->children = NULL;
    newNode->numChildren = 0;
    return newNode;
}

void addChild(Node* parent, Node* child) {
    int numChildren = parent->numChildren;
    parent->children = (Node**)realloc(parent->children, (numChildren + 1) * sizeof(Node*));
    parent->children[numChildren] = child;
    parent->numChildren++;
}

char getLabel(Node* node) {
    return node->label;
}

Node** getChildren(Node* node) {
    return node->children;
}

int getNumChildren(Node* node) {
    return node->numChildren;
}
*/