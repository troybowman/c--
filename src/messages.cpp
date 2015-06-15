#ifndef NDEBUG

#include <stdarg.h>

#include <common.h>
#include <messages.h>
#include <symbol.h>
#include <treenode.h>
#include <ir.h>
#include <asm.h>

//-----------------------------------------------------------------------------
static FILE *dbgfile;

void set_dbgfile(FILE *_dbgfile) { dbgfile = _dbgfile; }

//-----------------------------------------------------------------------------
static const char *header =
"#-----------------------------------------------------------------------------\n"
"# %s%s\n"
"#-----------------------------------------------------------------------------\n";

//-----------------------------------------------------------------------------
static void cmtout(int indent, const char *fmt, ...)
{
  std::string line("# ");
  while ( --indent >= 0 ) line.append("  ");
  line += fmt;
  va_list va;
  va_start(va, fmt);
  vfprintf(dbgfile, line.c_str(), va);
  va_end(va);
}

//-----------------------------------------------------------------------------
static const char *prim2str(primitive_t p)
{
  switch ( p )
  {
    case PRIM_INT:  return "PRIM_INT";
    case PRIM_CHAR: return "PRIM_CHAR";
    case PRIM_VOID: return "PRIM_VOID";
    default:
      INTERR(0);
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
    case TNT_PRINTF:       return "TNT_PRINTF";
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
    case TNT_PRINTF:
      ASSERT(0, child == PRINTF_TREE);
      return "PRINTF_TREE";
    default:
      INTERR(1035);
  }
}

//-----------------------------------------------------------------------------
static const char *cnt2str(codenode_type_t type)
{
  switch ( type )
  {
    case CNT_MOV:     return "CNT_MOV\n# -------";
    case CNT_LW:      return "CNT_LW\n# ------";
    case CNT_LB:      return "CNT_LB\n# ------";
    case CNT_SW:      return "CNT_SW\n# ------";
    case CNT_SB:      return "CNT_SB\n# ------";
    case CNT_ADD:     return "CNT_ADD\n# -------";
    case CNT_SUB:     return "CNT_SUB\n# -------";
    case CNT_DIV:     return "CNT_DIV\n# -------";
    case CNT_MUL:     return "CNT_MUL\n# -------";
    case CNT_LEA:     return "CNT_LEA\n# -------";
    case CNT_ARG:     return "CNT_ARG\n# -------";
    case CNT_CALL:    return "CNT_CALL\n# --------";
    case CNT_RET:     return "CNT_RET\n# -------";
    case CNT_OR:      return "CNT_OR\n# ------";
    case CNT_AND:     return "CNT_AND\n# -------";
    case CNT_SLT:     return "CNT_SLT\n# -------";
    case CNT_SGT:     return "CNT_SGT\n# -------";
    case CNT_SGE:     return "CNT_SGE\n# -------";
    case CNT_SLE:     return "CNT_SLE\n# -------";
    case CNT_SEQ:     return "CNT_SEQ\n# -------";
    case CNT_SNE:     return "CNT_SNE\n# -------";
    case CNT_CNDJMP:  return "CNT_CNDJMP\n# ----------";
    case CNT_LABEL:   return "CNT_LABEL\n# ---------";
    case CNT_JUMP:    return "CNT_JUMP\n# --------";
    case CNT_LI:      return "CNT_LI\n# ------";
    case CNT_SLL:     return "CNT_SLL\n# ------";
    case CNT_XOR:     return "CNT_XOR\n# ------";
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
    case ST_STACK_TEMPORARY: return "ST_STACK_TEMPORARY";
    case ST_INTCON:          return "ST_INTCON";
    case ST_CHARCON:         return "ST_CHARCON";
    case ST_STRCON:          return "ST_STRCON";
    case ST_LABEL:           return "ST_LABEL";
    case ST_REG_ARGUMENT:    return "ST_REG_ARGUMENT";
    case ST_STACK_ARGUMENT:  return "ST_STACK_ARGUMENT";
    case ST_RETVAL:          return "ST_RETVAL";
    case ST_ZERO:            return "ST_ZERO";
    default:
      INTERR(1061);
  }
}

//-----------------------------------------------------------------------------
static const char *addr2str(char *buf, size_t bufsize, const symbol_t &addr)
{
  const char *type = st2str(addr.type());

  switch ( addr.type() )
  {
    case ST_PRIMITIVE:
    case ST_ARRAY:
    case ST_FUNCTION:
      snprintf(buf, bufsize, "%s (%s)", type, addr.c_str());
      break;
    case ST_TEMPORARY:
    case ST_SAVED_TEMPORARY:
    case ST_STACK_TEMPORARY:
    case ST_REG_ARGUMENT:
    case ST_STACK_ARGUMENT:
    case ST_INTCON:
    case ST_LABEL:
      snprintf(buf, bufsize, "%s (%d)", type, addr.val());
      break;
    case ST_CHARCON:
    case ST_STRCON:
      snprintf(buf, bufsize, "%s (%s)", type, addr.str());
      break;
    case ST_RETVAL:
    case ST_ZERO:
      snprintf(buf, bufsize, "%s", type);
      break;
    default:
      INTERR(1078);
  }
  return buf;
}

//-----------------------------------------------------------------------------
void print_syms(const symtab_t &syms, const char *title, const char *extra)
{
  fprintf(dbgfile, header, title, extra);
  cmtout(0, "size: %d\n", syms.size());

  symtab_t::const_iterator i;
  for ( i = syms.begin(); i != syms.end(); i++ )
  {
    int indent = 0;
    const symbol_t &s = **i;
    cmtout(indent, "sym: %s\n", s.c_str());
    cmtout(++indent, "line: %d\n", s.line());

    cmtout(indent, "type: ");
    switch ( s.type() )
    {
      case ST_PRIMITIVE:
        fprintf(dbgfile,  "ST_PRIMITIVE\n");
        cmtout(++indent, "base: %s\n", prim2str(s.base()));
        break;
      case ST_ARRAY:
        fprintf(dbgfile,  "ST_ARRAY\n");
        cmtout(++indent, "base: %s\n", prim2str(s.base()));
        cmtout(indent,   "size: 0x%x\n", s.size());
        break;
      case ST_FUNCTION:
        fprintf(dbgfile,  "ST_FUNCTION\n");
        cmtout(++indent, "rt_type: %s\n", prim2str(s.base()));
        cmtout(indent,   "params:\n");
        if ( s.params()->size() < 1 )
          cmtout(indent+1, "none\n");
        else
        {
          symvec_t &params = *s.params();
          for ( size_t i = 0, sz = params.size(); i < sz ; i++ )
          {
            const symbol_t &p = *params[i];
            int pindent = indent+1;
            if ( p.type() == ST_ELLIPSIS )
            {
              cmtout(pindent, "%d: ST_ELLIPSIS\n", i);
              continue;
            }
            cmtout(pindent, "%d: %s\n", i, p.c_str());
            cmtout(++pindent, "type: ");
            switch ( p.type() )
            {
              case ST_PRIMITIVE:
                fprintf(dbgfile, "ST_PRIMITIVE\n");
                cmtout(++pindent, "base: %s\n", prim2str(p.base()));
                break;
              case ST_ARRAY:
                fprintf(dbgfile, "ST_ARRAY\n");
                cmtout(++pindent, "base: %s\n", prim2str(p.base()));
                break;
              default:
                INTERR(1062);
            }
          }
        }
        cmtout(indent, "is_extern: %s\n", s.is_extern() ? "yes" : "no");
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
  cmtout(0, "node %d: type: %s", curnode, tnt2str(node->type()));
  switch ( node->type() )
  {
    case TNT_INTCON:
      fprintf(dbgfile, " val: %d", node->val());
      break;
    case TNT_CHARCON:
    case TNT_STRCON:
      fprintf(dbgfile, " str: %s", node->str());
      break;
    case TNT_SYMBOL:
    case TNT_ARRAY_LOOKUP:
    case TNT_CALL:
      fprintf(dbgfile, " sym: %s", node->sym()->c_str());
      break;
    default:
      break;
  }
  fprintf(dbgfile, "\n");
  for ( int i = 0; i < 4; i++ )
  {
    treenode_t *child = node->children[i];
    if ( child != NULL )
    {
      cmtout(0, "child %s for node %d\n", child2str(node->type(), i), curnode);
      print_tree(node->children[i], cnt);
    }
  }
}

//-----------------------------------------------------------------------------
static void print_ir_code(const codenode_t *code)
{
  const codenode_t *ptr = code;
  while ( ptr != NULL )
  {
    cmtout(0, "%s\n", cnt2str(ptr->type));

#define MAXADDRSTR 32
    char buf[MAXADDRSTR];

    if ( ptr->dest != NULL )
      cmtout(0, "dest -> %s\n", addr2str(buf, MAXADDRSTR, *ptr->dest));
    if ( ptr->src1 != NULL )
      cmtout(0, "src1 -> %s\n", addr2str(buf, MAXADDRSTR, *ptr->src1));
    if ( ptr->src2 != NULL )
      cmtout(0, "src2 -> %s\n", addr2str(buf, MAXADDRSTR, *ptr->src2));

    ptr = ptr->next;

    if ( ptr != NULL )
      cmtout(0, "|\n# >\n");
  }
}

//-----------------------------------------------------------------------------
void print_ir(const ir_t &ir)
{
  ir_funcs_t::const_iterator i;
  for ( i = ir.funcs.begin(); i != ir.funcs.end(); i++ )
  {
    ir_func_t *f = *i;
    fprintf(dbgfile, header, "INTERMEDIATE CODE FOR FUNCTION: ", f->sym->c_str());
    cmtout(0, "temps used:    %d\n", f->temps.count());
    cmtout(0, "svregs used:   %d\n", f->svregs.count());
    cmtout(0, "stktemps used: %d\n", f->stktemps.count());
    cmtout(0, "regargs used:  %d\n", f->regargs.count());
    cmtout(0, "stkargs used:  %d\n", f->stkargs.count());
    print_ir_code(f->code);
  }
}

//-----------------------------------------------------------------------------
void walk_funcs(const treefuncs_t &functions, dbg_flags_t flags)
{
  treefuncs_t::const_iterator i;
  for ( i = functions.begin(); i != functions.end(); i++ )
  {
    treefunc_t tf     = *i;
    const symbol_t &f = *tf.sym;
    treenode_t *tree  = tf.tree;

    ASSERT(1080, f.is_func());

    if ( (flags & dbg_dump_lsyms) != 0 )
      print_syms(*f.symbols(), "LOCAL SYMBOLS FOR FUNCTION: ", f.c_str());

    if ( (flags & dbg_dump_tree) != 0 )
    {
      int cnt = 0;
      fprintf(dbgfile, header, "SYNTAX TREE FOR FUNCTION: ", f.c_str());
      print_tree(tree, &cnt);
    }
  }
}

//-----------------------------------------------------------------------------
#define FMTLEN  1024
#define NAMELEN 32
#define OFFLEN  64

static const char *sep =
"|--------------------------------|";

static offset_t dbg_stksize = BADOFFSET;

//-----------------------------------------------------------------------------
static void print_frame_item(uint32_t off, const char *fmt, ...)
{
  char namestr[FMTLEN];

  va_list va;
  va_start(va, fmt);
  vsnprintf(namestr, FMTLEN, fmt, va);
  va_end(va);

  char item[TABLEN+NAMELEN+5]; // <tab> + '#' + ' ' + '|' + name + '|' + '\0'
  char *ptr = item;

  const char *pfx = TAB1"# |";
  APPSTR(ptr, pfx, strlen(pfx));

  int len = cmin(strlen(namestr), NAMELEN);
  const char *const end = ptr + NAMELEN;

  APPCHAR(ptr, ' ', (NAMELEN - len) / 2);
  APPSTR (ptr, namestr, len);
  APPCHAR(ptr, ' ', end-ptr);
  APPCHAR(ptr, '|', 1);
  *ptr = '\0';

  fprintf(dbgfile, "%s\n", item);

  char offstr[OFFLEN];
  snprintf(offstr, OFFLEN, "sp+%d%s", off,
           off == dbg_stksize ? "  <-- start of caller's stack" : "");

  fprintf(dbgfile, TAB1"# %s %s\n", sep, offstr);
}

//-----------------------------------------------------------------------------
void stack_frame_t::dump()
{
  dbg_stksize = size();

  fprintf(dbgfile, "\n"TAB1"# %s\n", sep);

  // PARAMS -------------------------------------------------------------------
  struct param_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &sec, symbol_t &param, uint32_t idx) // TODO: const?
    {
      if ( param.loc.is_stkoff() )
        print_frame_item(param.loc.stkoff(), param.c_str());
      else
        print_frame_item(sec.top() - idx * WORDSIZE,
                         "<%s is in %s>",
                         param.c_str(), param.loc.reg());
    }
  } pp;

  sections[FS_PARAMS].visit_items(pp, FIV_REVERSE);

  // PADDING2 -----------------------------------------------------------------
  if ( sections[FS_PADDING2].is_valid() )
    print_frame_item(sections[FS_PADDING2].start, "<padding>");

  // LVARS --------------------------------------------------------------------
  struct lvar_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &, symbol_t &lvar, uint32_t)
    {
      if ( !lvar.is_param() )
        print_frame_item(lvar.loc.stkoff(), lvar.c_str());
    }
  } lvp;

  sections[FS_LVARS].visit_items(lvp, FIV_REVERSE);

  // PADDING1 -----------------------------------------------------------------
  if ( sections[FS_PADDING1].is_valid() )
    print_frame_item(sections[FS_PADDING1].start, "<padding>");

  // RA -----------------------------------------------------------------------
  struct ra_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &sec, symbol_t &ra, uint32_t)
    {
      print_frame_item(sec.start, ra.loc.reg());
    }
  } rap;

  sections[FS_RA].visit_items(rap, FIV_REVERSE);

  // STKTEMPS -----------------------------------------------------------------
  struct stktemp_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &, symbol_t &stktemp, uint32_t)
    {
      print_frame_item(stktemp.loc.stkoff(), "<stktemp %d>", stktemp.val());
    }
  } stp;

  sections[FS_STKTEMPS].visit_items(stp, FIV_REVERSE);

  // SVREGS -------------------------------------------------------------------
  struct svregs_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &sec, symbol_t &svreg, uint32_t idx)
    {
      print_frame_item(sec.top() - idx * WORDSIZE, svreg.loc.reg());
    }
  } srp;

  sections[FS_SVREGS].visit_items(srp, FIV_REVERSE);

  // STKARGS ------------------------------------------------------------------
  struct stkargs_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &, symbol_t &stkarg, uint32_t)
    {
      print_frame_item(stkarg.loc.stkoff(), "<stkarg %d>", stkarg.val());
    }
  } sag;

  sections[FS_STKARGS].visit_items(sag, FIV_REVERSE);

  // REGARGS ------------------------------------------------------------------
  if ( sections[FS_REGARGS].is_valid() )
    print_frame_item(sections[FS_REGARGS].start, "<minimum 4 arg slots>");
}

#endif // NDEBUG
