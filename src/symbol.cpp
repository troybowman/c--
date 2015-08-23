#include <symbol.h>

//-----------------------------------------------------------------------------
symbol_t::symbol_t(uint32_t flags, const char *name, int line) :
  _st(ST_VARIABLE),
  _flags(flags),
  _name(name),
  _val(line) {}

//-----------------------------------------------------------------------------
symbol_t::symbol_t(uint32_t f, const char *n, int l, typeref_t rt, symvec_t *p) :
  _st(ST_FUNCTION),
  _flags(f),
  _name(n),
  _line(l),
  _params(p),
  tinfo(rt) {}

//-----------------------------------------------------------------------------
symbol_t::symbol_t(symbol_type_t st, int val) :
  _st(st),
  _flags(0),
  _val(val) {}

//-----------------------------------------------------------------------------
symbol_t::symbol_t(symbol_type_t st, char *str) :
  _st(st),
  _flags(0)
{
  ASSERT(0, str != NULL);
  _str = strdup(str);
}

//-----------------------------------------------------------------------------
symbol_t::symbol_t(symbol_type_t st) :
  _st(st),
  _flags(0) {}

//-----------------------------------------------------------------------------
symbol_t::symbol_t(offset_t off) :
  _st(ST_PADDING)
{
  loc.set_stkoff(off);
}

//-----------------------------------------------------------------------------
void symbol_t::set_base(typeref_t base)
{
  if ( tinfo == NULL )
    tinfo = base;
  else
    tinfo->set_base(base);
}

//-----------------------------------------------------------------------------
symbol_t::~symbol_t()
{
  switch ( _type )
  {
    case ST_FUNCTION:
      delete _params;
      delete _lvars;
      break;
    case ST_STRCON:
    case ST_CHARCON:
      free(_str);
      break;
    default:
      break;
  }
}
