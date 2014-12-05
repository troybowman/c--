#ifndef SYMBOL_H
#define SYMBOL_H

#include <vector>
#include <string>
#include <list>
#include <map>

#include <messages.h>

struct function_t;
struct array_t;
struct treenode_t;
class symbol_t;
class symtab_t;
class symloc_t;

typedef std::list<symbol_t *> symlist_t;

extern symtab_t gsyms;
extern symlist_t functions;

//-----------------------------------------------------------------------------
enum symbol_type_t
{
  ST_UNKNOWN = -1,
  ST_PRIMITIVE,
  ST_ARRAY,
  ST_FUNCTION,
  ST_TEMPORARY,
  ST_STRCON,
  ST_LABEL,
  ST_IMMEDIATE
};

//-----------------------------------------------------------------------------
enum symloc_type_t
{
  SLT_UNKNOWN,
  SLT_REG,
  SLT_STACK,
  SLT_GLOBAL
};

//-----------------------------------------------------------------------------
class symloc_t
{
  symloc_type_t _type;
  union
  {
    int _off;
    const char *_reg;
  };

public:
  symloc_t() : _type(SLT_UNKNOWN) {}

  bool is_stkoff() const { return _type == SLT_STACK;  }
  bool is_reg()    const { return _type == SLT_REG; }
  bool is_global() const { return _type == SLT_GLOBAL; }

  void set_stkoff(int off)      { _type = SLT_STACK; _off = off; }
  void set_reg(const char *reg) { _type = SLT_REG;   _reg = reg; }
  void set_global()             { _type = SLT_GLOBAL; }

  symloc_type_t type() const { return _type; }
  int stkoff()         const { return _off;  }
  const char *reg()    const { return _reg;  }
};

//-----------------------------------------------------------------------------
enum primitive_t
{
  PRIM_UNKNOWN = -1,
  PRIM_INT,
  PRIM_CHAR
};

//-----------------------------------------------------------------------------
typedef int asize_t; // array size

struct array_t
{
  asize_t size;
  primitive_t type;
};

//-----------------------------------------------------------------------------
enum return_type_t
{
  RT_UNKNOWN = PRIM_UNKNOWN,
  RT_INT     = PRIM_INT,
  RT_CHAR    = PRIM_CHAR,
  RT_VOID
};

typedef std::vector<symbol_t *> paramvec_t;

struct function_t
{
  return_type_t rt_type;
  paramvec_t *params;
  symtab_t *symbols;
  treenode_t *syntax_tree;
  bool is_extern;
  bool defined;
};

//-----------------------------------------------------------------------------
class symbol_t
{
  std::string _name;
  int _line;
  symloc_t _loc;

  symbol_type_t _type;
  union
  {
    int _val;
    const char *_str;
    primitive_t _prim;
    array_t _array;
    function_t _func;
  };

public:
  symbol_t(const char *, int, symbol_type_t, ...);

  symbol_t(const char * name, const char *str)
    : _name(name), _type(ST_STRCON) { _str = str; }

  symbol_t(int val) : _type(ST_IMMEDIATE) { _val = val; }

  symbol_t(const char *lbl) : _name(lbl), _type(ST_LABEL) {}

  symbol_t() : _type(ST_TEMPORARY) {}

  ~symbol_t();

  bool is_prim()       const { return _type == ST_PRIMITIVE; }
  bool is_array()      const { return _type == ST_ARRAY; }
  bool is_func()       const { return _type == ST_FUNCTION; }
  bool is_strcon()     const { return _type == ST_STRCON; }
  bool is_temp()       const { return _type == ST_TEMPORARY; }
  bool is_label()      const { return _type == ST_LABEL; }
  bool is_imm()        const { return _type == ST_IMMEDIATE; }

  std::string name()   const { return _name; }
  const char *c_str()  const { return _name.c_str(); }
  symbol_type_t type() const { return _type; }
  int line()           const { return _line; }
  const char *str()    const { return _str; }
  int val()            const { return _val; }

  primitive_t prim()   const { return _prim; }

  primitive_t base()   const { return _array.type; }
  asize_t size()       const { return _array.size; }

  return_type_t rt()   const { return _func.rt_type; }
  paramvec_t *params() const { return _func.params; }
  symtab_t *symbols()  const { return _func.symbols; }
  treenode_t *tree()   const { return _func.syntax_tree; }
  bool is_extern()     const { return _func.is_extern; }
  bool defined()       const { return _func.defined; }

  void set_prim(primitive_t prim) { _prim = prim; }

  void set_base(primitive_t base)  { _array.type = base; }
  void set_size(asize_t size)      { _array.size = size; }

  void set_rt(return_type_t rt)    { _func.rt_type = rt; }
  void set_symbols(symtab_t *syms) { _func.symbols = syms; }
  void set_tree(treenode_t *tree)  { _func.syntax_tree = tree; }
  void set_extern(bool is_extern = true) { _func.is_extern = is_extern; }
  void set_defined(bool defined = true)  { _func.defined = defined; }
};

//-----------------------------------------------------------------------------
class symtab_t // symbol table
{
  typedef std::map<std::string, symbol_t *> smap_t;

  smap_t map;

public:
  symbol_t *get(const std::string &key)
  {
    try { return map.at(key); }
    catch ( const std::out_of_range & ) { return NULL; }
  }

  void insert(symbol_t *value)
  {
    ASSERT(1013, value != NULL);
    map[value->name()] = value;
  }

  typedef smap_t::iterator iterator;
  typedef smap_t::const_iterator const_iterator;

  iterator begin() { return map.begin(); }
  iterator end()   { return map.end(); }
  const_iterator begin() const { return map.begin(); }
  const_iterator end()   const { return map.end(); }
  size_t size()          const { return map.size(); }
};

//-----------------------------------------------------------------------------
struct array_sfx_t
{
  int code;
#define ASFX_OK     1
#define ASFX_NONE   0
#define ASFX_ERROR -1
  int size;
};

#endif // SYMBOL_H
