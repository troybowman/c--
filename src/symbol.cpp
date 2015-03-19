#include <symbol.h>
#include <messages.h>
#include <stdarg.h>

//-----------------------------------------------------------------------------
symbol_t::symbol_t(uint32_t flags, const char *name, int line, symvec_t *params)
  : _type(ST_FUNCTION), _flags(flags), _name(name), _line(line)
{
  _base    = PRIM_UNKNOWN;
  _params  = params;
  _symbols = new symtab_t;
}

//-----------------------------------------------------------------------------
symbol_t::symbol_t(uint32_t flags, const char *name, int line)
  : _type(ST_PRIMITIVE), _flags(flags), _name(name), _line(line)
{
  _base = PRIM_UNKNOWN;
}

//-----------------------------------------------------------------------------
symbol_t::symbol_t(uint32_t flags, const char *name, int line, offsize_t size)
  : _type(ST_ARRAY), _flags(flags), _name(name), _line(line)
{
  _base = PRIM_UNKNOWN;
  _size = size;
}

//-----------------------------------------------------------------------------
symbol_t::symbol_t(symbol_type_t type, int val)
  : _type(type), _flags(0), _val(val) {}

//-----------------------------------------------------------------------------
symbol_t::symbol_t(symbol_type_t type, char *str)
  : _type(type), _flags(0), _str(str) {}

//-----------------------------------------------------------------------------
symbol_t::symbol_t(symbol_type_t type)
  : _type(type), _flags(0) {}

//-----------------------------------------------------------------------------
symbol_t::~symbol_t()
{
  switch ( _type )
  {
    case ST_FUNCTION:
      delete _params;
      delete _symbols;
      break;
    case ST_STRCON:
    case ST_CHARCON:
      free(_str);
      break;
    default:
      break;
  }
}
