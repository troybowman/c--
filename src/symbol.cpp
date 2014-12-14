#include <stdarg.h>

#include <symbol.h>
#include <treenode.h>

//-----------------------------------------------------------------------------
symbol_t::symbol_t(const char *name, int line, symbol_type_t type, ...)
  : _name(name), _line(line), _type(type)
{
  va_list va;
  va_start(va, _type);
  switch ( _type )
  {
    case ST_PRIMITIVE:
      _prim = PRIM_UNKNOWN;
      break;
    case ST_ARRAY:
      _array.type = PRIM_UNKNOWN;
      _array.size = va_arg(va, asize_t);
      break;
    case ST_FUNCTION:
      _func.rt_type     = RT_UNKNOWN;
      _func.symbols     = NULL;
      _func.syntax_tree = NULL;
      _func.code        = NULL;
      _func.max_temps   = 0;
      _func.is_extern   = false;
      _func.defined     = false;
      _func.params      = va_arg(va, symlist_t *);
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
  }
}
