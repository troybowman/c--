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
      _func.is_extern   = false;
      _func.defined     = false;
      _func.params      = va_arg(va, paramvec_t *);
      break;
    default:
      INTERR(0);
  }
  va_end(va);
}

//-----------------------------------------------------------------------------
symbol_t::~symbol_t()
{
  if ( _type == ST_FUNCTION )
  {
    int size = _func.params->size();
    for ( int i = 0; i < size; i++ )
      delete _func.params->at(i);
  }
}
