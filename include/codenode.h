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
  uint32_t _type;

  rmap_t _free;
  rmap_t _used;

public:
  resource_manager_t(uint32_t type)
    : _cnt(0), _type(type & ST_TYPEMASK) {}

  symbol_t *gen_resource()
  {
    if ( _free.size() > 0 )
    {
      symbol_t *ret = _free.begin()->second;
      _free.erase(_free.begin());
      return ret;
    }
    else
    {
      return new symbol_t(_type, _cnt++);
    }
  }

  void clear()           { _free.clear(); }
  void free(symbol_t *s) { _free[s->val()] = s; }
  void used(symbol_t *s) { _used[s->val()] = s; }

  void reset()
  {
    clear();
    rmap_t::iterator i;
    for ( i = _used.begin(); i != _used.end(); i++ )
      free(i->second);
  }

  void get_used(symlist_t &list)
  {
    for ( rmap_t::iterator i = _used.begin(); i != _used.end(); i++ )
      list.push_back(i->second);
  }
};

//-----------------------------------------------------------------------------
struct codefunc_t
{
  symbol_t &sym;
  codenode_t *code;
  bool has_call;

  symlist_t ra;
  symlist_t temps;
  symlist_t svtemps;
  symlist_t args;

  codefunc_t(symbol_t &s) : sym(s), code(NULL), has_call(false) {}
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
struct tree_ctx_t
{
  uint32_t flags;
#define TCTX_LVAL 0x1
#define TCTX_SAVE 0x2
#define TCTX_IF   0x4

  symbol_t *endif;

  tree_ctx_t(symbol_t *_endif) : flags(TCTX_IF), endif(_endif) {}
  tree_ctx_t(uint32_t _flags = 0) : flags(_flags), endif(NULL) {}
};

//-----------------------------------------------------------------------------
class codefunc_engine_t
{
  codefunc_t &cf;
  symtab_t &strings;
  symlist_t &labels;
  symbol_t &retval;

  resource_manager_t temps;
  resource_manager_t svtemps;
  resource_manager_t args;

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

  symbol_t *generate(const treenode_t *tree, tree_ctx_t ctx = tree_ctx_t());

public:
  codefunc_engine_t(codefunc_t &_cf, ir_t &_ir)
    : cf(_cf),
      strings(_ir.strings), labels(_ir.labels), retval(_ir.retval),
      temps(ST_TEMPORARY),
      svtemps(ST_SAVED_TEMPORARY),
      args(ST_ARGUMENT),
      head(NULL), tail(NULL) {}

  void start(const treenode_t *root);
};

//-----------------------------------------------------------------------------
void generate_ir(ir_t &ir, const treefuncs_t &functions);

#endif // CODENODE_H
