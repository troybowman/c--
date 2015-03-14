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
  : _type(type), _val(val) {}

//-----------------------------------------------------------------------------
symbol_t::symbol_t(symbol_type_t type, const char *str)
  : _type(type), _str(str) {}

//-----------------------------------------------------------------------------
symbol_t::symbol_t(symbol_type_t type)
  : _type(type) {}

//-----------------------------------------------------------------------------
symbol_t::~symbol_t()
{
  if ( is_func() )
  {
    delete _params;
    delete _symbols;
  }
}
