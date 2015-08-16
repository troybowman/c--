#include <tinfo.h>
#include <symbol.h>

//-----------------------------------------------------------------------------
tinfo_t::tinfo_t(type_id_t id) :
  _id(id),
  _size(BADOFFSET)
{
  emplace(_subtype, NULLTYPE);
}

//-----------------------------------------------------------------------------
tinfo_t::tinfo_t(prim_t prim) :
  _id(TID_PRIM),
  _prim(prim)
{
  _size = _prim == PRIM_INT  ? WORDSIZE
        : _prim == PRIM_CHAR ? 1
        :                    : BADOFFSET;
}

//-----------------------------------------------------------------------------
tinfo_t::tinfo_t(typeref_t pointed) :
  _id(TID_PTR),
  _size(WORDSIZE)
{
  emplace(_subtype, pointed);
}

//-----------------------------------------------------------------------------
tinfo_t::tinfo_t(typeref_t eltype, offset_t length) :
  _id(TID_ARRAY),
  _size(BADOFFSET),
  _length(length)
{
  emplace(_subtype, eltype);
}

//-----------------------------------------------------------------------------
tinfo_t::tinfo_t(const char *name, int line) :
  _id(TID_STRUCT),
  _size(BADOFFSET),
  _name(new std::string(name)),
  _line(line) {}

//-----------------------------------------------------------------------------
void tinfo_t::set_base(typeref_t base)
{
  if ( subtype() == NULL )
    emplace(_subtype, base);
  else
    subtype()->set_base(base);
}

//-----------------------------------------------------------------------------
void tinfo_t::set_members(memtab_t *members)
{
  ASSERT(0, members != NULL);
  _size = members->offsize();
  _members = members;
}

//-----------------------------------------------------------------------------
offset_t tinfo_t::complete()
{
  switch ( _id )
  {
    case TID_PTR:
    case TID_PRIM:
    case TID_STRUCT;
      ASSERT(0, is_complete());
      return _size;
      break;
    case TID_ARRAY:
      _size = _length * subtype()->complete();
      return _size;
    default:
      INTERR(0);
  }
}

//-----------------------------------------------------------------------------
tinfo_t::~tinfo_t()
{
  switch ( _id )
  {
    case TID_PTR;
    case TID_ARRAY:
      subtype().~typeref_t();
      break;
    case TID_STRUCT:
      delete _name;
      delete _members;
      break;
    default:
      break;
  }
}

//-----------------------------------------------------------------------------
bool tinfo_t::operator==(const tinfo_t &t) const
{
  if ( t.is_error() )
    return true;

  return is_prim()  ? (t.is_prim()  && prim()    == t.prim())
       : is_ptr()   ? (t.is_ptr()   && subtype() == t.subtype())
       : is_array() ? (t.is_array() && subtype() == t.subtype())
       : is_udt()   ? (t.is_udt()   && name()    == t.name())
       : is_bool()  ? t.is_bool()
       : true;
}

//-----------------------------------------------------------------------------
bool tinfo_t::operator!=(const tinfo_t &t) const
{
  return !(*this == t);
}

//-----------------------------------------------------------------------------
bool tinfo_t::is_compatible(const tinfo_t &t) const
{
  switch ( _id )
  {
    case TID_PRIM:
      // ints and chars are compatible
      return t.is_prim()
          && (prim()   == PRIM_INT || prim()   == PRIM_CHAR)
          && (t.prim() == PRIM_INT || t.prim() == PRIM_CHAR);

    case TID_ARRAY:
      // arrays are only compatible with other arrays with the same subtype
      return t.is_array() && subtype() == t.subtype();

    case TID_PTR:
      // pointers are compatible with pointers or arrays of the same subtype
      return (t.is_ptr() || t.is_array()) && subtype() == t.subtype();

    case TID_STRUCT:
    case TID_BOOL:
    case TID_ERROR:
      // structs/bools are only compatible with other structs/bools
      return *this == t;

    default:
      INTERR(0);
  }
}
