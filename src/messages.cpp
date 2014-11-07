#ifndef NDEBUG

#include "messages.h"
#include "symbols.h"

static const char *header =
"#-----------------------------------------------------------------------------\n"
"# %s\n"
"#-----------------------------------------------------------------------------\n";

//-----------------------------------------------------------------------------
static void cmtout(int indent, const char *fmt, ...)
{
  std::string line("# ");
  while ( --indent >= 0 )
    line.append("  ");
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
  cmtout(0, "size: %d\n", gsyms.size());

  symtab_t::const_iterator i;
  for ( i = gsyms.begin(); i != gsyms.end(); i++ )
  {
    int indent = 0;
    const symbol_t *s = i->second;
    cmtout(indent, "sym: %s\n", s->name.c_str());
    cmtout(++indent, "line: %d\n", s->line);

    cmtout(indent, "type: ");
    switch ( s->type )
    {
      case ST_PRIMITIVE:
        fprintf(stdout,  "ST_PRIMITIVE\n");
        cmtout(++indent, "base: %s\n", prim2str(s->prim));
        break;
      case ST_ARRAY:
        fprintf(stdout,  "ST_ARRAY\n");
        cmtout(++indent, "base: %s\n", prim2str(s->array.type));
        cmtout(indent,   "size: 0x%x\n", s->array.size);
        break;
      case ST_FUNCTION:
        fprintf(stdout,  "ST_FUNCTION\n");
        cmtout(++indent, "rt_type: %s\n", rt2str(s->func.rt_type));
        cmtout(indent,   "params:\n");
        if ( s->func.params == NULL )
          cmtout(indent+1, "none\n");
        else
        {
          paramvec_t::iterator i;
          for ( i = s->func.params->begin(); i < s->func.params->end(); i++ )
          {
            symbol_t *p = *i;
            int pindent = indent+1;
            cmtout(pindent, "%d: %s\n", p->idx, p->name.c_str());
            cmtout(++pindent, "type: ");
            switch ( p->type )
            {
              case ST_PRIMITIVE:
                fprintf(stdout, "ST_PRIMITIVE\n");
                cmtout(++pindent, "base: %s\n", prim2str(p->prim));
                break;
              case ST_ARRAY:
                fprintf(stdout, "ST_ARRAY\n");
                cmtout(++pindent, "base: %s\n", prim2str(p->array.type));
                break;
              default:
                fprintf(stdout, "ST_UNKNOWN\n");
                break;
            }
          }
        }
        cmtout(indent, "is_extern: %s\n", s->func.is_extern ? "yes" : "no");
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
