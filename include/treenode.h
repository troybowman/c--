#ifndef TREENODE_H
#define TREENODE_H

struct symbol_t;

enum treenode_type_t
{
  TNT_EMPTY,
  TNT_ERROR,

  TNT_INTCON,
  TNT_STRCON,
  TNT_SYMBOL,

  TNT_ASSG,
  TNT_PLUS,
  TNT_MINUS,
  TNT_MULT,
  TNT_DIV,
  TNT_LT,
  TNT_GT,
  TNT_LEQ,
  TNT_GEQ,
  TNT_EQ,
  TNT_NEQ,
  TNT_AND,
  TNT_OR,
#define LHS 0
#define RHS 1

  TNT_ARRAY_LOOKUP,
#define AL_BASE   0
#define AL_OFFSET 1

  TNT_FOR,
#define FOR_INIT  0
#define FOR_CHECK 1
#define FOR_INC   2
#define FOR_BODY  3
};

struct treenode_t
{
  treenode_type_t type;
  union
  {
    int val;
    char *str;
    symbol_t *sym;
  };
  treenode_t *children[4];
  treenode_t(treenode_type_t _type, ...);
};

#endif // TREENODE_H
