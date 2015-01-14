#ifndef SYMBOL_H
#define SYMBOL_H

#include <stdint.h>

#include <vector>
#include <string>
#include <list>
#include <map>

#include <messages.h>

class symtab_t;

//-----------------------------------------------------------------------------
class symloc_t
{
  uint32_t _flags;
// symloc types
#define SLT_UNKNOWN  0x00
#define SLT_GLOBAL   0x01
#define SLT_REG      0x02
#define SLT_STKOFF   0x03
#define SLT_TYPEMASK 0x0F
// additional properties:
#define SLF_FP       0x10
#define SLF_SP       0x20
#define SLF_SUB      0x40

  union
  {
    uint32_t _off;
    const char *_reg;
  };

public:
  symloc_t() : _flags(0) {}

  bool is_global() const { return (_flags & SLT_TYPEMASK) == SLT_GLOBAL; }
  bool is_reg()    const { return (_flags & SLT_TYPEMASK) == SLT_REG; }
  bool is_stkoff() const { return (_flags & SLT_TYPEMASK) == SLT_STKOFF;  }

  void set_global()
    { _flags |= SLT_GLOBAL; }
  void set_reg(const char *reg)
    { _flags |= SLT_REG; _reg = reg; }
  void set_stkoff(uint32_t flags, uint32_t off)
    { _flags |= (SLT_STKOFF | flags); _off = off; }

  uint8_t type()    const { return _flags & SLT_TYPEMASK; }
  uint32_t flags()  const { return _flags; }
  const char *reg() const { return _reg;  }
  uint32_t stkoff() const { return _off;  }
};

//-----------------------------------------------------------------------------
enum primitive_t
{
  PRIM_UNKNOWN,
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

  uint32_t _flags;
// symbol types
#define ST_PRIMITIVE       0x01 // source level primitive type (int/char)
#define ST_ARRAY           0x02 // source level array - base type is a primitive
#define ST_FUNCTION        0x03 // source level function
#define ST_TEMPORARY       0x04 // asm temporary value
#define ST_SAVED_TEMPORARY 0x05 // a temporary that must persist across a function call
#define ST_INTCON          0x06 // integer constant
#define ST_CHARCON         0x07 // character constant
#define ST_STRCON          0x08 // string constant
#define ST_LABEL           0x09 // asm label
#define ST_RETLOC          0x0A // identifies asm return value location
#define ST_ARGUMENT        0x0B // asm function argument location
#define ST_TYPEMASK        0x0F
// additional properties
#define SF_PARAMETER       0x10 // symbol is a source level function parameter
#define SF_EXTERN          0x20 // function is extern
#define SF_DEFINED         0x40 // function has been defined
#define SF_RET_RESOLVED    0x80 // have we seen a 'return expr' statement yet? (for non-void funcs)

  union
  {
    int _val;             // ST_TEMPORARY, ST_SAVED_TEMPORARY, ST_ARGUMENT, ST_INTCON
    const char *_str;     // ST_STRCON, ST_CHARCON
    primitive_t _base;    // ST_PRIMITIVE/ST_ARRAY
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
    };
  };

public:
  symloc_t loc;

  symbol_t(const char *name, int line, uint32_t flags, ...);

  symbol_t(uint32_t flags, int val) : _flags(flags), _val(val) {}

  symbol_t(uint32_t flags, const char *str) : _flags(flags), _str(str) {}

  symbol_t(uint32_t flags) : _flags(flags) {}

  ~symbol_t();

  bool is_prim()       const { return (_flags & ST_TYPEMASK) == ST_PRIMITIVE; }
  bool is_array()      const { return (_flags & ST_TYPEMASK) == ST_ARRAY; }
  bool is_func()       const { return (_flags & ST_TYPEMASK) == ST_FUNCTION; }
  bool is_param()      const { return (_flags & SF_PARAMETER) != 0; }

  std::string name()   const { return _name; }
  const char *c_str()  const { return _name.c_str(); }
  uint8_t type()       const { return _flags & ST_TYPEMASK; }
  uint32_t flags()     const { return _flags; }
  int line()           const { return _line; }
  const char *str()    const { return _str; }
  int val()            const { return _val; }

  primitive_t base()   const { return _base; }
  asize_t size()       const { return _size; }

  return_type_t rt()   const { return _rt; }
  symlist_t *params()  const { return _params; }
  symtab_t *symbols()  const { return _symbols; }
  bool is_extern()     const { return (_flags & SF_EXTERN) != 0; }
  bool defined()       const { return (_flags & SF_DEFINED) != 0; }
  bool ret_resolved()  const { return (_flags & SF_RET_RESOLVED) != 0; }

  void set_name(const char *name)  { _name.assign(name); }

  void set_base(primitive_t base)  { _base = base; }
  void set_size(asize_t size)      { _size = size; }

  void set_rt(return_type_t rt)    { _rt = rt; if ( _rt == RT_VOID ) set_ret_resolved(); }
  void set_extern()                { _flags |= SF_EXTERN; }
  void set_defined()               { _flags |= SF_DEFINED; }
  void set_ret_resolved()          { _flags |= SF_RET_RESOLVED; }

  void set_val(int val) { _val = val; }

  void make_asm_name(const char *pfx) { _name.insert(0, std::string(pfx)); }
};

//-----------------------------------------------------------------------------
class symlist_t : public std::list<symbol_t *>
{
public:
  int idx(const_iterator i)
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
    map[key] = value;
    list.push_back(value);
  }
  bool insert(symbol_t *value)
  {
    if ( value == NULL )
      return false;
    insert(value->name(), value);
    return true;
  }
  void erase(symbol_t &sym)
  {
    map.erase(sym.name());
    list.remove(&sym);
  }

#define DEFINE_TABLE_ITERATOR(iterator, begin, end)       \
  typedef symlist_t::iterator iterator;                   \
  typedef symlist_t::const_##iterator const_##iterator;   \
  iterator begin() { return list.begin(); }               \
  iterator end()   { return list.end(); }                 \
  const_##iterator begin() const { return list.begin(); } \
  const_##iterator end() const { return list.end(); }

  DEFINE_TABLE_ITERATOR(iterator, begin, end)
  DEFINE_TABLE_ITERATOR(reverse_iterator, rbegin, rend)

#undef DEFINE_TABLE_ITERATOR

  size_t size() const    { return list.size(); }
  void swap(symtab_t &r) { map.swap(r.map); list.swap(r.list); }
  void clear()           { map.clear(); list.clear(); }

  void make_asm_names(const char *pfx);
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
