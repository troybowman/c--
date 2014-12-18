#ifndef CODENODE_H
#define CODENODE_H

#include <stdint.h>
#include <vector>

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
class resource_manager_t
{
  int _cnt;
  symbol_type_t _type;

  symvec_t *_free;
  symvec_t *_used;

  resource_manager_t() {} // No.

public:

  resource_manager_t(symbol_type_t type) : _cnt(0), _type(type)
  {
    _free = new symvec_t();
    _used = new symvec_t();
  }

  symbol_t *gen_resource()
  {
    if ( _free->size() > 0 )
      return _free->pop();
    else
      return new symbol_t(_type, _cnt++);
  }

  void free(symbol_t *s) { _free->push(s); }
  void add_used(symbol_t *s) { _used->add_unique(s); }
  symvec_t *get_used() { return _used; }
  void clear() { _free->clear(); }

  void reset()
  {
    clear();
    symvec_t::iterator i;
    for ( i = _used->begin(); i != _used->end(); i++ )
      free(*i);
  }
};


//-----------------------------------------------------------------------------
struct ir_func_t
{
  symbol_t *func;
  codenode_t *code;
  symvec_t *temps;
  symvec_t *svtemps;
  symvec_t *args;

  ir_func_t(symbol_t *f, codenode_t *c, symvec_t *t,
    symvec_t *svt, symvec_t *a)
      : func(f), code(c), temps(t), svtemps(svt), args(a) {}
};

typedef std::list<ir_func_t *> ir_funcs_t;


//-----------------------------------------------------------------------------
enum ir_ctx_t
{
  IRCTX_NONE,
  IRCTX_LVAL,
  IRCTX_SV_RVAL,
  IRCTX_ARG,
};

//-----------------------------------------------------------------------------
class ir_engine_t
{
  resource_manager_t temps;
  resource_manager_t svtemps;
  resource_manager_t args;

  symbol_t *func;
  symtab_t *strings;
  symlist_t *labels;
  symbol_t *retloc;

  codenode_t *head;
  codenode_t *tail;

private:
  void check_dest(symbol_t *src);
  void check_src(symbol_t *src);

  symbol_t *gen_temp(ir_ctx_t ctx = IRCTX_NONE);

  void append(codenode_type_t type, symbol_t *dest,
    symbol_t *src1, symbol_t *src2);

  symbol_t *generate(treenode_t *tree, ir_ctx_t ctx = IRCTX_NONE);

public:
  ir_engine_t(symbol_t *func, symtab_t *strings,
    symlist_t *labels, symbol_t *retloc);

  ir_func_t *generate();
};

//-----------------------------------------------------------------------------
struct ir_t
{
  symtab_t *gsyms;
  symtab_t *strings;
  symlist_t *labels;
  symbol_t *retloc;
  ir_funcs_t funcs;

  ir_t(symtab_t *_gsyms) : gsyms(_gsyms)
  {
    strings = new symtab_t();
    labels = new symlist_t();
    retloc = new symbol_t(ST_RETLOC);
  }
};
#endif // CODENODE_H
