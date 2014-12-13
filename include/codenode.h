#ifndef CODENODE_H
#define CODENODE_H

#include <stdint.h>

struct symbol_t;
struct treenode_t;
struct codenode_t;

//-----------------------------------------------------------------------------
class ir_engine_t
{
  codenode_t *head;
  codenode_t *tail;

  int tmpcnt;
  symtab_t *strings;

private:
  symbol_t *gen_rval();

  void append(
      codenode_type_t type,
      symbol_t *dest,
      symbol_t *src1,
      symbol_t *src2);

  symbol_t *generate(treenode_t *tree, uint32_t ctx);
#define CTX_LVAL     0x1
#define CTX_SV_RVAL  0x2

public:
  ir_engine_t(symlist_t *functions);
  void start();
}

//-----------------------------------------------------------------------------
enum codenode_type_t
{
  CNT_MOV,
  CNT_LW,
  CNT_LB,
  CNT_SW,
  CNT_SB,
  CNT_ADD,
  CNT_ARG,
  CNT_CALL
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
    : type(t), dest(d), src1(s1), src2(s2) {}
};

#endif // CODENODE_H
