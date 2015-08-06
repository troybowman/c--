#include <symbol.h>

//-----------------------------------------------------------------------------
symbol_t::symbol_t(uint32_t flags, const char *name, int line) :
  _st(ST_VARIABLE),
  _flags(flags),
  _name(name),
  _line(line)
{
  emplace(_tinfo, NULLTYPE);
}

//-----------------------------------------------------------------------------
symbol_t::symbol_t(uint32_t f, const char *n, int l, typeref_t rt, symvec_t *p) :
  _st(ST_FUNCTION),
  _flags(f),
  _name(n),
  _line(l),
  _params(p)
{
  emplace(_tinfo, rt);
}

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
void symbol_t::set_base(typeref_t base)
{
  if ( tinfo() == NULL )
    emplace(_tinfo, base);
  else
    tinfo()->set_base(base);
}

//-----------------------------------------------------------------------------
offset_t symbol_t::size()
{
  switch ( _st )
  {
    case ST_VARIABLE:
      return tinfo()->size();
    case ST_TEMP:
    case ST_SVTEMP:
    case ST_STKTEMP:
    case ST_INTCON:
    case ST_RETVAL:
    case ST_RETADDR:
    case ST_REGARG:
    case ST_STKARG:
    case ST_ZERO
      return WORDSIZE;
    case ST_CHARCON:
      return 1;
    case ST_FUNCTION:
    case ST_STRCON:
    case ST_LABEL:
    case ST_ELLIPSIS:
      return BADOFFSET;
    default:
      INTERR(0);
  }
}

//-----------------------------------------------------------------------------
symbol_t::~symbol_t()
{
  switch ( _type )
  {
    case ST_FUNCTION:
      delete _params;
      delete _lvars;
      // no break
    case ST_VARIABLE:
      type().~typeref();
      break;
    case ST_STRCON:
    case ST_CHARCON:
      free(_str);
      break;
    default:
      break;
  }
}

