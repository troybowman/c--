#ifndef CODENODE_H
#define CODENODE_H

#include <symbol.h>

struct ir_t;
class treenode_t;
struct parse_results_t;

//-----------------------------------------------------------------------------
void generate_ir(ir_t &out, parse_results_t &pres);

//-----------------------------------------------------------------------------
enum codenode_type_t
{
  CNT_LW,   CNT_OR,   CNT_MOV,    CNT_LI,
  CNT_LB,   CNT_AND,  CNT_ARG,    CNT_SLL,
  CNT_SW,   CNT_SLT,  CNT_CALL,   CNT_XOR,
  CNT_SB,   CNT_SGT,  CNT_RET,    CNT_SRLV,
  CNT_ADD,  CNT_SGE,  CNT_LEA,    CNT_NOT,
  CNT_SUB,  CNT_SLE,  CNT_CNDJMP, CNT_SLLV,
  CNT_DIV,  CNT_SEQ,  CNT_LABEL,
  CNT_MUL,  CNT_SNE,  CNT_JUMP,
};

//-----------------------------------------------------------------------------
// three address code node
struct codenode_t
{
  codenode_type_t type;

  symref_t dest;
  symref_t src1;
  symref_t src2;

  codenode_t *next;

  codenode_t(codenode_type_t t, symref_t d, symref_t s1, symref_t s2) :
    type(t),
    dest(d),
    src1(s1),
    src2(s2),
    next(NULL) {}

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

  symref_t get_first_available();

public:
  resource_manager_t(symbol_type_t type) : _type(type), _cnt(0) {}
  virtual ~resource_manager_t() {}

  void free(symref_t s) { _free[s->val()] = s; }
  void use(symref_t s)  { _used[s->val()] = s; }
  int count()     const { return _used.size(); }

  void reset();
  void get_used_resources(symvec_t &vec) const;

  virtual symref_t gen_resource() = 0;
};

//-----------------------------------------------------------------------------
typedef std::map<symbol_type_t, resource_manager_t *> resource_store_t;

//-----------------------------------------------------------------------------
// intermediate representation of a function
class ir_func_t
{
  symref_t _sym;
  codenode_t *_code;
  bool _has_call;
  resource_store_t _store;

public:
  ir_func_t(symref_t s);
  ~ir_func_t();

  symref_t sym()              const { return _sym; }
  bool has_call()             const { return _has_call; }
  codenode_t *code()          const { return _code; }

  void setcall()                    { _has_call = true; }
  void set_code(codenode_t *c)      { _code = c; }

  void free(symref_t sym)           { _store[sym->type()]->free(sym); }
  void use(symref_t sym)            { _store[sym->type()]->use(sym);  }

  void reset(symbol_type_t st)      { _store.at(st)->reset(); }
  int count(symbol_type_t st) const { return _store.at(st)->count(); }

  symref_t gen_resource(symbol_type_t st)
  {
    return _store.at(st)->gen_resource();
  }
  void get_used_resources(symbol_type_t st, symvec_t &vec) const
  {
    _store.at(st)->get_used_resources(vec);
  }
  const resource_manager_t *get(symbol_type_t st) const
  {
    return _store.at(st);
  }
};

//-----------------------------------------------------------------------------
class ir_funcs_t : public std::vector<ir_func_t *>
{
public:
  ~ir_funcs_t()
  {
    for ( iterator i = begin(); i != end(); i++ )
      delete *i;
  }
};

//-----------------------------------------------------------------------------
class strtab_t : public reftab_t<symbol_t>
{
public:
  virtual bool insert(symret_t strcon)
  {
    ASSERT(0, strcon != NULL && strcon->st() == ST_STRCON);
    return insert(strcon->str(), strcon);
  }
}

//-----------------------------------------------------------------------------
struct ir_t
{
  symtab_t gsyms;
  strtab_t strings;
  symvec_t labels;
  ir_funcs_t funcs;
};

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
// generates intermediate code for a single function
class ir_engine_t
{
  ir_func_t &f;
  ir_t &ir;

  codenode_t *head;
  codenode_t *tail;

  int lblcnt;

private:
  void check_dest(symref_t src);
  void check_src(symref_t src);

  symref_t gen_temp(uint32_t flags = 0, typeref_t = NULLTYPE);
  symref_t gen_argloc();

  void append(
      codenode_type_t type,
      symref_t dest = NULLREF,
      symref_t src1 = NULLREF,
      symref_t src2 = NULLREF);

  void apparg(symref_t argloc, symref_t val);
  symref_t applookup(symref_t base, symref_t off, uint32_t flags);

  symref_t generate(const treenode_t *tree, tree_ctx_t ctx = tree_ctx_t());

public:
  ir_engine_t(ir_func_t &_f, ir_t &_ir)
    : f(_f), ir(_ir), head(NULL), tail(NULL), lblcnt(0) {}

  void start(const treenode_t *root);
};

#endif // CODENODE_H
