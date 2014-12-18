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
struct codenode_t;
class symbol_t;
class symtab_t;
class symloc_t;
class symlist_t;

extern symtab_t gsyms;
extern symlist_t functions;

//-----------------------------------------------------------------------------
enum symbol_type_t
{
  ST_PRIMITIVE,
  ST_ARRAY,
  ST_FUNCTION,
  ST_TEMPORARY,
  ST_SAVED_TEMPORARY,
  ST_IMMEDIATE_INT,
  ST_IMMEDIATE_CHAR,
  ST_STRCON,
  ST_LABEL,
  ST_RETLOC,
  ST_ARGUMENT,
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

struct function_t
{
  return_type_t rt;
  symlist_t *params;
  symtab_t *symbols;
  treenode_t *tree;
  bool is_extern, defined;
};

//-----------------------------------------------------------------------------
class symbol_t
{
  std::string _name;
  int _line;

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
  symloc_t loc;

  symbol_t(const char *, int, symbol_type_t, ...);

  symbol_t(symbol_type_t type, int val) : _type(type) { _val = val; }

  symbol_t(symbol_type_t type, const char *str) : _type(type) { _str = str; }

  symbol_t(symbol_type_t type) : _type(type) {}

  ~symbol_t();

  bool is_prim()       const { return _type == ST_PRIMITIVE; }
  bool is_array()      const { return _type == ST_ARRAY; }
  bool is_func()       const { return _type == ST_FUNCTION; }
  bool is_temp()       const { return _type == ST_TEMPORARY
                                   || _type == ST_SAVED_TEMPORARY; }

  std::string name()   const { return _name; }
  const char *c_str()  const { return _name.c_str(); }
  symbol_type_t type() const { return _type; }
  int line()           const { return _line; }
  const char *str()    const { return _str; }
  int val()            const { return _val; }

  primitive_t base()   const { return _type == ST_PRIMITIVE ? _prim : _array.type; }
  asize_t size()       const { return _array.size; }

  return_type_t rt()   const { return _func.rt; }
  symlist_t *params()  const { return _func.params; }
  symtab_t *symbols()  const { return _func.symbols; }
  treenode_t *tree()   const { return _func.tree; }
  bool is_extern()     const { return _func.is_extern; }
  bool defined()       const { return _func.defined; }

  void set_name(const char *name) { _name.assign(name); }

  void set_base(primitive_t base)
  {
    if ( _type == ST_PRIMITIVE )
      _prim = base;
    else
      _array.type = base;
  }

  void set_size(asize_t size)      { _array.size = size; }

  void set_rt(return_type_t rt)    { _func.rt = rt; }
  void set_symbols(symtab_t *syms) { _func.symbols = syms; }
  void set_tree(treenode_t *tree)  { _func.tree = tree; }
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
  void insert(const std::string &key, symbol_t *value)
  {
    ASSERT(1075, key.size() > 0 && value != NULL);
    map[key] = value;
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
class symlist_t : public std::list<symbol_t *>
{
  typedef std::list<symbol_t *> inherited;

public:
  typedef inherited::iterator iterator;
  typedef inherited::const_iterator const_iterator;

  int dist(const_iterator i)
  {
    return std::distance(static_cast<const_iterator>(begin()), i);
  }
  bool has(const symbol_t *s)
  {
    return std::find(begin(), end(), s) != end();
  }
  void add_unique(symbol_t *s)
  {
    if ( !has(s) )
      push_back(s);
  }
  symbol_t *pop()
  {
    symbol_t *s = back();
    pop_back();
    return s;
  }
  void push(symbol_t *s) { push_back(s); }
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
