#ifndef CODENODE_H
#define CODENODE_H

#include <symbol.h>

class treefuncs_t;
class treenode_t;
struct codenode_t;
struct ir_t;

//-----------------------------------------------------------------------------
void generate_ir(ir_t &ir, const treefuncs_t &functions);

//-----------------------------------------------------------------------------
// THREE ADDRESS CODE NODE
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

  ~codenode_t() { delete next; }
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
// RESOURCES
//-----------------------------------------------------------------------------

#define TEMPREGQTY 7
#define SVREGQTY   8
#define ARGREGQTY  4

//-----------------------------------------------------------------------------
class resource_manager_t
{
protected:
  symbol_type_t _type;
  int _cnt;

  typedef std::map<int, symref_t> rmap_t;
  rmap_t _free;
  rmap_t _used;

  symref_t get_first_available()
  {
    if ( _free.size() > 0 )
    {
      symref_t ret = _free.begin()->second;
      _free.erase(_free.begin());
      return ret;
    }
    return NULLREF;
  }

public:
  resource_manager_t(symbol_type_t type) : _type(type), _cnt(0) {}

  void free(symref_t s) { _free[s->val()] = s; }
  void use(symref_t s)  { _used[s->val()] = s; }

  virtual symref_t gen_resource() = 0;

  int count() const { return _used.size(); }

  void reset()
  {
    _free.clear();
    rmap_t::const_iterator i;
    for ( i = _used.begin(); i != _used.end(); i++ )
      free(i->second);
  }

  void get_used_resources(symvec_t &vec) const
  {
    rmap_t::const_iterator i;
    for ( i = _used.begin(); i != _used.end(); i++ )
      vec.push_back(i->second);
  }
};

//-----------------------------------------------------------------------------
// manage available registers
class reg_manager_t : public resource_manager_t
{
  int _max;

public:
  reg_manager_t(symbol_type_t type, int max)
    : resource_manager_t(type), _max(max) {}

  virtual symref_t gen_resource()
  {
    symref_t ret = get_first_available();
    if ( ret == NULL && _cnt < _max )
      ret = symref_t(new symbol_t(_type, _cnt++));
    return ret;
  }
};

//-----------------------------------------------------------------------------
// manage stack resources
class stack_manager_t : public resource_manager_t
{
public:
  stack_manager_t(symbol_type_t type) : resource_manager_t(type) {}

  virtual symref_t gen_resource()
  {
    symref_t ret = get_first_available();
    if ( ret == NULL )
      ret = symref_t(new symbol_t(_type, _cnt++));
    return ret;
  }
};

//-----------------------------------------------------------------------------
// return address location is a special case
class ra_manager_t : public resource_manager_t
{
  symref_t ra;

public:
  ra_manager_t()
    : resource_manager_t(ST_RETADDR), ra(new symbol_t(_type)) {}

  virtual symref_t gen_resource() { return ra; }
};

//-----------------------------------------------------------------------------
// IR
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// intermediate representation of a function.
struct codefunc_t
{
  symref_t sym;
  codenode_t *code;
  bool has_call;

  // codefunc objects own all the resources that they use
  symref_t zero;
  ra_manager_t ra;

  stack_manager_t stktemps;
  stack_manager_t stkargs;

  reg_manager_t temps;
  reg_manager_t svregs;
  reg_manager_t regargs;
  reg_manager_t retval;

  codefunc_t(symref_t s)
    : sym(s), code(NULL), has_call(false), zero(new symbol_t(ST_ZERO)),
      stktemps(ST_STACK_TEMPORARY),
       stkargs(ST_STACK_ARGUMENT),
         temps(ST_TEMPORARY,       TEMPREGQTY),
        svregs(ST_SAVED_TEMPORARY, SVREGQTY),
       regargs(ST_REG_ARGUMENT,    ARGREGQTY),
        retval(ST_RETVAL,          1) {}

  ~codefunc_t() { delete code; }
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
// IR GENERATOR
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
struct tree_ctx_t
{
  uint32_t flags;
#define TCTX_LVAL 0x1
#define TCTX_SAVE 0x2
#define TCTX_IF   0x4

  symref_t endif;

  tree_ctx_t(symref_t _endif) : flags(TCTX_IF), endif(_endif) {}
  tree_ctx_t(uint32_t _flags = 0) : flags(_flags), endif(NULL) {}
};

//-----------------------------------------------------------------------------
// intermediate code generator
class codefunc_engine_t
{
  codefunc_t &cf;
  ir_t &ir;

  codenode_t *head;
  codenode_t *tail;

  int lblcnt;

private:
  void check_dest(symref_t src);
  void check_src(symref_t src);

  symref_t gen_temp(uint32_t flags = 0);
  symref_t gen_argloc();

  void append(
      codenode_type_t type,
      symref_t dest = NULLREF,
      symref_t src1 = NULLREF,
      symref_t src2 = NULLREF);

  symref_t generate(const treenode_t *tree, tree_ctx_t ctx = tree_ctx_t());

public:
  codefunc_engine_t(codefunc_t &_cf, ir_t &_ir)
    : cf(_cf), ir(_ir), head(NULL), tail(NULL), lblcnt(0) {}

  void start(const treenode_t *root);
};

#endif // CODENODE_H
