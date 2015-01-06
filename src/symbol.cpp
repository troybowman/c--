#include <stdarg.h>
#include <symbol.h>

//-----------------------------------------------------------------------------
symbol_t::symbol_t(const char *name, int line, uint32_t flags, ...)
  : _name(name), _line(line), _flags(flags)
{
  va_list va;
  va_start(va, flags);
  switch ( flags & ST_TYPEMASK )
  {
    case ST_ARRAY:
      _size = va_arg(va, asize_t);
    case ST_PRIMITIVE:
      _base = PRIM_UNKNOWN;
      break;
    case ST_FUNCTION:
      _rt      = RT_UNKNOWN;
      _symbols = new symtab_t();
      _params  = va_arg(va, symlist_t *);
      ASSERT(0, _params != NULL);
      break;
    default:
      INTERR(1065);
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

//-----------------------------------------------------------------------------
void symtab_t::make_asm_names(const char *pfx)
{
  symtab_t temp;
  for ( iterator i = begin(); i != end(); i++ )
  {
    symbol_t *sym = *i;
    sym->make_asm_name(pfx);
    temp.insert(sym);
  }
  swap(temp);
}
