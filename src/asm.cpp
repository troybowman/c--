#include <common.h>
#include <asm.h>

#define EXIT "__exit"

#define RESERVED_TEMP1 "$t7"
#define RESERVED_TEMP2 "$t8"
#define RESERVED_TEMP3 "$t9"

#define TAB "  "
#define TABLEN (sizeof(TAB)-1)

#define TAB0 0
#define TAB1 1
#define TAB2 2

//-----------------------------------------------------------------------------
static const char *header =
"#-----------------------------------------------------------------------------\n"
"# %s%s\n"
"#-----------------------------------------------------------------------------\n";

//-----------------------------------------------------------------------------
static const char *tempreg_names[TEMPREGQTY] =
  { "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6" };

static const char *svreg_names[SVREGQTY] =
  { "$s0", "$s1", "$s2", "$s3", "$s4", "$s5", "$s6", "$s7" };

static const char *argreg_names[ARGREGQTY] =
  { "$a0", "$a1", "$a2", "$a3" };

//-----------------------------------------------------------------------------
void frame_section_t::visit_items(
    asm_context_t &actx,
    frame_item_visitor_t &fiv,
    uint32_t flags) const
{
  for ( size_t i = 0; i < items.size(); i++ )
  {
    item_info_t info;
    info.ctx = actx
    info.sec = *this;
    info.idx = (flags & FIV_REVERSE) == 0 ? i : (items.size()-1) - i;
    fiv.visit_item(info, *items[info.idx]);
  }
}

//-----------------------------------------------------------------------------
void frame_section_t::build_items(
    asm_context_t &actx,
    frame_item_builder_t &fib)
{
  for ( size_t i = 0; i < items.size(); i++ )
  {
    frame_mods_t mods;
    mods.ctx = actx;
    mods.sec = *this;
    mods.idx = i;
    mods.delta = BADOFFSET;
    fib.build_item(mods, *items[i]);
    if ( mods.delta != BADOFFSET )
      end += mods.delta;
  }
}

//-----------------------------------------------------------------------------
static void build_regargs(
    asm_context_t &actx,
    stack_frame_t &frame,
    const ir_func_t &f)
{
  frame_section_t &regargs = frame.sections[FS_REGARGS];

  regargs.init(*f.get(ST_REGARG));

  if ( f.has_call() )
    regargs.end = ARGREGQTY * WORDSIZE;

  struct regargs_builder_t : public frame_item_builder_t
  {
    virtual void visit_item(frame_mods_t &, symbol_t &arg)
    {
      arg.loc.set_reg(argreg_names[arg.val()]);
    }
  } b;

  regargs.visit_items(actx, b);
}

//-----------------------------------------------------------------------------
static void build_stkargs(asm_context_t &actx, stack_frame_t &frame)
{
  frame_section_t &stkargs = frame.sections[FS_STKARGS];

  stkargs.init(*f.get(ST_STKARG));
  stkargs.start = stkargs.end = sections[FS_REGARGS].end;

  struct stkargs_builder_t : public frame_item_builder_t
  {
    virtual void visit_item(frame_mods_t &mods, symbol_t &stkarg)
    {
      stkarg.loc.set_stkoff(mods.sec.end);
      mods.delta = WORDSIZE;
    }
  } b;

  stkargs.visit_items(actx, b);
}

//-----------------------------------------------------------------------------
static void build_svregs(asm_context_t &actx, stack_frame_t &frame)
{
  frame_section_t &svregs = sections[FS_SVREGS];

  svregs.init(*f.get(ST_SVTEMP));
  svregs.start = svregs.end = sections[FS_STKARGS].end;

  struct svregs_builder_t : public frame_item_builder_t
  {
    virtual void visit_item(frame_mods_t &mods, symbol_t &svreg)
    {
      svreg.loc.set_reg(svreg_names[svreg.val()]);
      mods.delta = WORDSIZE;
    }
  } b;

  svregs.visit_items(actx, b);
}

//-----------------------------------------------------------------------------
static void build_stktemps(asm_context_t &actx, stack_frame_t &frame)
{
  frame_section_t &stktemps = sections[FS_STKTEMPS];

  stktemps.init(*f.get(ST_STKTEMP));
  stktemps.start = stktemps.end = sections[FS_SVREGS].end;

  struct stktemps_builder_t : public frame_item_builder_t
  {
    virtual void visit_item(frame_mods_t &info, symbol_t &mods)
    {
      stktemp.loc.set_stkoff(mods.sec.end);
      mods.delta = WORDSIZE;
    }
  } b;

  stktemps.visit_items(actx, b);
};

//-----------------------------------------------------------------------------
static void build_ra(asm_context_t &actx, stack_frame_t &frame)
{
  frame_section_t &ra = sections[FS_RA];

  ra.init(*f.get(ST_RETADDR));
  ra.start = ra.end = sections[FS_STKTEMPS].end;

  struct ra_builder_t : public frame_item_builder_t
  {
    virtual void visit_item(frame_mods_t &mods, symbol_t &ra)
    {
      ra.loc.set_reg("$ra");
      mods.delta = WORDSIZE;
    }
  } b;

  ra.visit_items(actx, b);
}

//-----------------------------------------------------------------------------
static void build_padding(stack_frame_t &frame, int padid, int previd)
{
  frame_section_t &padding = frame.sections[padid];

  padding.start = frame.sections[previd].end;
  padding.end   = ALIGN(padding.start, DWORDSIZE);
}

//-----------------------------------------------------------------------------
static void build_lvars(asm_context_t &actx, frame_section_t &frame)
{
  frame_section_t &lvars = frame.sections[FS_LVARS];

  lvars.init(*f.sym()->lvars());
  lvars.start = lvars.end = sections[FS_PADDING1].end;

  struct lvars_builder_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_mods_t &mods, symbol_t &lvar)
    {
      if ( lvar.is_param() )
        return;

      lvar.loc.set_stkoff(mods.sec.end);
      mods.delta = ALIGN(lvar.size(), WORDSIZE);
    }
  } b;

  lvars.visit_items(actx, b);
}

//-----------------------------------------------------------------------------
static void build_params(asm_context_t &actx, stack_frame_t &frame)
{
  frame_section_t &params = frame.sections[FS_PARAMS];

  params.init(*f.sym()->params());
  params.start = params.end = sections[FS_PADDING2].end;

  struct params_builder_t : public frame_item_builder_t
  {
    uint32_t nregargs;

    virtual void visit_item(frame_mods_t &mods, symbol_t &param)
    {
      if ( mods.idx < ARGREGQTY && mods.idx >= nregargs )
        param.loc.set_reg(argreg_names[mods.idx]);
      else
        param.loc.set_stkoff(mods.sec.end);

      mods.delta = WORDISZE;
    }
  } b;

  b.nregargs = secions[FS_REGARGS].nitems();
  params.visit_items(actx, b);
}

//-----------------------------------------------------------------------------
stack_frame_t::stack_frame_t(asm_ctx_t &actx, const ir_func_t &f)
{
  epilogue_label = symref_t(new symbol_t(ST_LABEL));
  prepare_named_symbol(ctx, epilogue_label, "%s%s", "__leave", f.sym()->c_str());

  build_regargs(actx, *this, f);
  build_stkargs(actx, *this);
  build_svregs(actx, *this);
  build_stktemps(actx, *this);
  build_ra(actx, *this);
  build_padding(*this, FS_PADDING1, FS_RA);
  build_lvars(actx, *this);
  build_padding(*this, FS_PADDING2, FS_LVARS);
  build_params(actx, *this);
}

//-----------------------------------------------------------------------------
static const struct saver_pair_t { int sec; int base; } pairs[3] =
{
 { FS_SVREGS,  FS_SVREGS },
 { FS_RA,      FS_RA     },
 { FS_REGARGS, FS_PARAMS },
};

//-----------------------------------------------------------------------------
void stack_frame_t::gen_prologue()
{
  if ( size() > 0 )
    ctx.out(TAB1"la $sp, -%u($sp)\n", size());

  for ( int i = 0; i < 3; i++ )
  {
    reg_saver_t saver;
    saver.cmd = "sw";
    saver.base = sections[pairs[i].base];
    visit_items(pairs[i].sec, saver);
  }

  ctx.out("\n");
}

//-----------------------------------------------------------------------------
void stack_frame_t::gen_epilogue()
{
  ctx.out("\n%s:\n", epilogue_label->c_str());

  for ( int i = 2; i >= 0; i-- )
  {
    reg_saver_t saver;
    saver.cmd = "lw";
    saver.base = sections[pairs[i].base];
    visit_items(pairs[i].sec, saver, FIV_REVERSE);
  }

  if ( size() > 0 )
    ctx.out(TAB1"la $sp, %u($sp)\n", size());

  // MARS, for some utterly moronic reason, does not call main. we must manually exit
  if ( f.sym()->is_main() )
    ctx.out(TAB1"jal %s\n", EXIT);
  else
    ctx.out(TAB1"jr $ra\n");
}

//-----------------------------------------------------------------------------
asm_context_t::asm_context_t(FILE *_outfile, dbg_flags_t _flags)
  : outfile(_outfile),
    flags(_flags)
{
  ASSERT(0, outfile != NULL);

  t7 = symref_t(new symbol_t(ST_TEMP));
  t8 = symref_t(new symbol_t(ST_TEMP));
  t9 = symref_t(new symbol_t(ST_TEMP));

  t7->loc.set_reg(RESERVED_TEMP1);
  t8->loc.set_reg(RESERVED_TEMP2);
  t9->loc.set_reg(RESERVED_TEMP3);
}

//-----------------------------------------------------------------------------
void asm_context_t::out(const char *fmt, ...)
{
  va_list va;
  va_start(va, fmt);
  vfprintf(outfile, fmt, va);
  va_end(va);
}

//-----------------------------------------------------------------------------
static const char *prim2str(primitive_t p)
{
  switch ( p )
  {
    case PRIM_INT:  return "int";
    case PRIM_CHAR: return "char";
    case PRIM_VOID: return "void";
    case PRIM_BOOL: return "bool";
    default:
      INTERR(0);
  }
}

//-----------------------------------------------------------------------------
static void print_tinfo(char *buf, size_t bufsize, const tinfo_t &tinfo)
{
  const char *str = NULL;

  switch ( tinfo.id() )
  {
    case TID_PRIM:
      str = prim2str(tinfo.prim());
      strncpy(buf, bufsize, str);
      break;
    case TID_ARRAY:
      if ( tinfo.size() != BADOFFSET )
        buf += snprintf(buf, "[%d]->", bufsize, tinfo.size());
      else
        buf += snprintf(buf, "[]->", bufsize);
      print_tinfo(buf, end-buf, *tinfo.subtype());
      break;
    case TID_PTR:
      buf += snprintf(buf, "*->", bufsize);
      print_tinfo(buf, end-buf, *tinfo.subtype());
      break;
    case TID_STRUCT:
      str = tinfo.name().c_str();
      strncpy(buf, bufsize, str);
      break;
    case TID_BOOL:
      strncpy(buf, bufsize, "bool");
      break;
    default:
      INTERR(0);
  }
}

//-----------------------------------------------------------------------------
void asm_context_t::print_gsyms(const symtab_t &gsyms)
{

}

//-----------------------------------------------------------------------------
void logger_t::print_parse_results(const parse_results_t &res)
{
  if ( (flags & dbg_dump_gsyms) != 0 )
    print_gsyms(res.gsyms);
  if ( (flags & dbg_dump_structs) != 0 )
    print_structs(res.structs);
  if ( (flags & dbg_dump_funcs) != 0 )
    print_trees(res.trees);
}

//-----------------------------------------------------------------------------
void logger_t::cmtout(int indent, const char *fmt, ...)
{
  std::string line("# ");
  while ( --indent >= 0 )
    line.append("  ");
  line += fmt;
  va_list va;
  va_start(va, fmt);
  vfprintf(logfile, line.c_str(), va);
  va_end(va);
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
    case TNT_SHL:          return "TNT_SHL";
    case TNT_SHR:          return "TNT_SHR";
    case TNT_BAND:         return "TNT_BAND";
    case TNT_BOR:          return "TNT_BOR";
    case TNT_BNOT:         return "TNT_BNOT";
    case TNT_XOR:          return "TNT_XOR";
    case TNT_OR:           return "TNT_OR";
    case TNT_PEQ:          return "TNT_PEQ";
    case TNT_MEQ:          return "TNT_MEQ";
    case TNT_TEQ:          return "TNT_TEQ";
    case TNT_DEQ:          return "TNT_DEQ";
    case TNT_AEQ:          return "TNT_AEQ";
    case TNT_OEQ:          return "TNT_OEQ";
    case TNT_XEQ:          return "TNT_XEQ";
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
    case TNT_SHL:
    case TNT_SHR:
    case TNT_BAND:
    case TNT_BOR:
    case TNT_BNOT:
    case TNT_XOR:
    case TNT_PEQ:
    case TNT_MEQ:
    case TNT_TEQ:
    case TNT_DEQ:
    case TNT_AEQ:
    case TNT_OEQ:
    case TNT_XEQ:
      ASSERT(1031, child == LHS || child == RHS);
      return child == LHS ? "LHS" : "RHS";
    case TNT_ARRAY_LOOKUP:
      ASSERT(1032, child == AL_INDEX);
      return "AL_INDEX";
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
      ASSERT(1112, child == PRINTF_TREE);
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
    case CNT_SLLV:    return "CNT_SLLV\n# -------";
    case CNT_SRLV:    return "CNT_SRLV\n# -------";
    case CNT_NOT:     return "CNT_NOT\n# ------";
    default:
      INTERR(1060);
  }
}

//-----------------------------------------------------------------------------
static const char *st2str(symbol_type_t type)
{
  switch( type )
  {
    case ST_PRIMITIVE: return "ST_PRIMITIVE";
    case ST_ARRAY:     return "ST_ARRAY";
    case ST_FUNCTION:  return "ST_FUNCTION";
    case ST_TEMP:      return "ST_TEMP";
    case ST_SVTEMP:    return "ST_SVTEMP";
    case ST_STKTEMP:   return "ST_STKTEMP";
    case ST_INTCON:    return "ST_INTCON";
    case ST_CHARCON:   return "ST_CHARCON";
    case ST_STRCON:    return "ST_STRCON";
    case ST_LABEL:     return "ST_LABEL";
    case ST_REGARG:    return "ST_REGARG";
    case ST_STKARG:    return "ST_STKARG";
    case ST_RETVAL:    return "ST_RETVAL";
    case ST_ZERO:      return "ST_ZERO";
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
    case ST_TEMP:
    case ST_SVTEMP:
    case ST_STKTEMP:
    case ST_REGARG:
    case ST_STKARG:
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
void logger_t::print_syms(const symtab_t &syms, const char *title, const char *extra)
{
  fprintf(logfile, header, title, extra);
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
        fprintf(logfile,  "ST_PRIMITIVE\n");
        cmtout(++indent, "base: %s\n", prim2str(s.base()));
        break;
      case ST_ARRAY:
        fprintf(logfile,  "ST_ARRAY\n");
        cmtout(++indent, "base: %s\n", prim2str(s.base()));
        cmtout(indent,   "size: 0x%x\n", s.size());
        break;
      case ST_FUNCTION:
        fprintf(logfile,  "ST_FUNCTION\n");
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
                fprintf(logfile, "ST_PRIMITIVE\n");
                cmtout(++pindent, "base: %s\n", prim2str(p.base()));
                break;
              case ST_ARRAY:
                fprintf(logfile, "ST_ARRAY\n");
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
void logger_t::print_tree(const treenode_t *node, int *cnt)
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
      fprintf(logfile, " val: %d", node->val());
      break;
    case TNT_CHARCON:
    case TNT_STRCON:
      fprintf(logfile, " str: %s", node->str());
      break;
    case TNT_SYMBOL:
    case TNT_ARRAY_LOOKUP:
    case TNT_CALL:
      fprintf(logfile, " sym: %s", node->sym()->c_str());
      break;
    default:
      break;
  }
  fprintf(logfile, "\n");
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
void logger_t::print_ir_code(const codenode_t *code)
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
void logger_t::print_ir(const ir_t &ir)
{
  ir_funcs_t::const_iterator i;
  for ( i = ir.funcs.begin(); i != ir.funcs.end(); i++ )
  {
    ir_func_t *f = *i;
    fprintf(logfile, header, "INTERMEDIATE CODE FOR FUNCTION: ", f->sym()->c_str());
    cmtout(0, "temps used:    %d\n", f->count(ST_TEMP));
    cmtout(0, "svregs used:   %d\n", f->count(ST_SVTEMP));
    cmtout(0, "stktemps used: %d\n", f->count(ST_STKTEMP));
    cmtout(0, "regargs used:  %d\n", f->count(ST_REGARG));
    cmtout(0, "stkargs used:  %d\n", f->count(ST_STKARG));
    print_ir_code(f->code());
  }
}

//-----------------------------------------------------------------------------
void logger_t::walk_funcs(const stx_trees_t &trees, dbg_flags_t flags)
{
  stx_trees_t::const_iterator i;
  for ( i = trees.begin(); i != trees.end(); i++ )
  {
    const stx_tree_t &st = **i;
    const symbol_t &f = *st.sym;
    const treenode_t *tree = st.root;

    ASSERT(1080, f.is_func());

    if ( (flags & dbg_dump_lsyms) != 0 )
      print_syms(*f.symbols(), "LOCAL SYMBOLS FOR FUNCTION: ", f.c_str());

    if ( (flags & dbg_dump_tree) != 0 )
    {
      int cnt = 0;
      fprintf(logfile, header, "SYNTAX TREE FOR FUNCTION: ", f.c_str());
      print_tree(tree, &cnt);
    }
  }
}

//-----------------------------------------------------------------------------
#define NAMELEN 32
#define SEPARATOR "|--------------------------------|"

//-----------------------------------------------------------------------------
static void vprint_frame_item(
    asm_context_t &actx,
    offset_t off,
    offset_t framesize,
    const char *fmt,
    va_list va)
{
  char namestr[NAMELEN];
  vsnprintf(namestr, NAMELEN, fmt, va);

  char item[NAMELEN+4]; // ' ' + '|' + name + '|' + '\0'
  char *ptr = item;

  int len = cmin(strlen(namestr), NAMELEN);
  const char *const end = ptr + NAMELEN;

  APPCHAR(ptr, end, ' ', (NAMELEN - len) / 2);
  APPSTR (ptr, end, namestr, len);
  APPCHAR(ptr, end, ' ', end-ptr);
  APPCHAR(ptr, end, '|', 1);
  APPZERO(ptr, end);

  actx.cmtout(" %s\n", item);

  char offstr[MAXSTR];
  snprintf(offstr,
           MAXSTR,
           "sp+%d%s",
           off, off == framesize ? "  <-- start of caller's stack" : "");

  actx.cmtout(" %s %s\n", SEPARATOR, offstr);
}

//-----------------------------------------------------------------------------
static void print_frame_item(
    asm_context_t &actx,
    offset_t off,
    offset_t framesize,
    const char *fmt,
    ...)
{
  va_list va;
  va_start(va, fmt);
  vprint_frame_item(actx, off, framesize, fmt, va);
  va_end(va);
}

//-----------------------------------------------------------------------------
static void print_pseudo_section(
    asm_context_t &actx,
    const stack_frame_t &frame,
    int sectionid,
    const char *label)
{
  const frame_section_t &sec = frame.sections[sectionid];

  if ( sec.is_valid() )
    print_frame_item(actx, sec.start, frame.size, label);
}

//-----------------------------------------------------------------------------
struct frame_item_printer_t : public frame_item_visitor_t
{
  offset_t framesize;

protected:
  void print_frame_item(asm_context_t &actx, offset_t off, const char *fmt, ...)
  {
    va_list va;
    va_start(va, fmt);
    vprint_frame_item(actx, off, framesize, fmt, va);
    va_end(va);
  }
};

//-----------------------------------------------------------------------------
static void print_items(
    asm_context_t &actx,
    const stack_frame_t &frame,
    int sectionidx,
    frame_item_printer_t &fip)
{
  fip.framesize = frame.size();
  frame.sections[sectionidx].visit_items(actx, fip, FIV_REVERSE);
}

//-----------------------------------------------------------------------------
static void print_params(asm_context_t &actx, const stack_frame_t &frame)
{
  struct param_printer_t : public frame_item_printer_t
  {
    virtual void visit_item(item_info_t &info, const symbol_t &param)
    {
      if ( param.loc.is_stkoff() )
        print_frame_item(info.actx, param.loc.stkoff(), param.c_str());
      else
        print_frame_item(info.actx,
                         info.sec.start + info.idx * WORDSIZE,
                         "<%s is in %s>", param.c_str(), param.loc.reg());
    }
  } printer;

  print_items(actx, frame, FS_PARAMS, printer);
}

//-----------------------------------------------------------------------------
static void print_lvars(asm_context_t &actx, const stack_frame_t&frame)
{
  struct lvar_printer_t : public frame_item_printer_t
  {
    virtual void visit_item(item_info_t &info, const symbol_t &lvar)
    {
      if ( !lvar.is_param() )
        print_frame_item(info.actx, lvar.loc.stkoff(), lvar.c_str());
    }
  } printer;

  print_items(actx, frame, FS_LVARS, printer);
}

//-----------------------------------------------------------------------------
static void print_ra(asm_context_t &actx, const stack_frame_t &frame)
{
  struct ra_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(item_info_t &info, const symbol_t &ra)
    {
      print_frame_item(info.actx, info.sec.start, ra.loc.reg());
    }
  } printer;

  print_items(actx, frame, FS_RA, printer);
}

//-----------------------------------------------------------------------------
static void print_stktemps(asm_context_t &actx, const stack_frame_t &frame)
{
  struct stktemp_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(item_info_t &info, const symbol_t &stktemp)
    {
      print_frame_item(info.frame,
                       stktemp.loc.stkoff(),
                       "<stktemp %d>", stktemp.val());
    }
  } printer;

  print_items(atcx, frame, FS_STKTEMPS, printer);
}

//-----------------------------------------------------------------------------
static void print_stkargs(asm_context_t &actx, const stack_frame_t &frame)
{
  struct stkargs_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(item_info_t &info, const symbol_t &stkarg)
    {
      print_frame_item(info.frame,
                       stkarg.loc.stkoff(),
                       "<stkarg %d>", stkarg.val());
    }
  } printer;

  print_items(actx, frame, FS_STKARGS, printer);
}

//-----------------------------------------------------------------------------
void asm_context_t::print_stack_frame(const stack_frame_t &frame)
{
  out(TAB0, "\n");
  tablevel = TAB1;
  cmtout(" %s\n", SEPARATOR);

  print_params(*this, frame);
  print_pseudo_section(FS_PADDING2, "<padding>");
  print_lvars(*this, frame);
  print_pseudo_section(FS_PADDING1, "<padding>");
  print_ra(*this, frame);
  print_stktemps(*this, frame);
  print_svregs(*this, frame);
  print_stkargs(*this, frame);
  print_pseudo_section(FS_REGARGS, "<minimum 4 arg slots>");
}

//-----------------------------------------------------------------------------
#define REQUIRE_REG_DEST 0x1
#define REQUIRE_REG_SRC1 0x2
#define REQUIRE_REG_SRC2 0x4

//-----------------------------------------------------------------------------
static void ensure_compatible_operands(asm_ctx_t &ctx, codenode_t *node, uint32_t flags)
{
  symref_t dest = node->dest;
  symref_t src1 = node->src1;
  symref_t src2 = node->src2;

  if ( (flags & REQUIRE_REG_SRC1) != 0 && !src1->loc.is_reg() )
  {
    if ( src1->loc.is_stkoff() )
      ctx.out(TAB1"lw %s, %d($sp)\n", ctx.t7->loc.reg(), src1->loc.stkoff());
    else
      ctx.out(TAB1"lw %s, %s\n", ctx.t7->loc.reg(), src1->c_str());

    node->src1 = ctx.t7;
  }

  if ( (flags & REQUIRE_REG_SRC2) != 0 && !src2->loc.is_reg() )
  {
    if ( src2->loc.is_stkoff() )
      ctx.out(TAB1"lw %s, %d($sp)\n", ctx.t8->loc.reg(), src2->loc.stkoff());
    else
      ctx.out(TAB1"lw %s, %s\n", ctx.t8->loc.reg(), src2->c_str());

    node->src2 = ctx.t8;
  }

  if ( (flags & REQUIRE_REG_DEST) != 0 && !dest->loc.is_reg() )
  {
    symref_t olddest = node->dest;
    node->dest = ctx.t9;
    codenode_t *store = new codenode_t(CNT_SW, olddest, ctx.t9, NULLREF);
    codenode_t *oldnext = node->next;
    node->next = store;
    store->next = oldnext;
  }
}

//-----------------------------------------------------------------------------
static const char *cnt2instr(codenode_type_t type)
{
  switch ( type )
  {
    case CNT_ADD:  return "addu";
    case CNT_SUB:  return "sub";
    case CNT_DIV:  return "div";
    case CNT_MUL:  return "mul";
    case CNT_AND:  return "and";
    case CNT_OR:   return "or";
    case CNT_SLT:  return "slt";
    case CNT_SGT:  return "sgt";
    case CNT_SLE:  return "sle";
    case CNT_SEQ:  return "seq";
    case CNT_SNE:  return "sne";
    case CNT_SGE:  return "sge";
    case CNT_XOR:  return "xor";
    case CNT_SLLV: return "sllv";
    case CNT_SRLV: return "srlv";
    default:
      INTERR(1089);
  }
}

//-----------------------------------------------------------------------------
static uint32_t get_operand_desc(codenode_type_t type)
{
  switch ( type )
  {
    case CNT_LI:
    case CNT_LEA:
    case CNT_LB:
    case CNT_LW:
      return REQUIRE_REG_DEST;
    case CNT_MOV:
    case CNT_SB:
    case CNT_SW:
    case CNT_CNDJMP:
      return REQUIRE_REG_SRC1;
    case CNT_ADD:
    case CNT_SUB:
    case CNT_DIV:
    case CNT_MUL:
    case CNT_AND:
    case CNT_OR:
    case CNT_SLT:
    case CNT_SGT:
    case CNT_SLE:
    case CNT_SEQ:
    case CNT_SNE:
    case CNT_SGE:
    case CNT_SLLV:
    case CNT_SRLV:
      return REQUIRE_REG_DEST | REQUIRE_REG_SRC1 | REQUIRE_REG_SRC2;
    case CNT_SLL:
    case CNT_XOR:
    case CNT_NOT:
      return REQUIRE_REG_DEST | REQUIRE_REG_SRC1;
    default:
      break;
  }
  return 0;
}

//-----------------------------------------------------------------------------
static void gen_builtin_function(asm_ctx_t &ctx, const char *name, int syscall)
{
  ctx.out("\n%s:\n"
          TAB1"li $v0, %d\n"
          TAB1"syscall\n"
          TAB1"jr $ra\n", name, syscall);
}

//-----------------------------------------------------------------------------
static void init_resources(ir_func_t &f)
{
  symvec_t temps;
  f.get_used_resources(ST_TEMP, temps);

  for ( symvec_t::iterator i = temps.begin(); i != temps.end(); i++ )
  {
    symbol_t &temp = **i;
    temp.loc.set_reg(tempreg_names[temp.val()]);
  }

  symref_t retval = f.gen_resource(ST_RETVAL);
  retval->loc.set_reg("$v0");

  symref_t zero = f.gen_resource(ST_ZERO);
  zero->loc.set_reg("$zero");
}

//-----------------------------------------------------------------------------
static void gen_text_section(asm_ctx_t &ctx, ir_funcs_t &funcs)
{
  ctx.out(".text\n");

  for ( ir_funcs_t::iterator i = funcs.begin(); i != funcs.end(); i++ )
  {
    ir_func_t &f = **i;
    init_resources(f);

    ctx.out("\n%s:\n", f.sym()->c_str());

    stack_frame_t frame(f, ctx);
    LOG_FRAME_SUMMARY(frame);

    frame.gen_prologue();
    gen_func_body(ctx, f.code(), frame.epilogue_lbl);
    frame.gen_epilogue();
  }

  gen_builtin_function(ctx, "_"BI_PRINT_STRING, 4);
  gen_builtin_function(ctx, "_"BI_PRINT_INT,    1);
  gen_builtin_function(ctx, "_"BI_PRINT_CHAR,  11);
  gen_builtin_function(ctx, "_"BI_PRINT_HEX,   34);
  gen_builtin_function(ctx, EXIT, 10);
}

///-----------------------------------------------------------------------------
static bool prepare_named_symbol(asm_ctx_t &ctx, symref_t sym, const char *fmt, ...)
{
  // 'main' must remain as is - i.e. no autogenerated name
  if ( !sym->is_main() )
  {
    va_list va;
    va_start(va, fmt);

    // TODO: must get rid of this limitation
    char buf[MAXSTR];
    vsnprintf(buf, MAXNAMELEN, fmt, va);

    va_end(va);

    sym->set_name(buf);
    if ( ctx.gsyms.get(sym->name()) != NULL )
      return false;
  }

  sym->loc.set_global();
  ctx.gsyms.insert(sym);

  return true;
}

//-----------------------------------------------------------------------------
template<class T> static void gen_asm_names(
    asm_ctx_t &ctx,
    T &syms,
    const char *pfx,
    bool make_dummy_names = false)
{
  size_t counter = 0;
  for ( typename T::iterator i = syms.begin(); i != syms.end(); i++ )
  {
    symref_t sym = *i;
    if ( make_dummy_names )
      while ( !prepare_named_symbol(ctx, sym, "%s%lu", pfx, counter++) );
    else
      prepare_named_symbol(ctx, sym, "%s%s", pfx, sym->c_str());
  }
}

//-----------------------------------------------------------------------------
static void gen_func_body(asm_ctx_t &ctx, codenode_t *code, symref_t epilogue)
{
  for ( code_iterator_t ci(code); *ci != NULL; ci++ )
  {
    codenode_t *node = *ci;

    ensure_compatible_operands(ctx, node, get_operand_desc(node->type));

    symref_t dest = node->dest;
    symref_t src1 = node->src1;
    symref_t src2 = node->src2;

    switch ( node->type )
    {
      case CNT_LI:
        {
          switch ( src1->type() )
          {
            case ST_INTCON:
              ctx.out(TAB1"li %s, %d\n", dest->loc.reg(), src1->val());
              break;
            case ST_CHARCON:
              ctx.out(TAB1"li %s, %s\n", dest->loc.reg(), src1->str());
              break;
            default:
              INTERR(1090);
          }
        }
        break;
      case CNT_MOV:
        {
          switch ( dest->loc.type() )
          {
            case SLT_GLOBAL:
              ctx.out(TAB1"sw %s, %s\n", src1->loc.reg(), dest->c_str());
              break;
            case SLT_STKOFF:
              ctx.out(TAB1"sw %s, %d($sp)\n", src1->loc.reg(), dest->loc.stkoff());
              break;
            case SLT_REG:
              ctx.out(TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
              break;
            default:
              INTERR(1091);
          }
        }
        break;
      case CNT_LEA:
        {
          switch ( src1->loc.type() )
          {
            case SLT_GLOBAL:
              ctx.out(TAB1"la %s, %s\n", dest->loc.reg(), src1->c_str());
              break;
            case SLT_STKOFF:
              if ( src1->is_param() )
                ctx.out(TAB1"lw %s, %d($sp)\n", dest->loc.reg(), src1->loc.stkoff());
              else
                ctx.out(TAB1"la %s, %d($sp)\n", dest->loc.reg(), src1->loc.stkoff());
              break;
            case SLT_REG:
              ctx.out(TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
              break;
            default:
              INTERR(1092);
          }
        }
        break;
      case CNT_SB:
      case CNT_SW:
        {
          const char *store = node->type == CNT_SB ? "sb" : "sw";

          switch ( dest->loc.type() )
          {
            case SLT_GLOBAL:
              ctx.out(TAB1"%s %s, %s\n", store, src1->loc.reg(), dest->c_str());
              break;
            case SLT_STKOFF:
              ctx.out(TAB1"%s %s, %d($sp)\n", store, src1->loc.reg(), dest->loc.stkoff());
              break;
            case SLT_REG:
              if ( dest->is_param() )
                ctx.out(TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
              else
                ctx.out(TAB1"%s %s, (%s)\n", store, src1->loc.reg(), dest->loc.reg());
              break;
            default:
              INTERR(1093);
          }
        }
        break;
      case CNT_LB:
      case CNT_LW:
        {
          const char *load = node->type == CNT_LB ? "lb" : "lw";

          switch ( src1->loc.type() )
          {
            case SLT_GLOBAL:
              ctx.out(TAB1"%s %s, %s\n", load, dest->loc.reg(), src1->c_str());
              break;
            case SLT_STKOFF:
              ctx.out(TAB1"%s %s, %d($sp)\n", load, dest->loc.reg(), src1->loc.stkoff());
              break;
            case SLT_REG:
              if ( src1->is_param() )
                ctx.out(TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
              else
                ctx.out(TAB1"%s %s, (%s)\n", load, dest->loc.reg(), src1->loc.reg());
              break;
            default:
              INTERR(1094);
          }
        }
        break;
      case CNT_ARG:
        {
          switch ( dest->loc.type() )
          {
            case SLT_REG:
              {
                switch ( src1->loc.type() )
                {
                  case SLT_STKOFF:
                    ctx.out(TAB1"lw %s, %d($sp)\n", dest->loc.reg(), src1->loc.stkoff());
                    break;
                  case SLT_REG:
                    ctx.out(TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
                    break;
                  default:
                    INTERR(1095);
                }
              }
              break;
            case SLT_STKOFF:
              {
                switch ( src1->loc.type() )
                {
                  case SLT_STKOFF:
                    ensure_compatible_operands(ctx, node, REQUIRE_REG_SRC1);
                    src1 = node->src1;
                  case SLT_REG:
                    ctx.out(TAB1"sw %s, %d($sp)\n", src1->loc.reg(), dest->loc.stkoff());
                    break;
                  default:
                    INTERR(1096);
                }
              }
              break;
            default:
              INTERR(1097);
          }
        }
        break;
      case CNT_RET:
        {
          if ( dest != NULL )
          {
            switch ( src1->loc.type() )
            {
              case SLT_GLOBAL:
                ctx.out(TAB1"lw %s, %s\n", dest->loc.reg(), src1->c_str());
                break;
              case SLT_STKOFF:
                ctx.out(TAB1"lw %s, %d($sp)\n", dest->loc.reg(), src1->loc.stkoff());
                break;
              case SLT_REG:
                ctx.out(TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
                break;
              default:
                INTERR(1098);
            }
          }

          ctx.out(TAB1"j %s\n", epilogue->c_str());
        }
        break;
      case CNT_SLL:
      case CNT_XOR:
        {
          const char *instr = node->type == CNT_SLL ? "sll" : "xor";

          switch ( src2->type() )
          {
            case ST_INTCON:
              ctx.out(TAB1"%s %s, %s, %d\n",
                      instr, dest->loc.reg(), src1->loc.reg(), src2->val());
              break;
            case ST_TEMP:
              ASSERT(0, node->type != CNT_SLL);
              ctx.out(TAB1"%s %s, %s, %s\n",
                      instr, dest->loc.reg(), src1->loc.reg(), src2->loc.reg());
              break;
            default:
              INTERR(0);
          }
        }
        break;
      case CNT_ADD:
      case CNT_SUB:
      case CNT_DIV:
      case CNT_MUL:
      case CNT_AND:
      case CNT_OR:
      case CNT_SLT:
      case CNT_SGT:
      case CNT_SLE:
      case CNT_SEQ:
      case CNT_SNE:
      case CNT_SGE:
      case CNT_SLLV:
      case CNT_SRLV:
        ctx.out(TAB1"%s %s, %s, %s\n",
                cnt2instr(node->type), dest->loc.reg(), src1->loc.reg(), src2->loc.reg());
        break;
      case CNT_CNDJMP:
        ctx.out(TAB1"beq %s, $zero, %s\n", src1->loc.reg(), dest->c_str());
        break;
      case CNT_NOT:
        ctx.out(TAB1"not %s, %s\n", dest->loc.reg(), src1->loc.reg());
        break;
      case CNT_CALL:
        ctx.out(TAB1"jal %s\n", node->src1->c_str());
        break;
      case CNT_LABEL:
        ctx.out("%s:\n", node->src1->c_str());
        break;
      case CNT_JUMP:
        ctx.out(TAB1"j %s\n", node->dest->c_str());
        break;
      default:
        continue;
    }
  }
}

//-----------------------------------------------------------------------------
static void gen_data_section(asm_ctx_t &ctx)
{
  ctx.out("\n.data\n\n");

  for ( symtab_t::const_iterator i = ctx.gsyms.begin(); i != ctx.gsyms.end(); i++ )
  {
    const symbol_t &sym = **i;

    if ( sym.type() == ST_FUNCTION || sym.type() == ST_LABEL )
      continue;

    ctx.out(TAB1"%s:\n", sym.c_str());

    switch ( sym.type() )
    {
      case ST_PRIMITIVE:
        if ( sym.base() == PRIM_INT )
          ctx.out(TAB2".space %d\n", WORDSIZE);
        else
          ctx.out(TAB2".space 1\n"
                  TAB2".align 2\n");
        break;
      case ST_ARRAY:
        if ( sym.base() == PRIM_INT )
          ctx.out(TAB2".space %d\n", sym.size() * WORDSIZE);
        else
          ctx.out(TAB2".space %d\n"
                  TAB2".align 2\n",  sym.size());
        break;
      case ST_STRCON:
        ctx.out(  TAB2".asciiz %s\n"
                  TAB2".align 2\n",  sym.str());
        break;
      default:
        INTERR(1085);
    }

    ctx.out("\n");
  }
}

//-----------------------------------------------------------------------------
static void init_gsyms(asm_ctx_t &ctx, ir_t &ir)
{
  gen_asm_names<symtab_t>(ctx, ir.gsyms,   "_");
  gen_asm_names<strtab_t>(ctx, ir.strings, "_str", true);
  gen_asm_names<symvec_t>(ctx, ir.labels,  "_L",   true);

  ir.gsyms.clear();
  ir.strings.clear();
  ir.labels.clear();
}

//-----------------------------------------------------------------------------
void generate_mips_asm(asm_context_t &actx, ir_t &ir)
{
  actx.init_named_symbols(ir);
  actx.gen_data_section();
  actx.gen_text_section(ir.funcs);
}
