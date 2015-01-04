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
symbol_t::symbol_t(const symbol_t &sym)
  : _name(sym._name), _line(sym._line), _flags(sym._flags)
{
  switch ( _flags & ST_TYPEMASK )
  {
    case ST_LABEL:
#ifdef NDEBUG
      break;
#endif
    case ST_TEMPORARY:
    case ST_SAVED_TEMPORARY:
    case ST_ARGUMENT:
    case ST_INTCON:
      _val = sym._val;
      break;
    case ST_STRCON:
    case ST_CHARCON:
      _str = sym._str;
      break;
    case ST_ARRAY:
      _size = sym._size;
    case ST_PRIMITIVE:
      _base = sym._base;
      break;
    case ST_FUNCTION:
      _rt        = sym._rt;
      _params    = sym._params;
      _symbols   = sym._symbols;
      _tree      = sym._tree;
      _is_extern = sym._is_extern;
      _defined   = sym._defined;
      break;
    case ST_RETLOC:
      break;
    default:
      INTERR(0);
  }
  loc.assign(sym.loc);
}

//-----------------------------------------------------------------------------
void symloc_t::assign(const symloc_t &loc)
{
  _type = loc._type;
  switch ( _type )
  {
    case SLT_UNKNOWN:
    case SLT_GLOBAL:
      break;
    case SLT_REG:
      _reg = loc._reg;
      break;
    case SLT_STACK:
      _off = loc._off;
      break;
    default:
      INTERR(0);
  }
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
    ASSERT(0, _tree == NULL);
    ASSERT(0, _symbols == NULL);
  }
}

//-----------------------------------------------------------------------------
void symtab_t::make_asm_names()
{
  symtab_t temp;
  for ( iterator i = begin(); i != end(); i++ )
  {
    symbol_t *cpy = new symbol_t(**i);
    cpy->make_asm_name();
    temp.insert(cpy);
  }
  swap(temp);
}
