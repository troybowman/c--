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
      _rt          = RT_UNKNOWN;
      _symbols     = NULL;
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
  // TODO switch and take appropriate action
  if ( is_func() )
  {
    symlist_t::iterator i = params()->begin();
    for ( ; i != params()->end(); i++ )
      delete *i;
    delete params();
    ASSERT(0, _symbols == NULL);
  }
}

//-----------------------------------------------------------------------------
void symtab_t::make_asm_names()
{
  symtab_t temp;
  for ( iterator i = begin(); i != end(); i++ )
  {
    symbol_t *sym = *i;
    sym->make_asm_name();
    temp.insert(sym);
  }
  swap(temp);
}
