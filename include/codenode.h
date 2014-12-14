#ifndef CODENODE_H
#define CODENODE_H

#include <stdint.h>

class symbol_t;
struct treenode_t;
struct codenode_t;

//-----------------------------------------------------------------------------
enum codenode_type_t
{
  CNT_MOV,
  CNT_LW,
  CNT_LB,
  CNT_SW,
  CNT_SB,
  CNT_ADD,
  CNT_LEA,
  CNT_ARG,
  CNT_CALL,
  CNT_RET,
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
class ir_engine_t
{
  symbol_t *func;
  symtab_t *gsyms;
  symtab_t *strings;
  symlist_t *labels;

  codenode_t *head;
  codenode_t *tail;

  int tmpcnt;

private:
  symbol_t *gen_rval(uint32_t ctx);

  void append(
      codenode_type_t type,
      symbol_t *dest,
      symbol_t *src1,
      symbol_t *src2);

  symbol_t *generate(treenode_t *tree, uint32_t ctx = 0);
#define CTX_LVAL     0x1
#define CTX_SV_RVAL  0x2

public:
  ir_engine_t(symbol_t *, symtab_t *, symtab_t *, symlist_t *);

  void generate();
};

#endif // CODENODE_H
