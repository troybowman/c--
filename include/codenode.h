#ifndef CODENODE_H
#define CODENODE_H

#include <resource.h>

struct codenode_t;
class treefuncs_t;

//-----------------------------------------------------------------------------
enum codenode_type_t
{
  CNT_LW,   CNT_OR,   CNT_MOV,    CNT_LI,
  CNT_LB,   CNT_AND,  CNT_ARG,    CNT_SLL,
  CNT_SW,   CNT_SLT,  CNT_CALL,   CNT_XOR,
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
  symref_t dest;
  symref_t src1;
  symref_t src2;
  codenode_t *next;

  codenode_t(codenode_type_t t, symref_t d, symref_t s1, symref_t s2)
    : type(t), dest(d), src1(s1), src2(s2), next(NULL) {}
};

//-----------------------------------------------------------------------------
class code_iterator_t
{
  codenode_t *ptr;

public:
  code_iterator_t(codenode_t *head) : ptr(head) {}

  codenode_t *operator*() const
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
// intermediate representation of a function
struct codefunc_t
{
  symref_t sym;
  codenode_t *code;
  bool has_call;
  symref_t zero;

  ra_manager_t ra;
  stktemp_manager_t stktemps;
  temp_manager_t temps;
  svreg_manager_t svregs;
  argreg_manager_t regargs;
  stkarg_manager_t stkargs;
  retval_manager_t retval;

  codefunc_t(symref_t s)
    : sym(s), code(NULL), has_call(false), zero(new symbol_t(ST_ZERO)) {}
};

//-----------------------------------------------------------------------------
typedef std::vector<codefunc_t *> codefuncs_t;

//-----------------------------------------------------------------------------
struct ir_t
{
  symtab_t gsyms;
  symtab_t strings;
  symvec_t labels;
  codefuncs_t funcs;

  ir_t(symtab_t &_gsyms) { gsyms.swap(_gsyms); }
};

//-----------------------------------------------------------------------------
void generate_ir(ir_t &ir, const treefuncs_t &functions);

#endif // CODENODE_H
