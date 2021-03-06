#ifndef SYMBOL_H
#define SYMBOL_H

#include "common.h"

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
    offset_t _stkoff;
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
  void set_stkoff(offset_t stkoff)
    { _type = SLT_STKOFF; _stkoff = stkoff; }

  symloc_type_t type() const { return _type; }
  const char *reg()    const { return _reg;  }
  offset_t stkoff()    const { return _stkoff; }
};

//-----------------------------------------------------------------------------
enum symbol_type_t
{
  ST_PRIMITIVE, // primitive (int/char/void)
  ST_ARRAY,     // array (base type is a primitive)
  ST_FUNCTION,  // function (return type + local vars)
  ST_TEMP,      // temporary value
  ST_SVTEMP,    // saved temporary value
  ST_STKTEMP,   // temporary that must be stored on the stack
  ST_INTCON,    // integer constant
  ST_CHARCON,   // character constant
  ST_STRCON,    // string constant
  ST_LABEL,     // asm label
  ST_RETVAL,    // return value location
  ST_RETADDR,   // return address location
  ST_REGARG,    // function register argument
  ST_STKARG,    // function stack argument
  ST_ELLIPSIS,  // identifies "..." parameter declaration
  ST_ZERO       // zero register
};

//-----------------------------------------------------------------------------
enum primitive_t
{
  PRIM_UNKNOWN,
  PRIM_INT,
  PRIM_CHAR,
  PRIM_VOID
};

//-----------------------------------------------------------------------------
// symbolic address in a three-address code node
class symbol_t : public refcnt_obj_t
{
  symbol_type_t _type;

  uint32_t _flags;
#define SF_PARAMETER    0x01 // is a function parameter?
#define SF_EXTERN       0x02 // is extern?
#define SF_DEFINED      0x04 // has been defined?
#define SF_RET_RESOLVED 0x08 // have we seen a 'return expr' statement yet? (for non-void funcs)
#define SF_PRINTF       0x10 // identifies the builtin printf function
#define SF_MAIN         0x20 // identifies entry point function

  std::string _name;

  union
  {
    struct // source level symbols
    {
      int _line; // source line
      union      // type
      {
        primitive_t _base;    // ST_PRIMITIVE
        struct                // ST_ARRAY
        {
          primitive_t _eltyp;
          offsize_t   _size;
        };
        struct                // ST_FUNCTION
        {
          primitive_t _rt;
          symvec_t *_params;
          symtab_t *_symbols;
        };
      };
    };
    int _val;   // ST_INTCON, ST_TEMP, ST_SVTEMP, ST_LABEL, ST_STKTEMP, ST_STKARG, ST_REGARG
    char *_str; // ST_STRCON, ST_CHARCON
  };

public:
  symloc_t loc;

  symbol_t(uint32_t flags, const char *name, int line);
  symbol_t(uint32_t flags, const char *name, int line, offsize_t size);
  symbol_t(uint32_t flags, const char *name, int line, symvec_t *params);
  symbol_t(symbol_type_t type, int val);
  symbol_t(symbol_type_t type, char *str);
  symbol_t(symbol_type_t type);

  virtual ~symbol_t();

  bool is_prim()            const { return _type  == ST_PRIMITIVE; }
  bool is_array()           const { return _type  == ST_ARRAY; }
  bool is_func()            const { return _type  == ST_FUNCTION; }
  bool is_param()           const { return (_flags & SF_PARAMETER) != 0; }

  symbol_type_t type()      const { return _type; }
  uint32_t flags()          const { return _flags; }
  std::string name()        const { return _name; }
  const char *c_str()       const { return _name.c_str(); }
  int line()                const { return _line; }
  const char *str()         const { return _str; }
  int val()                 const { return _val; }

  primitive_t base()        const { return _base; }

  offsize_t size()          const { return _size; }

  symvec_t *params()        const { return _params; }
  symtab_t *symbols()       const { return _symbols; }
  bool is_extern()          const { return (_flags & SF_EXTERN) != 0; }
  bool is_defined()         const { return (_flags & SF_DEFINED) != 0; }
  bool is_ret_resolved()    const { return (_flags & SF_RET_RESOLVED) != 0; }
  bool is_printf()          const { return (_flags & SF_PRINTF) != 0; }
  bool is_main()            const { return (_flags & SF_MAIN) != 0; }

  void set_name(const char *name) { _name.assign(name); }
  void set_line(int line)         { _line = line; }
  void set_base(primitive_t base) { _base = base; }

  void set_size(offsize_t size)   { _size = size; }

  void set_extern()               { _flags |= SF_EXTERN; }
  void set_defined()              { _flags |= SF_DEFINED; }
  void set_ret_resolved()         { _flags |= SF_RET_RESOLVED; }
  void set_printf()               { _flags |= SF_PRINTF; }

  void set_val(int val)           { _val = val; }

  virtual void release()          { delete this; }
};

//-----------------------------------------------------------------------------
typedef refcnt_t<symbol_t> symref_t;
typedef uint8_t symplace_t[sizeof(symref_t)];
#define NULLREF symref_t(NULL)

//-----------------------------------------------------------------------------
inline void emplace(symplace_t p, symref_t ref)
{
  emplace<symref_t>(p, ref);
}

//-----------------------------------------------------------------------------
inline symref_t &deplace(const symplace_t &p)
{
  return deplace<symref_t>(p);
}

//-----------------------------------------------------------------------------
class symvec_t : public std::vector<symref_t>
{
  typedef std::vector<symref_t> inherited;

public:
  void assign(const symvec_t &vec)
  {
    inherited::assign(vec.begin(), vec.end());
  }
};

//-----------------------------------------------------------------------------
class symtab_t // symbol table
{
  typedef std::map<std::string, symref_t> symmap_t;

  symmap_t map; // fast lookups
  symvec_t vec; // maintain insertion order

public:
  symref_t get(const std::string &key) const
  {
    symmap_t::const_iterator i = map.find(key);
    return i != map.end() ? i->second : NULLREF;
  }
  bool insert(const std::string &key, symref_t value)
  {
    if ( value == NULL || get(key) != NULL )
      return false;
    map[key] = value;
    vec.push_back(value);
    return true;
  }
  bool insert(symref_t sym)
  {
    if ( sym == NULL )
      return false;
    return insert(sym->name(), sym);
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

  void assign_to(symvec_t &out) const { out.assign(vec); }
};

#endif // SYMBOL_H
