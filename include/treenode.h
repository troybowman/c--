#ifndef TREENODE_H
#define TREENODE_H

#include <vector>

class symbol_t;
struct treenode_t;

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
  TNT_NOT,
  TNT_NEG,
#define LHS         0
#define RHS         1
  TNT_ARRAY_LOOKUP,
#define AL_OFFSET   0
  TNT_FOR,
#define FOR_INIT    0
#define FOR_COND    1
#define FOR_INC     2
#define FOR_BODY    3
  TNT_STMT,
  TNT_ARG,
#define SEQ_CUR     0
#define SEQ_NEXT    1
  TNT_CALL,
#define CALL_ARGS   0
  TNT_RET,
#define RET_EXPR    0
  TNT_IF,
#define IF_COND     0
#define IF_BODY     1
#define IF_ELSE     2
  TNT_WHILE,
#define WHILE_COND  0
#define WHILE_BODY  1
  TNT_PRINTF,
#define PRINTF_TREE 0
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
  bool is_bool_compat() const;
  bool is_string_compat() const;
};

//-----------------------------------------------------------------------------
struct treefunc_t
{
  symbol_t &sym;
  treenode_t *tree;
  treefunc_t(symbol_t &_sym, treenode_t *_tree) : sym(_sym), tree(_tree) {}
};

class treefuncs_t : public std::vector<treefunc_t> {};

//-----------------------------------------------------------------------------
#define ERRNODE new treenode_t(TNT_ERROR)

#ifndef NDEBUG
bool is_seq_type(treenode_type_t type);
#endif

//-----------------------------------------------------------------------------
class tree_iterator_t
{
  const treenode_t *ptr;

public:
  tree_iterator_t(const treenode_t *root) : ptr(root) {}

  const treenode_t *operator*() const
  {
    return ptr != NULL ? ptr->children[SEQ_CUR] : NULL;
  }
  tree_iterator_t &operator++()
  {
    if ( ptr != NULL )
      ptr = ptr->children[SEQ_NEXT];
    return *this;
  }
  tree_iterator_t operator++(int)
  {
    tree_iterator_t tmp = *this;
    ++(*this);
    return tmp;
  }
};

#endif // TREENODE_H
