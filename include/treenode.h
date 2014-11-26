#ifndef TREENODE_H
#define TREENODE_H

struct symbol_t;

//-----------------------------------------------------------------------------
enum treenode_type_t
{
  TNT_ERROR,
  TNT_INTCON,
  TNT_CHARCON,
  TNT_STRCON,
  TNT_SYMBOL,
  // non-leaf nodes:
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
  TNT_STMT,
#define STMT_CUR  0
#define STMT_NEXT 1
  TNT_CALL,
#define CALL_SYM  0
#define CALL_ARGS 1
};

//-----------------------------------------------------------------------------
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
  ~treenode_t();

  bool is_int_compat() const;
};

//-----------------------------------------------------------------------------
#define ERRNODE new treenode_t(TNT_ERROR)

//-----------------------------------------------------------------------------
// describes a sequence of statements in the syntax tree
struct stmt_summary_t
{
  treenode_t *head;
  treenode_t *tail;
  stmt_summary_t(treenode_t *h, treenode_t *t) : head(h), tail(t) {}
};

#endif // TREENODE_H
