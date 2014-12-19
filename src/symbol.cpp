#include <stdarg.h>

#include <symbol.h>

//-----------------------------------------------------------------------------
symbol_t::symbol_t(const char *name, int line, symbol_type_t type, ...)
  : _name(name), _line(line), _type(type)
{
  va_list va;
  va_start(va, _type);
  switch ( _type )
  {
    case ST_ARRAY:
      _size = va_arg(va, asize_t);
    case ST_PRIMITIVE:
      _base = PRIM_UNKNOWN;
      break;
    case ST_FUNCTION:
      _rt          = RT_UNKNOWN;
      _symbols     = NULL;
      _tree        = NULL;
      _is_extern   = false;
      _defined     = false;
      _params      = va_arg(va, symlist_t *);
      break;
    default:
      INTERR(1065);
  }
  va_end(va);
}

//-----------------------------------------------------------------------------
symbol_t::~symbol_t()
{
  if ( _type == ST_FUNCTION )
  {
    symlist_t::iterator i = params()->begin();
    for ( ; i != params()->end(); i++ )
      delete *i;
    delete params();
    ASSERT(0, tree() == NULL);
    ASSERT(0, symbols() == NULL);
  }
}
