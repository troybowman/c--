#include <stdarg.h>

#include <symbol.h>
#include <messages.h>

//-----------------------------------------------------------------------------
symbol_t::symbol_t(uint32_t flags, const char *name, int line, symbol_type_t type, ...)
  : _type(type), _flags(flags), _name(name), _line(line)
{
  va_list va;
  va_start(va, type);
  switch ( type )
  {
    case ST_ARRAY:
      _size = va_arg(va, offsize_t);
    case ST_PRIMITIVE:
      _base = PRIM_UNKNOWN;
      break;
    case ST_FUNCTION:
      _rt      = RT_UNKNOWN;
      _symbols = new symtab_t();
      _params  = va_arg(va, symlist_t *);
      ASSERT(1088, _params != NULL);
      break;
    default:
      INTERR(1065);
  }
  va_end(va);
}

//-----------------------------------------------------------------------------
symbol_t::symbol_t(symbol_type_t type, ...) : _type(type)
{
  va_list va;
  va_start(va, type);
  switch ( type )
  {
    case ST_INTCON:
    case ST_TEMPORARY:
    case ST_SAVED_TEMPORARY:
    case ST_STACK_TEMPORARY:
    case ST_REG_ARGUMENT:
    case ST_STACK_ARGUMENT:
      _val = va_arg(va, int);
      break;
    case ST_STRCON:
    case ST_CHARCON:
      _str = va_arg(va, const char *);
      break;
    default:
      break;
  }
  va_end(va);
}


//-----------------------------------------------------------------------------
symbol_t::~symbol_t()
{
  if ( is_func() )
  {
    for ( symlist_t::iterator i = _params->begin(); i != _params->end(); i++ )
      delete *i;
    delete _params;

    for ( symtab_t::iterator i = _symbols->begin(); i != _symbols->end(); i++ )
      delete *i;
    delete _symbols;
  }
}
