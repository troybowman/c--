#ifndef TREENODE_H
#define TREENODE_H

#include <symbol.h>

//-----------------------------------------------------------------------------
enum treenode_type_t
{
  // leaf nodes
  TNT_ERROR,
  TNT_INTCON,
  TNT_CHARCON,
  TNT_STRCON,
  TNT_SYMBOL,
  // non-leaf nodes
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
class treenode_t
{
  treenode_type_t _type;
  union
  {
    int _val;
    char *_str;
    usymref_t _sym;
  };

public:
  treenode_t *children[4];

  treenode_t(treenode_type_t type, ...);
  treenode_t(symref_t ref, treenode_type_t, ...);
  ~treenode_t();

  treenode_type_t type()  const { return _type; }
  int val()               const { return _val;  }
  char *str()             const { return _str;  }
  symref_t &sym()         const { return getref(_sym); }

  bool is_int_compat()    const;
  bool is_bool_compat()   const;
  bool is_string_compat() const;
};

//-----------------------------------------------------------------------------
// helps build linear sequences of related treenodes
// (like statements, argument lists, etc)
struct seq_t
{
  treenode_t *head;
  treenode_t *tail;
};

//-----------------------------------------------------------------------------
seq_t &seq_append(seq_t &seq, const treenode_t *cur, treenode_type_t type);

#ifndef NDEBUG
bool is_seq_type(treenode_type_t type);
#endif

//-----------------------------------------------------------------------------
struct stx_tree_t // syntax tree
{
  symref_t sym;
  treenode_t *root;

  stx_tree_t(symref_t _sym, treenode_t *_root)
    : sym(_sym), root(_root) {}
};

// defined as an empty class so we can forward declare it
class stx_trees_t : public std::vector<stx_tree_t> {};

//-----------------------------------------------------------------------------
#define ERRNODE new treenode_t(TNT_ERROR)

//-----------------------------------------------------------------------------
int calc_seq_len(const treenode_t *root);

//-----------------------------------------------------------------------------
#define DEFINE_TREE_ITERATOR(name, constness)            \
class name                                               \
{                                                        \
  constness treenode_t *ptr;                             \
public:                                                  \
  name(constness treenode_t *root) : ptr(root) {}        \
  constness treenode_t *operator*() const                \
  {                                                      \
    return ptr != NULL ? ptr->children[SEQ_CUR] : NULL;  \
  }                                                      \
  name &operator++()                                     \
  {                                                      \
    if ( ptr != NULL )                                   \
      ptr = ptr->children[SEQ_NEXT];                     \
    return *this;                                        \
  }                                                      \
  name operator++(int)                                   \
  {                                                      \
    name tmp = *this;                                    \
    ++(*this);                                           \
    return tmp;                                          \
  }                                                      \
  constness treenode_t *next() const                     \
  {                                                      \
    return ptr != NULL ? ptr->children[SEQ_NEXT] : NULL; \
  }                                                      \
}

DEFINE_TREE_ITERATOR(tree_iterator_t, );
DEFINE_TREE_ITERATOR(const_tree_iterator_t, const);

#endif // TREENODE_H
