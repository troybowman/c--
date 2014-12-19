#include <list>
#include <string>

#include <messages.h>

//-----------------------------------------------------------------------------
// Error messages
//-----------------------------------------------------------------------------

#define MAXERRS   50
#define MAXERRLEN 1024

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
#include <codenode.h>

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
static const char *rt2str(return_type_t rt)
{
  switch ( rt )
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
    case TNT_ERROR:        return "TNT_ERROR";
    case TNT_INTCON:       return "TNT_INTCON";
    case TNT_CHARCON:      return "TNT_CHARCON";
    case TNT_STRCON:       return "TNT_STRCON";
    case TNT_SYMBOL:       return "TNT_SYMBOL";
    case TNT_ASSG:         return "TNT_ASSG";
    case TNT_PLUS:         return "TNT_PLUS";
    case TNT_MINUS:        return "TNT_MINUS";
    case TNT_MULT:         return "TNT_MULT";
    case TNT_DIV:          return "TNT_DIV";
    case TNT_LT:           return "TNT_LT";
    case TNT_GT:           return "TNT_GT";
    case TNT_LEQ:          return "TNT_LEQ";
    case TNT_GEQ:          return "TNT_GEQ";
    case TNT_EQ:           return "TNT_EQ";
    case TNT_NEQ:          return "TNT_NEQ";
    case TNT_AND:          return "TNT_AND";
    case TNT_OR:           return "TNT_OR";
    case TNT_ARRAY_LOOKUP: return "TNT_ARRAY_LOOKUP";
    case TNT_FOR:          return "TNT_FOR";
    case TNT_STMT:         return "TNT_STMT";
    case TNT_CALL:         return "TNT_CALL";
    case TNT_ARG:          return "TNT_ARG";
    case TNT_RET:          return "TNT_RET";
    case TNT_IF:           return "TNT_IF";
    case TNT_NOT:          return "TNT_NOT";
    case TNT_NEG:          return "TNT_NEG";
    case TNT_WHILE:        return "TNT_WHILE";
    default:
      INTERR(1030);
  }
}

//-----------------------------------------------------------------------------
static const char *child2str(treenode_type_t type, int child)
{
  switch ( type )
  {
    case TNT_ASSG:
    case TNT_PLUS:
    case TNT_MINUS:
    case TNT_MULT:
    case TNT_DIV:
    case TNT_LT:
    case TNT_GT:
    case TNT_LEQ:
    case TNT_GEQ:
    case TNT_EQ:
    case TNT_NEQ:
    case TNT_AND:
    case TNT_OR:
    case TNT_NOT:
    case TNT_NEG:
      ASSERT(1031, child == LHS || child == RHS);
      return child == LHS ? "LHS" : "RHS";
    case TNT_ARRAY_LOOKUP:
      ASSERT(1032, child == AL_OFFSET);
      return "AL_OFFSET";
    case TNT_FOR:
      return child == FOR_INIT  ? "FOR_INIT"
           : child == FOR_COND  ? "FOR_COND"
           : child == FOR_INC   ? "FOR_INC"
           :                      "FOR_BODY";
    case TNT_STMT:
    case TNT_ARG:
      ASSERT(1033, child == SEQ_CUR || child == SEQ_NEXT);
      return child == SEQ_CUR ? "SEQ_CUR" : "SEQ_NEXT";
    case TNT_CALL:
      ASSERT(1034, child == CALL_ARGS);
      return "CALL_ARGS";
    case TNT_RET:
      ASSERT(1036, child == RET_EXPR);
      return "RET_EXPR";
    case TNT_IF:
      ASSERT(1066, child != 3);
      return child == IF_COND ? "IF_COND"
           : child == IF_BODY ? "IF_BODY"
           :                    "IF_ELSE";
    case TNT_WHILE:
      ASSERT(1067, child == WHILE_COND || child == WHILE_BODY);
      return child == WHILE_COND ? "WHILE_COND" : "WHILE_BODY";
    default:
      INTERR(1035);
  }
}

//-----------------------------------------------------------------------------
static const char *cnt2str(codenode_type_t type)
{
  switch ( type )
  {
    case CNT_MOV:  return "CNT_MOV\n# -------";
    case CNT_LW:   return "CNT_LW\n# ------";
    case CNT_LB:   return "CNT_LB\n# ------";
    case CNT_SW:   return "CNT_SW\n# ------";
    case CNT_SB:   return "CNT_SB\n# ------";
    case CNT_ADD:  return "CNT_ADD\n# -------";
    case CNT_SUB:  return "CNT_SUB\n# -------";
    case CNT_DIV:  return "CNT_DIV\n# -------";
    case CNT_MUL:  return "CNT_MUL\n# -------";
    case CNT_LEA:  return "CNT_LEA\n# -------";
    case CNT_ARG:  return "CNT_ARG\n# -------";
    case CNT_CALL: return "CNT_CALL\n# --------";
    case CNT_RET:  return "CNT_RET\n# -------";
    default:
      INTERR(1060);
  }
}

//-----------------------------------------------------------------------------
static const char *st2str(symbol_type_t type)
{
  switch( type )
  {
    case ST_PRIMITIVE:       return "ST_PRIMITIVE";
    case ST_ARRAY:           return "ST_ARRAY";
    case ST_FUNCTION:        return "ST_FUNCTION";
    case ST_TEMPORARY:       return "ST_TEMPORARY";
    case ST_SAVED_TEMPORARY: return "ST_SAVED_TEMPORARY";
    case ST_INTCON:          return "ST_INTCON";
    case ST_CHARCON:         return "ST_CHARCON";
    case ST_STRCON:          return "ST_STRCON";
    case ST_LABEL:           return "ST_LABEL";
    case ST_ARGUMENT:        return "ST_ARGUMENT";
    case ST_RETLOC:          return "ST_RETLOC";
    default:
      INTERR(1061);
  }
}

//-----------------------------------------------------------------------------
static const char *addr2str(const symbol_t *addr)
{
#define MAXADDRSTR 32
  static char buf[MAXADDRSTR];

  const char *type = st2str(addr->type());

  switch ( addr->type() )
  {
    case ST_PRIMITIVE:
    case ST_ARRAY:
    case ST_FUNCTION:
      snprintf(buf, MAXADDRSTR, "%s (%s)", type, addr->c_str());
      return buf;
    case ST_TEMPORARY:
    case ST_SAVED_TEMPORARY:
    case ST_ARGUMENT:
    case ST_INTCON:
      snprintf(buf, MAXADDRSTR, "%s (%d)", type, addr->val());
      return buf;
    case ST_CHARCON:
    case ST_STRCON:
      snprintf(buf, MAXADDRSTR, "%s (%s)", type, addr->str());
      return buf;
    case ST_LABEL:
    case ST_RETLOC:
      snprintf(buf, MAXADDRSTR, "%s", type);
      return buf;
    default:
      INTERR(1078);
  }
}

//-----------------------------------------------------------------------------
void print_syms(const symtab_t &syms, const char *title, const char *extra)
{
  fprintf(stdout, header, title, extra);
  cmtout(0, "size: %d\n", syms.size());

  symtab_t::const_iterator i;
  for ( i = syms.begin(); i != syms.end(); i++ )
  {
    int indent = 0;
    const symbol_t *s = i->second;
    cmtout(indent, "sym: %s\n", s->c_str());
    cmtout(++indent, "line: %d\n", s->line());

    cmtout(indent, "type: ");
    switch ( s->type() )
    {
      case ST_PRIMITIVE:
        fprintf(stdout,  "ST_PRIMITIVE\n");
        cmtout(++indent, "base: %s\n", prim2str(s->base()));
        break;
      case ST_ARRAY:
        fprintf(stdout,  "ST_ARRAY\n");
        cmtout(++indent, "base: %s\n", prim2str(s->base()));
        cmtout(indent,   "size: 0x%x\n", s->size());
        break;
      case ST_FUNCTION:
        fprintf(stdout,  "ST_FUNCTION\n");
        cmtout(++indent, "rt_type: %s\n", rt2str(s->rt()));
        cmtout(indent,   "params:\n");
        if ( s->params()->size() < 1 )
          cmtout(indent+1, "none\n");
        else
        {
          symlist_t *params = s->params();
          symlist_t::const_iterator i;
          for ( i = params->begin(); i != params->end(); i++ )
          {
            symbol_t *p = *i;
            int pindent = indent+1;
            cmtout(pindent, "%d: %s\n", params->dist(i), p->c_str());
            cmtout(++pindent, "type: ");
            switch ( p->type() )
            {
              case ST_PRIMITIVE:
                fprintf(stdout, "ST_PRIMITIVE\n");
                cmtout(++pindent, "base: %s\n", prim2str(p->base()));
                break;
              case ST_ARRAY:
                fprintf(stdout, "ST_ARRAY\n");
                cmtout(++pindent, "base: %s\n", prim2str(p->base()));
                break;
              default:
                INTERR(1062);
            }
          }
        }
        cmtout(indent, "is_extern: %s\n", s->is_extern() ? "yes" : "no");
        break;
      default:
        INTERR(1063);
    }
  }
}

//-----------------------------------------------------------------------------
void print_tree(const treenode_t *node, int *cnt)
{
  if ( node == NULL )
    return;
  ASSERT(1068, cnt != NULL);
  (*cnt)++;
  int curnode = *cnt;
  cmtout(0, "node %d: type: %s", curnode, tnt2str(node->type));
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
    case TNT_ARRAY_LOOKUP:
    case TNT_CALL:
      fprintf(stdout, " sym: %s", node->sym->c_str());
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
      cmtout(0, "child %s for node %d\n", child2str(node->type, i), curnode);
      print_tree(node->children[i], cnt);
    }
  }
}

//-----------------------------------------------------------------------------
static void print_ir_strings(const symtab_t *strings)
{
  fprintf(stdout, header, "STRING CONSTANTS", "");
  symtab_t::const_iterator i;
  for ( i = strings->begin(); i != strings->end(); i++ )
  {
    std::string string = i->first;
    cmtout(0, "%s\n", string.c_str());
  }
}

//-----------------------------------------------------------------------------
static void print_ir_code(const codenode_t *code)
{
  const codenode_t *ptr = code;
  while ( ptr != NULL )
  {
    cmtout(0, "%s\n", cnt2str(ptr->type));

    if ( ptr->dest != NULL )
      cmtout(0, "dest -> %s\n", addr2str(ptr->dest));
    if ( ptr->src1 != NULL )
      cmtout(0, "src1 -> %s\n", addr2str(ptr->src1));
    if ( ptr->src2 != NULL )
      cmtout(0, "src2 -> %s\n", addr2str(ptr->src2));

    ptr = ptr->next;

    if ( ptr != NULL )
      cmtout(0, "|\n# >\n");
  }
}

//-----------------------------------------------------------------------------
void print_ir(const ir_t &ir)
{
  print_ir_strings(ir.strings);

  ir_funcs_t::const_iterator i;
  for ( i = ir.funcs.begin(); i != ir.funcs.end(); i++ )
  {
    ir_func_t *irf = *i;
    fprintf(stdout, header, "INTERMEDIATE CODE FOR FUNCTION: ", irf->func->c_str());
    cmtout(0, "temps used:   %d\n", irf->temps->size());
    cmtout(0, "svtemps used: %d\n", irf->svtemps->size());
    cmtout(0, "args used:    %d\n", irf->args->size());
    print_ir_code(irf->code);
  }
}

//-----------------------------------------------------------------------------
void walk_funcs(const symlist_t &functions, dbg_flags_t flags)
{
  symlist_t::const_iterator i;
  for ( i = functions.begin(); i != functions.end(); i++ )
  {
    symbol_t *f = *i;
    ASSERT(1012, f->is_func());

    if ( (flags & dbg_dump_lsyms) != 0 )
      print_syms(*f->symbols(), "LOCAL SYMBOLS FOR FUNCTION: ", f->c_str());

    if ( (flags & dbg_dump_tree) != 0 )
    {
      int cnt = 0;
      fprintf(stdout, header, "SYNTAX TREE FOR FUNCTION: ", f->c_str());
      print_tree(f->tree(), &cnt);
    }
  }
}

#endif // NDEBUG
