#ifndef SYNTAX_TREE_H
#define SYNTAX_TREE_H

// Enumération des types de nœuds de l'arbre syntaxique
typedef enum {
    ARITHMETIC_EXPRESSION,
    BOOLEAN_EXPRESSION,
    COMMAND
} NodeType;

// Structure de nœud pour l'arbre syntaxique
typedef struct SyntaxTreeNode {
    NodeType type;                      // Type de nœud
    char label[20];                     // Étiquette du nœud
    struct SyntaxTreeNode* children[3];  // Fils du nœud (jusqu'à 3 fils dans cet exemple)
} SyntaxTreeNode;

// Constructeurs d'arbres syntaxiques
SyntaxTreeNode* createArithmeticExpression(const char* label, SyntaxTreeNode* child1, SyntaxTreeNode* child2, SyntaxTreeNode* child3);
SyntaxTreeNode* createBooleanExpression(const char* label, SyntaxTreeNode* child1, SyntaxTreeNode* child2, SyntaxTreeNode* child3);
SyntaxTreeNode* createCommand(const char* label, SyntaxTreeNode* child1, SyntaxTreeNode* child2, SyntaxTreeNode* child3);

// Accesseurs aux nœuds de l'arbre syntaxique
const char* getLabel(SyntaxTreeNode* node);
SyntaxTreeNode* getChild(SyntaxTreeNode* node, int index);

#endif
































/*#ifndef TREE_H
#define TREE_H

typedef struct Node {
    char label;
    struct Node** children;
    int numChildren;
} Node;

Node* createNode(char label);
void addChild(Node* parent, Node* child);
char getLabel(Node* node);
Node** getChildren(Node* node);
int getNumChildren(Node* node);

#endif /* TREE_H */
