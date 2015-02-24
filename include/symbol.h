#ifndef SYMBOL_H
#define SYMBOL_H

#include <vector>
#include <string>
#include <map>

#include <offset.h>

class symtab_t;
class symvec_t;
class symbol_t;

//-----------------------------------------------------------------------------
enum symloc_type_t
{
  SLT_UNKNOWN,
  SLT_GLOBAL,
  SLT_REG,
  SLT_STKOFF
};

//-----------------------------------------------------------------------------
class symloc_t
{
  symloc_type_t _type;
  union
  {
    const char *_reg;
    struct
    {
      offset_t _off;
      uint8_t  _flags;
#define SLF_FP  0x1
#define SLF_SP  0x2
#define SLF_SUB 0x4
    };
  };

public:
  symloc_t() : _type(SLT_UNKNOWN) {}

  bool is_global() const { return _type == SLT_GLOBAL; }
  bool is_reg()    const { return _type == SLT_REG;    }
  bool is_stkoff() const { return _type == SLT_STKOFF; }

  void set_global()
    { _type = SLT_GLOBAL; }
  void set_reg(const char *reg)
    { _type = SLT_REG; _reg = reg; }
  void set_stkoff(uint32_t off, uint8_t flags = SLF_SP)
    { _type = SLT_STKOFF; _flags = flags; _off = off; }

  symloc_type_t type() const { return _type;  }
  const char *reg()    const { return _reg;   }
  offset_t stkoff()    const { return _off;   }
  uint8_t flags()      const { return _flags; }
};

//-----------------------------------------------------------------------------
enum primitive_t
{
  PRIM_UNKNOWN,
  PRIM_INT,
  PRIM_CHAR
};

//-----------------------------------------------------------------------------
enum return_type_t
{
  RT_UNKNOWN = PRIM_UNKNOWN,
  RT_INT     = PRIM_INT,
  RT_CHAR    = PRIM_CHAR,
  RT_VOID
};

//-----------------------------------------------------------------------------
enum symbol_type_t
{
  ST_PRIMITIVE,       // source level primitive (int/char)
  ST_ARRAY,           // source level array. base type is a primitive
  ST_FUNCTION,        // source level function
  ST_ELLIPSIS,        // identifies "..." parameter declaration
  ST_TEMPORARY,       // asm temporary value
  ST_SAVED_TEMPORARY, // temporary that must persist across a function call
  ST_STACK_TEMPORARY, // temporary that must be stored on the stack
  ST_INTCON,          // integer constant
  ST_CHARCON,         // character constant
  ST_STRCON,          // string constant
  ST_LABEL,           // asm label
  ST_RETVAL,          // asm return value location
  ST_RETADDR,         // asm return address location
  ST_REG_ARGUMENT,    // asm function register argument
  ST_STACK_ARGUMENT,  // asm function stack argument
  ST_ZERO             // asm $zero register
};

//-----------------------------------------------------------------------------
class symbol_t
{
  symbol_type_t _type;

  uint32_t _flags;
#define SF_PARAMETER       0x01 // is a function parameter?
#define SF_EXTERN          0x02 // is extern?
#define SF_DEFINED         0x04 // has been defined?
#define SF_RET_RESOLVED    0x08 // have we seen a 'return expr' statement yet? (for non-void funcs)
#define SF_BUILTIN_PRINTF  0x10 // denotes the builtin printf function

  std::string _name;

  union
  {
    struct // source level symbols
    {
      int _line; // source line
      union      // type
      {
        primitive_t _base;    // ST_PRIMITIVE/ST_ARRAY
        struct                // ST_ARRAY
        {
          primitive_t _eltyp;
          offsize_t   _size;
        };
        struct                // ST_FUNCTION
        {
          return_type_t _rt;
          symvec_t *_params;
          symtab_t *_symbols;
        };
      };
    };
    // ST_INTCON, ST_TEMPORARY, ST_SAVED_TEMPORARY, ST_LABEL
    // ST_STACK_TEMPORARY, ST_STACK_ARGUMENT, ST_REG_ARGUMENT
    int _val;
    const char *_str; // ST_STRCON, ST_CHARCON
  };

public:
  symloc_t loc;

  symbol_t(uint32_t flags, const char *name, int line, symbol_type_t type, ...);

  symbol_t(symbol_type_t type, ...);

  ~symbol_t();

  bool is_prim()           const { return _type  == ST_PRIMITIVE; }
  bool is_array()          const { return _type  == ST_ARRAY; }
  bool is_func()           const { return _type  == ST_FUNCTION; }
  bool is_param()          const { return (_flags & SF_PARAMETER) != 0; }

  symbol_type_t type()     const { return _type; }
  uint32_t flags()         const { return _flags; }
  std::string name()       const { return _name; }
  const char *c_str()      const { return _name.c_str(); }
  int line()               const { return _line; }
  const char *str()        const { return _str; }
  int val()                const { return _val; }

  primitive_t base()       const { return _base; }
  offsize_t size()         const { return _size; }

  return_type_t rt()       const { return _rt; }
  symvec_t *params()       const { return _params; }
  symtab_t *symbols()      const { return _symbols; }
  bool is_extern()         const { return (_flags & SF_EXTERN) != 0; }
  bool is_defined()        const { return (_flags & SF_DEFINED) != 0; }
  bool is_ret_resolved()   const { return (_flags & SF_RET_RESOLVED) != 0; }
  bool is_builtin_printf() const { return (_flags & SF_BUILTIN_PRINTF) != 0; }

  void set_name(const char *name)  { _name.assign(name); }
  void set_line(int line)          { _line = line; }

  void set_base(primitive_t base)  { _base = base; }
  void set_size(offsize_t size)    { _size = size; }

  void set_rt(return_type_t rt)    { _rt = rt; if ( _rt == RT_VOID ) set_ret_resolved(); }
  void set_extern()                { _flags |= SF_EXTERN; }
  void set_defined()               { _flags |= SF_DEFINED; }
  void set_ret_resolved()          { _flags |= SF_RET_RESOLVED; }
  void set_builtin_printf()        { _flags |= SF_BUILTIN_PRINTF; }

  void set_val(int val)            { _val = val; }
};

//-----------------------------------------------------------------------------
class symvec_t : public std::vector<symbol_t *>
{
  typedef std::vector<symbol_t *> inherited;

public:
  iterator find(const symbol_t *sym)
  {
    iterator p;
    const_iterator e;
    for ( p = begin(), e = end(); p != e; ++p )
      if ( sym == *p )
        break;
    return p;
  }
  const_iterator find(const symbol_t *sym) const
  {
    const_iterator p, e;
    for ( p = begin(), e = end(); p != e; ++p )
      if ( sym == *p )
        break;
    return p;
  }
  bool has(const symbol_t *sym) const { return find(sym) != end(); }
  iterator erase(const symbol_t *sym) { return inherited::erase(find(sym)); }
  void assign(const symvec_t &vec)    { inherited::assign(vec.begin(), vec.end()); }
};

//-----------------------------------------------------------------------------
// symbol table
class symtab_t
{
  typedef std::map<std::string, symbol_t*> symmap_t;

  symmap_t map;   // fast lookups...
  symvec_t vec;   // ...while maintaining insertion order

public:
  symbol_t *get(const std::string &key) const
  {
    symmap_t::const_iterator i = map.find(key);
    return i != map.end() ? i->second : NULL;
  }
  void insert(const std::string &key, symbol_t *value)
  {
    map[key] = value;
    vec.push_back(value);
  }
  bool insert(symbol_t *value)
  {
    if ( value == NULL )
      return false;
    insert(value->name(), value);
    return true;
  }
  void erase(const symbol_t &sym)
  {
    map.erase(sym.name());
    vec.erase(&sym);
  }
  symvec_t *as_vector() const
  {
    symvec_t *ret = new symvec_t;
    ret->assign(vec);
    return ret;
  }

#define DEFINE_TABLE_ITERATOR(iterator, begin, end)      \
  typedef symvec_t::iterator iterator;                   \
  typedef symvec_t::const_##iterator const_##iterator;   \
  iterator begin() { return vec.begin(); }               \
  iterator end()   { return vec.end(); }                 \
  const_##iterator begin() const { return vec.begin(); } \
  const_##iterator end()   const { return vec.end(); }

  DEFINE_TABLE_ITERATOR(iterator, begin, end)
  DEFINE_TABLE_ITERATOR(reverse_iterator, rbegin, rend)

#undef DEFINE_TABLE_ITERATOR

  size_t size() const    { return vec.size(); }
  void swap(symtab_t &r) { map.swap(r.map); vec.swap(r.vec); }
  void clear()           { map.clear(); vec.clear(); }
};

#endif // SYMBOL_H
