#include <tinfo.h>
#include <symbol.h>

//-----------------------------------------------------------------------------
tinfo_t::tinfo_t()
  _id(TID_ERROR),
  _size(BADOFFSET)
{
  emplace(_subtype, NULLTYPE);
}

//-----------------------------------------------------------------------------
tinfo_t::tinfo_t(primitive_t prim) :
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
tinfo_t::tinfo_t(offset_t length, typeref_t eltype) :
  _id(TID_ARRAY),
  _size(BADOFFSET),
  _length(length)
{
  emplace(_subtype, eltype);
}

//-----------------------------------------------------------------------------
tinfo_t::tinfo_t(const char *name, int line) :
  _id(TID_UDT),
  _size(0),
  _name(new std::string(name)),
  _line(line) {}

//-----------------------------------------------------------------------------
void tinfo_t::set_base(typeref_t base)
{
  if ( tinfo() == NULL )
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
    case TID_UDT:
      ASSERT(0, _size != BADOFFSET);
      return _size;
      break;
    case TID_ARRAY:
      _size = _length * subtype()->complete();
      return _size;
    default:
      return BADOFFSET;
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
    case TID_UDT:
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
  return is_prim()  ? (t.is_prim()  &&    prim() == t.prim())
       : is_ptr()   ? (t.is_ptr()   && subtype() == t.subtype())
       : is_array() ? (t.is_array() && subtype() == t.subtype())
       : is_udt()   ? (t.is_udt()   &&    name() == t.name())
       : true; // silently ignore erroneous types
}

//-----------------------------------------------------------------------------
bool tinfo_t::operator!=(const tinfo_t &t) const
{
  return !(*this == t);
}
