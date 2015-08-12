#ifndef TINFO_H
#define TINFO_H

#include <common.h>

class tinfo_t;
class symtab_t;
class memtab_t;

//-----------------------------------------------------------------------------
typedef refcnt_t<tinfo_t> typeref_t;
typedef uint8_t tplace_t[sizeof(typeref_t)];
#define NULLTYPE typeref_t()
#define BADTYPE typeref(new tinfo_t(TID_ERROR))

//-----------------------------------------------------------------------------
inline void emplace(tplace_t &_tinfo, typeref_t tinfo)
{
  emplace<typeref_t>(_tinfo, tinfo);
}

//-----------------------------------------------------------------------------
inline typeref_t &deplace(const tplace_t &_tinfo)
{
  return deplace<typeref_t>(_tinfo);
}

//-----------------------------------------------------------------------------
enum prim_t // primitives
{
  PRIM_INT,
  PRIM_CHAR,
  PRIM_VOID
};

//-----------------------------------------------------------------------------
enum type_id_t
{
  TID_ERROR,   // bad type  - erroneously used/declared
  TID_PRIM,    // primitive - int/char/void
  TID_PTR,     // pointer   - points to another tinfo_t
  TID_ARRAY,   // array     - element type + length
  TID_UDT,     // struct    - name + member table
  TID_BOOL,    // boolean   - only used with boolean expressions
};

//-----------------------------------------------------------------------------
class tinfo_t : public refcnt_obj_t
{
  type_id_t _id;
  offset_t _size;

  union
  {
    prim_t _prim; // TID_PRIM
    tplace_t _subtype; // TID_PTR
    struct // TID_ARRAY
    {
      tplace_t _eltype;
      offset_t _length;
    };
    struct // TID_UDT
    {
      std::string *_name;
      symtab_t *_members;
      int _line;
    };
  };

public:
  tinfo_t(type_id_t id);
  tinfo_t(primitive_t prim);
  tinfo_t(typeref_t pointed);
  tinfo_t(offset_t length, typeref_t eltype);
  tinfo_t(const char *name, int line);

  virtual ~tinfo_t();

  type_id_t id()            const { return _id; }

  offset_t size()           const { return _size; }
  bool is_complete()        const { return _size != BADOFFSET; }

  bool is_error()           const { return _id == TID_ERROR  }
  bool is_prim()            const { return _id == TID_PRIM;  }
  bool is_ptr()             const { return _id == TID_PTR;   }
  bool is_array()           const { return _id == TID_ARRAY; }
  bool is_udt()             const { return _id == TID_UDT;   }
  bool is_bool()            const { return _id == TID_BOOL;  }

  prim_t prim()             const { return _prim; }
  offset_t length()         const { return _length; }
  const std::string &name() const { return *_name; }
  symtab_t *members()       const { return _members; }
  typeref_t &subtype()      const { return deplace(_subtype); }

  bool is_prim(prim_t p)    const { return is_prim() && _prim == p; }
  bool is_array(prim_t p)   const { return is_array() && subtype()->is_prim(p); }
  bool is_ptr(prim_t p)     const { return is_ptr() && subtype()->is_prim(p); }

  bool has_ptr()            const { return is_ptr() || is_array() && subtype()->has_ptr(); }

  bool is_integer()         const { return is_prim(PRIM_CHAR) || is_prim(PRIM_INT); }
  bool is_arithmetic()      const { return is_integer() || is_ptr(); }

  bool operator==(const tinfo_t &t) const;
  bool operator!=(const tinfo_t &t) const;
  bool is_compatible(const tinfo_t &t) const;

  offset_t complete();
  void set_base(typeref_t base);
  void set_members(memtab_t *members);

  virtual void release() { delete this; }
};

//-----------------------------------------------------------------------------
class udttab_t : public reftab_t<typeref_t>
{
public:
  virtual bool insert(typref_t tinfo)
  {
    ASSERT(0, tinfo != NULL && tinfo->is_udt())
    return insert(tinfo->name(), tinfo);
  }
};

#endif // !TINFO_H
