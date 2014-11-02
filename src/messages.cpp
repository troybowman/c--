#ifndef NDEBUG

#include "messages.h"
#include "symbols.h"

static const char *header =
"#-----------------------------------------------------------------------------\n"
"# %s\n"
"#-----------------------------------------------------------------------------\n";

//-----------------------------------------------------------------------------
static void cmtout(const char *fmt, ...)
{
  std::string line("# ");
  line += fmt;
  va_list va;
  va_start(va, fmt);
  vfprintf(stdout, line.c_str(), va);
  va_end(va);
}

//-----------------------------------------------------------------------------
static const char *prim2str(primitive_t p)
{
  switch ( p )
  {
    case PRIM_INT:  return "PRIM_INT";
    case PRIM_CHAR: return "PRIM_CHAR";
    default:        return "PRIM_UNKOWN";
  }
}

//-----------------------------------------------------------------------------
void print_gsyms()
{
  fprintf(stdout, header, "GLOBAL SYMBOL TABLE");
  cmtout("size: %d\n", gsyms.size());

  symtab_t::const_iterator i;
  for ( i = gsyms.begin(); i != gsyms.end(); i++ )
  {
    const symbol_t *s = i->second;
    cmtout("sym: %s\n", s->name.c_str());
    cmtout("  line: %d\n", s->line);

    cmtout("  type: ");
    switch ( s->type )
    {
      case ST_PRIMITIVE:
        fprintf(stdout, "ST_PRIMITIVE\n");
        cmtout("    base: %s\n", prim2str(s->prim));
        break;
      case ST_ARRAY:
        fprintf(stdout, "ST_ARRAY\n");
        cmtout("    base: %s\n", prim2str(s->array.type));
        cmtout("    size: 0x%x\n", s->array.size);
        break;
      case ST_FUNCTION:
        fprintf(stdout, "ST_FUNCTION\n");
        cmtout("    coming soon...\n");
        break;
      default:
        fprintf(stdout, "ST_UNKNOWN\n");
        break;
    }
  }
}

//-----------------------------------------------------------------------------
void print_lsyms()
{
  fprintf(stdout, header, "LOCAL SYMBOL TABLE");
}

#endif // NDEBUG
