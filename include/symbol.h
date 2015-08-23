#ifndef SYMBOL_H
#define SYMBOL_H

#include <tinfo.h>

//-----------------------------------------------------------------------------
enum symloc_type_t
{
  SLT_UNKNOWN,
  SLT_GLOBAL,
  SLT_REG,
  SLT_OFF,
};

//-----------------------------------------------------------------------------
class symloc_t
{
  symloc_type_t _type;
  union
  {
    const char *_reg;
    offset_t _off;
  };

public:
  symloc_t() : _type(SLT_UNKNOWN) {}

  bool is_global() const { return _type == SLT_GLOBAL; }
  bool is_reg()    const { return _type == SLT_REG; }
  bool is_off()    const { return _type == SLT_OFF; }

  void set_global()
    { _type = SLT_GLOBAL; }
  void set_reg(const char *reg)
    { _type = SLT_REG; _reg = reg; }
  void set_off(offset_t off)
    { _type = SLT_OFF; _off = off; }

  symloc_type_t type() const { return _type; }
  const char *reg()    const { return _reg;  }
  offset_t off()       const { return _off;  }
};

//-----------------------------------------------------------------------------
enum symbol_type_t
{
  ST_VAR,      // variable
  ST_FUNC,     // function
  ST_TEMP,     // temporary value
  ST_SVTEMP,   // saved temporary value
  ST_STKTEMP,  // temporary that must be stored on the stack
  ST_INTCON,   // integer constant
  ST_CHARCON,  // character constant
  ST_STRCON,   // string constant
  ST_LABEL,    // asm label
  ST_RETVAL,   // return value location
  ST_RETADDR,  // return address location
  ST_REGARG,   // register argument
  ST_STKARG,   // stack argument
  ST_ELLIPSIS, // identifies "..." parameter declaration
  ST_ZERO,     // zero register
  ST_PADDING,  // stack padding
};

//-----------------------------------------------------------------------------
// symbolic address in a three-address code node
class symbol_t : public refcnt_obj_t
{
  symbol_type_t _st;

  uint32_t _flags;
#define SF_PARAMETER    0x01 // is a function parameter?
#define SF_EXTERN       0x02 // is extern?
#define SF_DEFINED      0x04 // has been defined?
#define SF_RET_RESOLVED 0x08 // have we seen a 'return expr' statement yet? (for non-void funcs)
#define SF_PRINTF       0x10 // identifies the builtin printf function
#define SF_MAIN         0x20 // identifies the entry point function

  std::string _name;

  union
  {
    int _val;   // ST_VAR, ST_INTCON, ST_TEMP, ST_SVTEMP, ST_LABEL, ST_STKTEMP, ST_STKARG, ST_REGARG
    char *_str; // ST_STRCON, ST_CHARCON
    struct      // ST_FUNCTION
    {
      int _line;
      symvec_t *_params;
      symtab_t *_lvars;
    };
  };

public:
  symloc_t loc;

  typeref_t tinfo;

  symbol_t(uint32_t flags, const char *name, int line);
  symbol_t(uint32_t flags, const char *name, int line, typeref_t rt, symvec_t *params);
  symbol_t(symbol_type_t st, int val);
  symbol_t(symbol_type_t st, char *str);
  symbol_t(symbol_type_t st);
  symbol_t(offset_t off);

  symbol_type_t st()        const { return _st; }

  bool is_var()             const { return _st == ST_VARIABLE; }
  bool is_func()            const { return _st == ST_FUNCTION; }

  bool is_prim()            const { return has_ti() && tinfo->is_prim();  }
  bool is_array()           const { return has_ti() && tinfo->is_array(); }
  bool is_ptr()             const { return has_ti() && tinfo->is_ptr();   }

  bool is_prim(prim_t p)    const { return has_ti() && tinfo->is_prim(p);  }
  bool is_array(prim_t p)   const { return has_ti() && tinfo->is_array(p); }
  bool is_ptr(prim_t p)     const { return has_ti() && tinfo->is_ptr(p);   }

  bool has_ti()             const { return tinfo != NULL; }
  bool has_ptr()            const { return has_ti() && tinfo->has_ptr(); }

  bool is_param()           const { return (_flags & SF_PARAMETER)    != 0; }
  bool is_extern()          const { return (_flags & SF_EXTERN)       != 0; }
  bool is_defined()         const { return (_flags & SF_DEFINED)      != 0; }
  bool is_ret_resolved()    const { return (_flags & SF_RET_RESOLVED) != 0; }
  bool is_printf()          const { return (_flags & SF_PRINTF)       != 0; }
  bool is_main()            const { return (_flags & SF_MAIN)         != 0; }

  uint32_t flags()          const { return _flags; }
  const std::string &name() const { return _name; }
  const char *c_str()       const { return _name.c_str(); }
  const char *str()         const { return _str; }
  int val()                 const { return _val; }
  int line()                const { return _val; }

  symvec_t *params()        const { return _params; }
  symtab_t *lvars()         const { return _lvars; }
  primitive_t prim()        const { return tinfo->prim(); }
  offset_t length()         const { return tinfo->length(); }
  offset_t size()           const { return tinfo->size(); }

  void set_name(const char *name) { _name.assign(name); }
  void set_line(int line)         { _line = line; }
  void set_lvars(symtab_t *lvars) { _lvars = lvars; }
  void set_val(int val)           { _val = val; }
  void set_base(typeref_t base);

  void set_extern()               { _flags |= SF_EXTERN; }
  void set_defined()              { _flags |= SF_DEFINED; }
  void set_ret_resolved()         { _flags |= SF_RET_RESOLVED; }
  void set_printf()               { _flags |= SF_PRINTF; }

  virtual void release()          { delete this; }

  virtual ~symbol_t();
};

//-----------------------------------------------------------------------------
typedef refcnt_t<symbol_t> symref_t;
typedef uint8_t splace_t[sizeof(symref_t)];
typedef std::vector<symref_t> symvec_t;
#define NULLREF symref_t()

//-----------------------------------------------------------------------------
inline void emplace(splace_t &sp, symref_t ref)
{
  place<symref_t>(sp, ref);
}

//-----------------------------------------------------------------------------
inline symref_t &deplace(const splace_t &sp)
{
  return deplace<symref_t>(sp);
}

//-----------------------------------------------------------------------------
class symtab_t : public reftab_t<symref_t> // symbol table
{
public:
  virtual bool insert(symref_t sym)
  {
    ASSERT(0, sym != NULL);
    return insert(sym->name(), sym);
  }
};

//-----------------------------------------------------------------------------
class memtab_t : public symtab_t // struct member table
{
  offset_t _offsize;
#define MTASSERT(s) ASSERT(0, s != NULL && s->is_var() && s->size() != BADOFFSET)

public:
  memtab_t() : _offsize(0) {}

  virtual bool insert(symref_t sym)
  {
    MTASSERT(sym);
    if ( !insert(sym->name(), sym) )
      return false;
    sym->loc.set_off(_offsize);
    _offsize += sym->size();
    return true;
  }

  offset_t offsize() const { return _offsize; }
};

#endif // SYMBOL_H
