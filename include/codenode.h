#ifndef CODENODE_H
#define CODENODE_H

#include <map>

class symbol_t;
struct treenode_t;
struct codenode_t;

//-----------------------------------------------------------------------------
enum codenode_type_t
{
  CNT_LW,   CNT_OR,   CNT_MOV,
  CNT_LB,   CNT_AND,  CNT_ARG,
  CNT_SW,   CNT_SLT,  CNT_CALL,
  CNT_SB,   CNT_SGT,  CNT_RET,
  CNT_ADD,  CNT_SGE,  CNT_LEA,
  CNT_SUB,  CNT_SLE,  CNT_CNDJMP,
  CNT_DIV,  CNT_SEQ,  CNT_LABEL,
  CNT_MUL,  CNT_SNE,  CNT_JUMP,
};

//-----------------------------------------------------------------------------
struct codenode_t
{
  codenode_type_t type;
  symbol_t *dest;
  symbol_t *src1;
  symbol_t *src2;
  codenode_t *next;

  codenode_t(codenode_type_t t, symbol_t *d, symbol_t *s1, symbol_t *s2)
    : type(t), dest(d), src1(s1), src2(s2), next(NULL) {}
};

//-----------------------------------------------------------------------------
class code_iterator_t
{
  const codenode_t *ptr;

public:
  code_iterator_t(const codenode_t *head) : ptr(head) {}

  const codenode_t *operator*() const
  {
    return ptr;
  }
  code_iterator_t &operator++()
  {
    if ( ptr != NULL )
      ptr = ptr->next;
    return *this;
  }
  code_iterator_t operator++(int)
  {
    code_iterator_t tmp = *this;
    ++(*this);
    return tmp;
  }
};

//-----------------------------------------------------------------------------
struct codefunc_t
{
  symbol_t &sym;
  codenode_t *code;
  bool has_call;

  symbol_t *ra;
  symlist_t temps;
  symlist_t svtemps;
  symlist_t args;

  codefunc_t(symbol_t &s)
    : sym(s), code(NULL), has_call(false), ra(NULL) {}
};

//-----------------------------------------------------------------------------
typedef std::list<codefunc_t *> codefuncs_t;

//-----------------------------------------------------------------------------
struct ir_t
{
  symtab_t gsyms;
  symtab_t strings;
  symlist_t labels;
  symbol_t retval;
  codefuncs_t funcs;

  ir_t(symtab_t &_gsyms) : retval(ST_RETVAL) { gsyms.swap(_gsyms); }
};

//-----------------------------------------------------------------------------
void generate_ir(ir_t &ir, const treefuncs_t &functions);

#endif // CODENODE_H
