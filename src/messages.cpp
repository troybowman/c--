#include <list>
#include <string>

#include <messages.h>

//-----------------------------------------------------------------------------
// Error messages
//-----------------------------------------------------------------------------

#define MAXERRS   50
#define MAXERRLEN 250

typedef std::list<std::string> errlist_t;

//-----------------------------------------------------------------------------
static errlist_t errmsgs;

//-----------------------------------------------------------------------------
void purge_and_exit(int code)
{
  errlist_t::const_iterator i;
  for ( i = errmsgs.begin(); i != errmsgs.end(); i++ )
    fprintf(stderr, i->c_str());
  exit(code);
}

//-----------------------------------------------------------------------------
void usererr(const char *format, ...)
{
  va_list va;
  va_start(va, format);

  char buf[MAXERRLEN];
  vsnprintf(buf, MAXERRLEN, format, va);
  errmsgs.push_back(std::string(buf));

  va_end(va);

  if ( errmsgs.size() >= MAXERRS )
    purge_and_exit(FATAL_MAXERR);
}

//-----------------------------------------------------------------------------
void checkerr()
{
  if ( errmsgs.size() > 0 )
    purge_and_exit(FATAL_NORMAL);
}

//-----------------------------------------------------------------------------
// Debug/Logging messages
//-----------------------------------------------------------------------------

#ifndef NDEBUG

#include <symbol.h>
#include <treenode.h>

//-----------------------------------------------------------------------------
static const char *header =
"#-----------------------------------------------------------------------------\n"
"# %s%s\n"
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
static const char *tnt2str(treenode_type_t tnt)
{
  switch ( tnt )
  {
    case TNT_ERROR:        return  "TNT_ERROR";
    case TNT_INTCON:       return  "TNT_INTCON";
    case TNT_CHARCON:      return  "TNT_CHARCON";
    case TNT_STRCON:       return  "TNT_STRCON";
    case TNT_SYMBOL:       return  "TNT_SYMBOL";
    case TNT_ASSG:         return  "TNT_ASSG";
    case TNT_PLUS:         return  "TNT_PLUS";
    case TNT_MINUS:        return  "TNT_MINUS";
    case TNT_MULT:         return  "TNT_MULT";
    case TNT_DIV:          return  "TNT_DIV";
    case TNT_LT:           return  "TNT_LT";
    case TNT_GT:           return  "TNT_GT";
    case TNT_LEQ:          return  "TNT_LEQ";
    case TNT_GEQ:          return  "TNT_GEQ";
    case TNT_EQ:           return  "TNT_EQ";
    case TNT_NEQ:          return  "TNT_NEQ";
    case TNT_AND:          return  "TNT_AND";
    case TNT_OR:           return  "TNT_OR";
    case TNT_ARRAY_LOOKUP: return  "TNT_ARRAY_LOOKUP";
    case TNT_FOR:          return  "TNT_FOR";
    case TNT_STMT:         return  "TNT_STMT";
    case TNT_CALL:         return  "TNT_CALL";
    default:
      INTERR(0);
  }
}

//-----------------------------------------------------------------------------
void print_syms(const symtab_t &syms)
{
  cmtout(0, "size: %d\n", syms.size());

  symtab_t::const_iterator i;
  for ( i = syms.begin(); i != syms.end(); i++ )
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
        if ( s->func.params->size() < 1 )
          cmtout(indent+1, "none\n");
        else
        {
          paramvec_t *params = s->func.params;
          int size = params->size();
          for ( int i = 0; i < size; i++ )
          {
            symbol_t *p = params->at(i);
            int pindent = indent+1;
            cmtout(pindent, "%d: %s\n", i, p->name.c_str());
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
void print_gsyms()
{
  fprintf(stdout, header, "GLOBAL SYMBOL TABLE", "");
  print_syms(gsyms);
}

//-----------------------------------------------------------------------------
void print_tree(const treenode_t *node, int cnt)
{
  ASSERT(0, node != NULL);
  ++cnt;
  cmtout(0, "node %d: type: %s", cnt, tnt2str(node->type));
  switch ( node->type )
  {
    case TNT_INTCON:
      fprintf(stdout, " val: %d", node->val);
      break;
    case TNT_CHARCON:
    case TNT_STRCON:
      fprintf(stdout, " str: %s", node->str);
      break;
    case TNT_SYMBOL:
      fprintf(stdout, " sym: %s", node->sym->name.c_str());
      break;
    default:
      break;
  }
  fprintf(stdout, "\n");
  for ( int i = 0; i < 4; i++ )
  {
    treenode_t *child = node->children[i];
    if ( child != NULL )
    {
      cmtout(0, "child %d for node %d:\n", i, cnt);
      print_tree(node->children[i], cnt);
    }
  }
}

//-----------------------------------------------------------------------------
void walk_funcs(dbg_flags_t flags)
{
  symlist_t::const_iterator i;
  for ( i = functions.begin(); i != functions.end(); i++ )
  {
    symbol_t *f = *i;
    ASSERT(1012, f->type == ST_FUNCTION);
    if ( (flags & dbg_lsyms) != 0 )
    {
      fprintf(stdout, header, "LOCAL SYMBOLS FOR FUNCTION: ", f->name.c_str());
      print_syms(*f->func.symbols);
    }
    if ( (flags & dbg_tree) != 0 )
    {
      fprintf(stdout, header, "SYNTAX TREE FOR FUNCTION: ", f->name.c_str());
      print_tree(f->func.syntax_tree, 0);
    }
  }
}

#endif // NDEBUG
