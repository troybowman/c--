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
static const char *rt2str(return_type_t rt_type)
{
  switch ( rt_type )
  {
    case RT_INT:  return "RT_INT";
    case RT_CHAR: return "RT_CHAR";
    case RT_VOID: return "RT_VOID";
    default:      return "RT_UNKNOWN";
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
        cmtout("    rt_type: %s\n", rt2str(s->func.rt_type));
        cmtout("    params:\n");
        if ( s->func.params == NULL )
          cmtout("      none\n");
        else
        {
          paramvec_t::iterator i;
          for ( i = s->func.params->begin(); i < s->func.params->end(); i++ )
          {
            cmtout("       %d: %s\n", i->idx, i->sym->name.c_str());
            cmtout("         type: ");
            switch ( i->sym->type )
            {
              case ST_PRIMITIVE:
                fprintf(stdout, "ST_PRIMITIVE\n");
                cmtout("            base: %s\n", prim2str(i->sym->prim));
                break;
              case ST_ARRAY:
                fprintf(stdout, "ST_ARRAY\n");
                cmtout("            base: %s\n", prim2str(i->sym->array.type));
                break;
              default:
                fprintf(stdout, "ST_UNKNOWN\n");
                break;
            }
          }
        }
        cmtout("    is_extern: %s\n", s->func.is_extern ? "yes" : "no");
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
