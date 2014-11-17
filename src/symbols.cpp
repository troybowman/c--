#include <stdlib.h>
#include <symbols.h>

//-----------------------------------------------------------------------------
symbol_t::symbol_t(const char *_name, int _line, symbol_type_t _type, ...)
  : off(0), line(_line), type(_type)
{
  name.assign(_name);

  va_list va;
  va_start(va, _type);
  switch ( _type )
  {
    case ST_PRIMITIVE:
      prim = va_arg(va, primitive_t);
      break;
    case ST_ARRAY:
      array.type = va_arg(va, primitive_t);
      array.size = va_arg(va, asize_t);
      break;
    case ST_FUNCTION:
      func.rt_type     = va_arg(va, return_type_t);
      func.params      = va_arg(va, paramvec_t *);
      func.symbols     = va_arg(va, symtab_t *);
      func.syntax_tree = va_arg(va, treenode_t *);
      func.is_extern   = va_arg(va, bool);
      break;
    default:
      type = ST_UNKNOWN;
      break;
  }
  va_end(va);
}

//-----------------------------------------------------------------------------
symbol_t::~symbol_t()
{
  if ( type == ST_FUNCTION )
  {
    if ( func.params != NULL )
      delete func.params;
    if ( func.symbols != NULL )
      delete func.symbols;
    if ( func.syntax_tree != NULL )
      delete func.syntax_tree;
  }
}

//-----------------------------------------------------------------------------
symtab_t::~symtab_t()
{
  symtab_t::iterator i;
  for ( i = begin(); i != end(); i++ )
    delete i->second;
}
