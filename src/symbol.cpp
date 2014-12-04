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
      _prim = va_arg(va, primitive_t);
      break;
    case ST_ARRAY:
      _array.type = va_arg(va, primitive_t);
      _array.size = va_arg(va, asize_t);
      break;
    case ST_FUNCTION:
      _func.rt_type     = va_arg(va, return_type_t);
      _func.params      = va_arg(va, paramvec_t *);
      _func.symbols     = va_arg(va, symtab_t *);
      _func.syntax_tree = va_arg(va, treenode_t *);
      _func.is_extern   = va_arg(va, bool);
      _func.defined     = va_arg(va, bool);
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
