#ifndef SYMBOL_H
#define SYMBOL_H

#include <stdint.h>

#include <vector>
#include <string>
#include <list>
#include <map>

#include <messages.h>

struct treenode_t;
class symtab_t;

//-----------------------------------------------------------------------------
enum symbol_type_t
{
  ST_PRIMITIVE,
  ST_ARRAY,
  ST_FUNCTION,
  ST_TEMPORARY,
  ST_SAVED_TEMPORARY,
  ST_INTCON,
  ST_CHARCON,
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

  void assign(const symloc_t &loc);

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
typedef uint32_t asize_t;   // array size
#define BADSIZE asize_t(-1) // invalid array size

//-----------------------------------------------------------------------------
enum return_type_t
{
  RT_UNKNOWN = PRIM_UNKNOWN,
  RT_INT     = PRIM_INT,
  RT_CHAR    = PRIM_CHAR,
  RT_VOID
};

//-----------------------------------------------------------------------------
class symbol_t
{
  std::string _name;
  int _line;

  symbol_type_t _type;
  union
  {
    int _val;             // ST_TEMPORARY, ST_SAVED_TEMPORARY, ST_ARGUMENT, ST_INTCON

    const char *_str;     // ST_STRCON, ST_CHARCON

    primitive_t _base;    // ST_PRIMITIVE

    struct                // ST_ARRAY
    {
      primitive_t _eltyp;
      asize_t _size;
    };

    struct                // ST_FUNCTION
    {
      return_type_t _rt;
      symlist_t *_params;
      symtab_t *_symbols;
      treenode_t *_tree;
      bool _is_extern;
      bool _defined;
    };
  };

public:
  symloc_t loc;

  symbol_t(const char *, int, symbol_type_t, ...);

  symbol_t(symbol_type_t type, int val) : _type(type) { _val = val; }

  symbol_t(symbol_type_t type, const char *str) : _type(type) { _str = str; }

  symbol_t(symbol_type_t type) : _type(type) {}

  symbol_t(const symbol_t &sym);

  ~symbol_t();

  bool is_prim()       const { return _type == ST_PRIMITIVE; }
  bool is_array()      const { return _type == ST_ARRAY; }
  bool is_func()       const { return _type == ST_FUNCTION; }

  std::string name()   const { return _name; }
  const char *c_str()  const { return _name.c_str(); }
  symbol_type_t type() const { return _type; }
  int line()           const { return _line; }
  const char *str()    const { return _str; }
  int val()            const { return _val; }

  primitive_t base()   const { return _base; }
  asize_t size()       const { return _size; }

  return_type_t rt()   const { return _rt; }
  symlist_t *params()  const { return _params; }
  symtab_t *symbols()  const { return _symbols; }
  treenode_t *tree()   const { return _tree; }
  bool is_extern()     const { return _is_extern; }
  bool defined()       const { return _defined; }

  void set_name(const char *name)  { _name.assign(name); }

  void set_base(primitive_t base)  { _base = base; }
  void set_size(asize_t size)      { _size = size; }

  void set_rt(return_type_t rt)    { _rt = rt; }
  void set_symbols(symtab_t *syms) { _symbols = syms; }
  void set_tree(treenode_t *tree)  { _tree = tree; }
  void set_extern(bool is_extern = true) { _is_extern = is_extern; }
  void set_defined(bool defined = true)  { _defined = defined; }

  void set_val(int val) { _val = val; }

  void make_asm_name() { _name.insert(0, 1, '_'); }
};

//-----------------------------------------------------------------------------
class symlist_t : public std::list<symbol_t *>
{
public:
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
};

//-----------------------------------------------------------------------------
// symbol table
class symtab_t
{
  typedef std::map<std::string, symbol_t*> symmap_t;

  symmap_t map;   // fast lookups...
  symlist_t list; // ...while maintaining insertion order

public:
  symbol_t *get(const std::string &key) const
  {
    symmap_t::const_iterator i = map.find(key);
    return i != map.end() ? i->second : NULL;
  }
  void insert(const std::string &key, symbol_t *value)
  {
    ASSERT(1075, key.size() > 0 && value != NULL);
    map[key] = value;
    list.push_back(value);
  }
  void insert(symbol_t *value)
  {
    insert(value->name(), value);
  }
  void erase(const std::string &key)
  {
    symbol_t *sym = map.find(key)->second;
    map.erase(key);
    list.remove(sym);
  }

  // always iterate in insertion order
  typedef symlist_t::iterator iterator;
  typedef symlist_t::const_iterator const_iterator;

  typedef symlist_t::reverse_iterator reverse_iterator;
  typedef symlist_t::const_reverse_iterator const_reverse_iterator;

  iterator begin() { return list.begin(); }
  iterator end()   { return list.end(); }
  const_iterator begin() const { return list.begin(); }
  const_iterator end()   const { return list.end(); }

  reverse_iterator rbegin() { return list.rbegin(); }
  reverse_iterator rend()   { return list.rend(); }
  const_reverse_iterator rbegin() const { return list.rbegin(); }
  const_reverse_iterator rend()   const { return list.rend(); }

  size_t size() const    { return list.size(); }
  void swap(symtab_t &r) { map.swap(r.map); list.swap(r.list); }
  void clear()           { map.clear(); list.clear(); }

  void make_asm_names();
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
