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
class resource_manager_t
{
  typedef std::map<int, symbol_t *> rmap_t;

  int _cnt;
  symbol_type_t _type;

  rmap_t _free;
  symlist_t *_union;

public:
  resource_manager_t(symbol_type_t type)
    : _cnt(0), _type(type), _union(new symlist_t()) {}

  symbol_t *gen_resource()
  {
    if ( _free.size() > 0 )
    {
      symbol_t *ret = _free.begin()->second;
      _free.erase(_free.begin());
      return ret;
    }
    else { return new symbol_t(_type, _cnt++); }
  }

  void clear()           { _free.clear(); }
  void free(symbol_t *s) { _free[s->val()] = s; }
  void used(symbol_t *s) { _union->add_unique(s); }

  symlist_t *get_union() { return _union; }

  void reset()
  {
    clear();
    symlist_t::iterator i;
    for ( i = _union->begin(); i != _union->end(); i++ )
      free(*i);
  }
};


//-----------------------------------------------------------------------------
struct ir_func_t
{
  symbol_t &func;
  codenode_t *code;
  symlist_t &temps;
  symlist_t &svtemps;
  symlist_t &args;

  ir_func_t(symbol_t &f, codenode_t *c, symlist_t &t, symlist_t &svt, symlist_t &a)
    : func(f), code(c), temps(t), svtemps(svt), args(a) {}
};

typedef std::list<ir_func_t *> ir_funcs_t;

//-----------------------------------------------------------------------------
struct ir_ctx_t
{
  uint32_t flags;
#define CTX_LVAL 0x1
#define CTX_SAVE 0x2
#define CTX_IF   0x4

  union
  {
    symbol_t *endif;
  };

  ir_ctx_t() : flags(0) {}
  ir_ctx_t(symbol_t *_endif) : flags(CTX_IF), endif(_endif) {}
  ir_ctx_t(uint32_t _flags) : flags(_flags) {}
};

//-----------------------------------------------------------------------------
class ir_engine_t
{
  resource_manager_t temps;
  resource_manager_t svtemps;
  resource_manager_t args;

  symbol_t  &func;
  symtab_t  &strings;
  symlist_t &labels;
  symbol_t  &retloc;

  codenode_t *head;
  codenode_t *tail;

private:
  void check_dest(symbol_t *src);
  void check_src(symbol_t *src);

  symbol_t *gen_temp(uint32_t flags = 0);

  void append(
      codenode_type_t type,
      symbol_t *dest = NULL,
      symbol_t *src1 = NULL,
      symbol_t *src2 = NULL);

  symbol_t *generate(const treenode_t *tree, ir_ctx_t ctx = ir_ctx_t());

public:
  ir_engine_t(symbol_t &f, symtab_t &s, symlist_t &l, symbol_t &r)
    : temps(ST_TEMPORARY), svtemps(ST_SAVED_TEMPORARY), args(ST_ARGUMENT),
      func(f), strings(s), labels(l), retloc(r), head(NULL), tail(NULL) {}

  ir_func_t *generate();
};

//-----------------------------------------------------------------------------
struct ir_t
{
  symtab_t gsyms;
  symtab_t strings;
  symlist_t labels;
  symbol_t retloc;
  ir_funcs_t funcs;

  ir_t(symtab_t &_gsyms) : retloc(ST_RETLOC) { gsyms.swap(_gsyms); }
};

//-----------------------------------------------------------------------------
void generate(ir_t &ir, const symlist_t &functions);

#endif // CODENODE_H
