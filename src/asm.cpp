#include "asm.h"

//-----------------------------------------------------------------------------
static const char *tempreg_names[TEMPREGQTY] =
  { "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6" };

static const char *svreg_names[SVREGQTY] =
  { "$s0", "$s1", "$s2", "$s3", "$s4", "$s5", "$s6", "$s7" };

static const char *argreg_names[ARGREGQTY] =
  { "$a0", "$a1", "$a2", "$a3" };

//-----------------------------------------------------------------------------
asm_ctx_t::asm_ctx_t(FILE *_outfile) :
    outfile(_outfile),
    t7(new symbol_t(ST_TEMP)),
    t8(new symbol_t(ST_TEMP)),
    t9(new symbol_t(ST_TEMP))
{
  t7->loc.set_reg("$t7");
  t8->loc.set_reg("$t8");
  t9->loc.set_reg("$t9");
}

//-----------------------------------------------------------------------------
void asm_ctx_t::print(const char *fmt, ...)
{
  va_list va;
  va_start(va, fmt);
  vfprintf(outfile, fmt, va);
  va_end(va);
}

//-----------------------------------------------------------------------------
static bool prepare_named_symbol(asm_ctx_t &ctx, symref_t sym, const char *fmt, ...)
{
  // 'main' must remain as is - i.e. no autogenerated name
  if ( !sym->is_main() && !sym->is_extern() )
  {
    va_list va;
    va_start(va, fmt);

    char buf[MAXSTR];
    vsnprintf(buf, sizeof(buf), fmt, va);

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
    {
      while ( !prepare_named_symbol(ctx, sym, "%s%lu", pfx, counter) )
        counter++;
    }
    else
    {
      prepare_named_symbol(ctx, sym, "%s%s", pfx, sym->c_str());
    }
  }
}

//-----------------------------------------------------------------------------
static void init_gsyms(asm_ctx_t &ctx, ir_t &ir)
{
  gen_asm_names<symtab_t>(ctx, ir.gsyms,   "_");
  gen_asm_names<symtab_t>(ctx, ir.strings, "_str", true);
  gen_asm_names<symvec_t>(ctx, ir.labels,  "_L",   true);

  ir.gsyms.clear();
  ir.strings.clear();
  ir.labels.clear();
}

//-----------------------------------------------------------------------------
static void gen_data_section(asm_ctx_t &ctx)
{
  ctx.print("\n.data\n\n");

  for ( symtab_t::const_iterator i = ctx.gsyms.begin(); i != ctx.gsyms.end(); i++ )
  {
    const symbol_t &sym = **i;

    if ( sym.type() == ST_FUNCTION || sym.type() == ST_LABEL )
      continue;

    ctx.print(TAB1"%s:\n", sym.c_str());

    switch ( sym.type() )
    {
      case ST_PRIMITIVE:
        if ( sym.base() == PRIM_INT )
          ctx.print(TAB2".space %d\n", WORDSIZE);
        else
          ctx.print(TAB2".space 1\n"
                    TAB2".align 2\n");
        break;
      case ST_ARRAY:
        if ( sym.base() == PRIM_INT )
          ctx.print(TAB2".space %d\n", sym.size() * WORDSIZE);
        else
          ctx.print(TAB2".space %d\n"
                    TAB2".align 2\n",  sym.size());
        break;
      case ST_STRCON:
        ctx.print(  TAB2".asciiz %s\n"
                    TAB2".align 2\n",  sym.str());
        break;
      default:
        INTERR(1085);
    }

    ctx.print("\n");
  }
}

//-----------------------------------------------------------------------------
void frame_section_t::visit_items(
    asm_ctx_t &ctx,
    frame_item_visitor_t &fiv) const
{
  for ( size_t i = 0; i < items.size(); i++ )
  {
    item_info_t info;

    info.ctx = &ctx;
    info.sec = *this;
    info.idx = (fiv.flags & FIV_REVERSE) == 0 ? i : (items.size()-1) - i;

    fiv.visit_item(info, *items[info.idx]);
  }
}

//-----------------------------------------------------------------------------
void frame_section_t::build_items(
    asm_ctx_t &ctx,
    frame_item_builder_t &fib)
{
  for ( size_t i = 0; i < items.size(); i++ )
  {
    frame_mods_t mods;

    mods.ctx = &ctx;
    mods.sec = *this;
    mods.idx = i;
    mods.delta = BADOFFSET;

    fib.build_item(mods, *items[i]);

    if ( mods.delta != BADOFFSET )
      end += mods.delta;
  }
}

//-----------------------------------------------------------------------------
#define INIT_FRAME_SECTION(name, idx, symbols)                     \
  frame_section_t &name = frame.sections[idx];                     \
  name.init(symbols);                                              \
  name.start = name.end = idx > 0 ? frame.sections[idx-1].end : 0; \

//-----------------------------------------------------------------------------
static void build_regargs(asm_ctx_t &ctx, stack_frame_t &frame)
{
  INIT_FRAME_SECTION(regargs, FS_REGARGS, *frame.f.get(ST_REGARG));

  if ( frame.f.has_call )
    regargs.end = ARGREGQTY * WORDSIZE;

  struct regargs_builder_t : public frame_item_builder_t
  {
    virtual void build_item(frame_mods_t &, symbol_t &arg)
    {
      arg.loc.set_reg(argreg_names[arg.val()]);
    }
  } b;

  regargs.build_items(ctx, b);
}

//-----------------------------------------------------------------------------
static void build_stkargs(asm_ctx_t &ctx, stack_frame_t &frame)
{
  INIT_FRAME_SECTION(stkargs, FS_STKARGS, *frame.f.get(ST_STKARG));

  struct stkargs_builder_t : public frame_item_builder_t
  {
    virtual void build_item(frame_mods_t &mods, symbol_t &stkarg)
    {
      stkarg.loc.set_stkoff(mods.sec.end);
      mods.delta = WORDSIZE;
    }
  } b;

  stkargs.build_items(ctx, b);
}

//-----------------------------------------------------------------------------
static void build_svregs(asm_ctx_t &ctx, stack_frame_t &frame)
{
  INIT_FRAME_SECTION(svregs, FS_SVREGS, *frame.f.get(ST_SVTEMP));

  struct svregs_builder_t : public frame_item_builder_t
  {
    virtual void build_item(frame_mods_t &mods, symbol_t &svreg)
    {
      svreg.loc.set_reg(svreg_names[svreg.val()]);
      mods.delta = WORDSIZE;
    }
  } b;

  svregs.build_items(ctx, b);
}

//-----------------------------------------------------------------------------
static void build_stktemps(asm_ctx_t &ctx, stack_frame_t &frame)
{
  INIT_FRAME_SECTION(stktemps, FS_STKTEMPS, *frame.f.get(ST_STKTEMP));

  struct stktemps_builder_t : public frame_item_builder_t
  {
    virtual void build_item(frame_mods_t &mods, symbol_t &stktemp)
    {
      stktemp.loc.set_stkoff(mods.sec.end);
      mods.delta = WORDSIZE;
    }
  } b;

  stktemps.build_items(ctx, b);
};

//-----------------------------------------------------------------------------
static void build_ra(asm_ctx_t &ctx, stack_frame_t &frame)
{
  INIT_FRAME_SECTION(ra, FS_RA, *frame.f.get(ST_RETADDR));

  struct ra_builder_t : public frame_item_builder_t
  {
    virtual void build_item(frame_mods_t &mods, symbol_t &ra)
    {
      ra.loc.set_reg("$ra");
      mods.delta = WORDSIZE;
    }
  } b;

  ra.build_items(ctx, b);
}

//-----------------------------------------------------------------------------
static void build_padding_section(stack_frame_t &frame, int idx)
{
  ASSERT(0, idx > 0);
  frame_section_t &padding = frame.sections[idx];
  padding.start = frame.sections[idx-1].end;
  padding.end   = ALIGN(padding.start, DWORDSIZE);
}

//-----------------------------------------------------------------------------
static void build_lvars(asm_ctx_t &ctx, stack_frame_t &frame)
{
  INIT_FRAME_SECTION(lvars, FS_LVARS, *frame.f.sym->symbols());

  struct lvars_builder_t : public frame_item_builder_t
  {
    virtual void build_item(frame_mods_t &mods, symbol_t &lvar)
    {
      if ( lvar.is_param() )
        return;

      lvar.loc.set_stkoff(mods.sec.end);

      switch ( lvar.type() )
      {
        case ST_PRIMITIVE:
          mods.delta = lvar.base() == PRIM_INT ? WORDSIZE : 1;
          break;
        case ST_ARRAY:
          mods.delta = lvar.base() == PRIM_INT
                     ? WORDSIZE * lvar.size()
                     : lvar.size();
          break;
        default:
          INTERR(1086);
      }

      mods.delta = ALIGN(mods.delta, WORDSIZE); // align to word boundary
    }
  } b;

  lvars.build_items(ctx, b);
}

//-----------------------------------------------------------------------------
static void build_params(asm_ctx_t &ctx, stack_frame_t &frame)
{
  INIT_FRAME_SECTION(params, FS_PARAMS, *frame.f.sym->params());

  struct params_builder_t : public frame_item_builder_t
  {
    uint32_t nregargs;

    virtual void build_item(frame_mods_t &mods, symbol_t &param)
    {
      if ( mods.idx < ARGREGQTY && mods.idx >= nregargs )
        param.loc.set_reg(argreg_names[mods.idx]);
      else
        param.loc.set_stkoff(mods.sec.end);

      mods.delta = WORDSIZE;
    }
  } b;

  b.nregargs = frame.sections[FS_REGARGS].nitems();
  params.build_items(ctx, b);
}

//-----------------------------------------------------------------------------
stack_frame_t::stack_frame_t(const ir_func_t &_f, asm_ctx_t &_ctx)
  : f(_f), ctx(_ctx), epilogue_lbl(new symbol_t(ST_LABEL))
{
  prepare_named_symbol(ctx, epilogue_lbl, "%s%s", "__leave", f.sym->c_str());

#define BUILD(sec)   build_##sec(ctx, *this)
#define BUILD_P(idx) build_padding_section(*this, idx)
  BUILD(regargs);
  BUILD(stkargs);
  BUILD(svregs);
  BUILD(stktemps);
  BUILD(ra);
  BUILD_P(FS_PADDING1);
  BUILD(lvars);
  BUILD_P(FS_PADDING2);
  BUILD(params);
#undef BUILD
#undef BUILD_P
}

//-----------------------------------------------------------------------------
struct reg_saver_t : public frame_item_visitor_t
{
  offset_t base;
  const char *cmd;

  virtual void visit_item(const item_info_t &info, const symbol_t &item)
  {
    info.ctx->print(
        TAB1"%s %s, %d($sp)\n",
        cmd,
        item.loc.reg(),
        base + info.idx * WORDSIZE);
  }
};

//-----------------------------------------------------------------------------
void stack_frame_t::gen_prologue()
{
  if ( size() > 0 )
    ctx.print(TAB1"la $sp, -%u($sp)\n", size());

#define SAVE(sec, base_sec)            \
do                                     \
{                                      \
  reg_saver_t s;                       \
  s.base = sections[base_sec].start;   \
  s.cmd = "sw";                        \
  sections[sec].visit_items(ctx, s);   \
} while ( false )

  SAVE(FS_SVREGS,  FS_SVREGS);
  SAVE(FS_RA,      FS_RA);
  SAVE(FS_REGARGS, FS_PARAMS);

#undef SAVE

  ctx.print("\n");
}

//-----------------------------------------------------------------------------
void stack_frame_t::gen_epilogue()
{
  ctx.print("\n%s:\n", epilogue_lbl->c_str());

#define RESTORE(sec, base_sec)                    \
do                                                \
{                                                 \
  reg_saver_t s;                                  \
  s.flags |= FIV_REVERSE;                         \
  s.base = sections[base_sec].start;              \
  s.cmd = "lw";                                   \
  sections[sec].visit_items(ctx, s);              \
} while ( false )

  RESTORE(FS_REGARGS, FS_PARAMS);
  RESTORE(FS_RA,      FS_RA);
  RESTORE(FS_SVREGS,  FS_SVREGS);

#undef RESTORE

  if ( size() > 0 )
    ctx.print(TAB1"la $sp, %u($sp)\n", size());

  // MARS, for some utterly moronic reason, does not call main. we must manually exit
  if ( f.sym->is_main() )
    ctx.print(TAB1"jal %s\n", BI_EXIT);
  else
    ctx.print(TAB1"jr $ra\n");
}

//-----------------------------------------------------------------------------
#define REQUIRE_REG_DEST 0x1
#define REQUIRE_REG_SRC1 0x2
#define REQUIRE_REG_SRC2 0x4

#define REQUIRES_SWAP(flag, sym) ((flags & flag) != 0 && !sym->loc.is_reg())

//-----------------------------------------------------------------------------
static bool maybe_swap_source_operand(
    asm_ctx_t &ctx,
    uint32_t flags,
    uint32_t flag,
    codenode_t *node,
    symref_t swap_out,
    symref_t swap_in)
{
  if ( REQUIRES_SWAP(flag, swap_out) )
  {
    switch ( swap_out->loc.type() )
    {
      case SLT_STKOFF:
        ctx.print(TAB1"lw %s, %d($sp)\n", swap_in->loc.reg(), swap_out->loc.stkoff());
        break;
      case SLT_GLOBAL:
        ctx.print(TAB1"lw %s, %s\n", swap_in->loc.reg(), swap_out->c_str());
        break;
      default:
        INTERR(0); // registers should always be compatible
    }
    return true;
  }
  return false;
}

//-----------------------------------------------------------------------------
static void ensure_compatible_operands(asm_ctx_t &ctx, codenode_t *node, uint32_t flags)
{
  symref_t dest = node->dest;
  symref_t src1 = node->src1;
  symref_t src2 = node->src2;

  if ( maybe_swap_source_operand(ctx, flags, REQUIRE_REG_SRC1, node, src1, ctx.t7) )
    node->src1 = ctx.t7;

  if ( maybe_swap_source_operand(ctx, flags, REQUIRE_REG_SRC2, node, src2, ctx.t8) )
    node->src2 = ctx.t8;

  if ( REQUIRES_SWAP(REQUIRE_REG_DEST, dest) )
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
              ctx.print(TAB1"li %s, %d\n", dest->loc.reg(), src1->val());
              break;
            case ST_CHARCON:
              ctx.print(TAB1"li %s, %s\n", dest->loc.reg(), src1->str());
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
              ctx.print(TAB1"sw %s, %s\n", src1->loc.reg(), dest->c_str());
              break;
            case SLT_STKOFF:
              ctx.print(TAB1"sw %s, %d($sp)\n", src1->loc.reg(), dest->loc.stkoff());
              break;
            case SLT_REG:
              ctx.print(TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
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
              ctx.print(TAB1"la %s, %s\n", dest->loc.reg(), src1->c_str());
              break;
            case SLT_STKOFF:
              if ( src1->is_param() )
                ctx.print(TAB1"lw %s, %d($sp)\n", dest->loc.reg(), src1->loc.stkoff());
              else
                ctx.print(TAB1"la %s, %d($sp)\n", dest->loc.reg(), src1->loc.stkoff());
              break;
            case SLT_REG:
              ctx.print(TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
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
              ctx.print(TAB1"%s %s, %s\n", store, src1->loc.reg(), dest->c_str());
              break;
            case SLT_STKOFF:
              ctx.print(TAB1"%s %s, %d($sp)\n", store, src1->loc.reg(), dest->loc.stkoff());
              break;
            case SLT_REG:
              if ( dest->is_param() )
                ctx.print(TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
              else
                ctx.print(TAB1"%s %s, (%s)\n", store, src1->loc.reg(), dest->loc.reg());
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
              ctx.print(TAB1"%s %s, %s\n", load, dest->loc.reg(), src1->c_str());
              break;
            case SLT_STKOFF:
              ctx.print(TAB1"%s %s, %d($sp)\n", load, dest->loc.reg(), src1->loc.stkoff());
              break;
            case SLT_REG:
              if ( src1->is_param() )
                ctx.print(TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
              else
                ctx.print(TAB1"%s %s, (%s)\n", load, dest->loc.reg(), src1->loc.reg());
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
                    ctx.print(TAB1"lw %s, %d($sp)\n", dest->loc.reg(), src1->loc.stkoff());
                    break;
                  case SLT_REG:
                    ctx.print(TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
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
                    ctx.print(TAB1"sw %s, %d($sp)\n", src1->loc.reg(), dest->loc.stkoff());
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
                ctx.print(TAB1"lw %s, %s\n", dest->loc.reg(), src1->c_str());
                break;
              case SLT_STKOFF:
                ctx.print(TAB1"lw %s, %d($sp)\n", dest->loc.reg(), src1->loc.stkoff());
                break;
              case SLT_REG:
                ctx.print(TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
                break;
              default:
                INTERR(1098);
            }
          }

          ctx.print(TAB1"j %s\n", epilogue->c_str());
        }
        break;
      case CNT_SLL:
      case CNT_XOR:
        {
          const char *instr = node->type == CNT_SLL ? "sll" : "xor";

          switch ( src2->type() )
          {
            case ST_INTCON:
              ctx.print(TAB1"%s %s, %s, %d\n",
                        instr, dest->loc.reg(), src1->loc.reg(), src2->val());
              break;
            case ST_TEMP:
              ASSERT(0, node->type != CNT_SLL);
              ctx.print(TAB1"%s %s, %s, %s\n",
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
        ctx.print(TAB1"%s %s, %s, %s\n",
                  cnt2instr(node->type), dest->loc.reg(), src1->loc.reg(), src2->loc.reg());
        break;
      case CNT_CNDJMP:
        ctx.print(TAB1"beq %s, $zero, %s\n", src1->loc.reg(), dest->c_str());
        break;
      case CNT_NOT:
        ctx.print(TAB1"not %s, %s\n", dest->loc.reg(), src1->loc.reg());
        break;
      case CNT_CALL:
        ctx.print(TAB1"jal %s\n", node->src1->c_str());
        break;
      case CNT_LABEL:
        ctx.print("%s:\n", node->src1->c_str());
        break;
      case CNT_JUMP:
        ctx.print(TAB1"j %s\n", node->dest->c_str());
        break;
      default:
        continue;
    }
  }
}

#define SEPARATOR "|--------------------------------|"

//-----------------------------------------------------------------------------
static void vprint_frame_item(
    asm_ctx_t &ctx,
    offset_t off,
    offset_t framesize,
    const char *fmt,
    va_list va)
{
#define ITEMCHARS 32 // for readability, limit items to 32 chars when printing
  char namestr[ITEMCHARS+1];
  vsnprintf(namestr, sizeof(namestr), fmt, va);
  int namelen = strlen(namestr);

  char item[ITEMCHARS+1];
  char *ptr = item;
  const char *const end = item + ITEMCHARS;

  // center the name within the ITEMCHARS spaces we have allocated for it
  APPCHAR(ptr, end, ' ', (ITEMCHARS-namelen)/2);
  APPSTR (ptr, end, namestr, namelen);
  APPCHAR(ptr, end, ' ', end-ptr);
  APPZERO(ptr, end+1);

  ctx.print(TAB1"# |%s|\n"TAB1"# "SEPARATOR" sp+%d%s\n",
            item,
            off,
            off == framesize ? "  <-- start of caller's frame" : "");
}

//-----------------------------------------------------------------------------
static void print_frame_item(
    asm_ctx_t &ctx,
    offset_t off,
    offset_t framesize,
    const char *fmt,
    ...)
{
  va_list va;
  va_start(va, fmt);
  vprint_frame_item(ctx, off, framesize, fmt, va);
  va_end(va);
}

//-----------------------------------------------------------------------------
static void print_pseudo_section(
    asm_ctx_t &ctx,
    const stack_frame_t &frame,
    int sectionid,
    const char *label)
{
  const frame_section_t &sec = frame.sections[sectionid];

  if ( sec.is_valid() )
    print_frame_item(ctx, sec.start, frame.size(), label);
}

//-----------------------------------------------------------------------------
void frame_item_printer_t::print_frame_item(
    asm_ctx_t &ctx,
    offset_t off,
    const char *fmt,
    ...)
{
  va_list va;
  va_start(va, fmt);
  vprint_frame_item(ctx, off, framesize, fmt, va);
  va_end(va);
}

//-----------------------------------------------------------------------------
static void print_items(
    asm_ctx_t &ctx,
    const stack_frame_t &frame,
    int sectionidx,
    frame_item_printer_t &fip)
{
  fip.framesize = frame.size();
  frame.sections[sectionidx].visit_items(ctx, fip);
}

//-----------------------------------------------------------------------------
static void print_saved_argregs(asm_ctx_t &ctx, const stack_frame_t &frame)
{
  // sometimes a function won't be passed an argument in an argument register, but still needs
  // to save the register value because the register will be used in this function.
  // we make note of this here.
  struct saved_argreg_printer_t : public frame_item_printer_t
  {
    const frame_section_t &params;
    saved_argreg_printer_t(const frame_section_t &s) : params(s) {}
    virtual void visit_item(const item_info_t &info, const symbol_t &argreg)
    {
      if ( argreg.val() >= params.nitems() )
        print_frame_item(*info.ctx, params.start + info.idx * WORDSIZE, "%s", argreg.loc.reg());
    }
  } p(frame.sections[FS_PARAMS]);

  print_items(ctx, frame, FS_REGARGS, p);
}

//-----------------------------------------------------------------------------
static void print_params(asm_ctx_t &ctx, const stack_frame_t &frame)
{
  struct param_printer_t : public frame_item_printer_t
  {
    virtual void visit_item(const item_info_t &info, const symbol_t &param)
    {
      if ( param.loc.is_stkoff() )
        print_frame_item(*info.ctx, param.loc.stkoff(), param.c_str());
      else
        print_frame_item(*info.ctx,
                         info.sec.start + info.idx * WORDSIZE,
                         "<%s is in %s>", param.c_str(), param.loc.reg());
    }
  } p;

  print_items(ctx, frame, FS_PARAMS, p);
}

//-----------------------------------------------------------------------------
static void print_lvars(asm_ctx_t &ctx, const stack_frame_t &frame)
{
  struct lvar_printer_t : public frame_item_printer_t
  {
    virtual void visit_item(const item_info_t &info, const symbol_t &lvar)
    {
      if ( !lvar.is_param() )
        print_frame_item(*info.ctx, lvar.loc.stkoff(), lvar.c_str());
    }
  } p;

  print_items(ctx, frame, FS_LVARS, p);
}

//-----------------------------------------------------------------------------
static void print_ra(asm_ctx_t &ctx, const stack_frame_t &frame)
{
  struct ra_printer_t : public frame_item_printer_t
  {
    virtual void visit_item(const item_info_t &info, const symbol_t &ra)
    {
      print_frame_item(*info.ctx, info.sec.start, ra.loc.reg());
    }
  } p;

  print_items(ctx, frame, FS_RA, p);
}

//-----------------------------------------------------------------------------
static void print_stktemps(asm_ctx_t &ctx, const stack_frame_t &frame)
{
  struct stktemp_printer_t : public frame_item_printer_t
  {
    virtual void visit_item(const item_info_t &info, const symbol_t &stktemp)
    {
      print_frame_item(*info.ctx,
                       stktemp.loc.stkoff(),
                       "<stktemp %d>", stktemp.val());
    }
  } p;

  print_items(ctx, frame, FS_STKTEMPS, p);
}

//-----------------------------------------------------------------------------
static void print_svregs(asm_ctx_t &ctx, const stack_frame_t &frame)
{
  struct svregs_printer_t : public frame_item_printer_t
  {
    virtual void visit_item(const item_info_t &info, const symbol_t &svreg)
    {
      print_frame_item(*info.ctx,
                       info.sec.start + info.idx * WORDSIZE,
                       svreg.loc.reg());
    }
  } p;

  print_items(ctx, frame, FS_SVREGS, p);
}


//-----------------------------------------------------------------------------
static void print_stkargs(asm_ctx_t &ctx, const stack_frame_t &frame)
{
  struct stkargs_printer_t : public frame_item_printer_t
  {
    virtual void visit_item(const item_info_t &info, const symbol_t &stkarg)
    {
      print_frame_item(*info.ctx,
                       stkarg.loc.stkoff(),
                       "<stkarg %d>", stkarg.val());
    }
  } p;

  print_items(ctx, frame, FS_STKARGS, p);
}

//-----------------------------------------------------------------------------
void stack_frame_t::print()
{
  ctx.print("\n"TAB1"# "SEPARATOR"\n");

#define PRINT(sec)          print_##sec(ctx, *this)
#define PRINT_P(idx, label) print_pseudo_section(ctx, *this, idx, label)
#define PLABEL "<padding>"

  PRINT(saved_argregs);
  PRINT(params);
  PRINT_P(FS_PADDING2, PLABEL);
  PRINT(lvars);
  PRINT_P(FS_PADDING1, PLABEL);
  PRINT(ra);
  PRINT(stktemps);
  PRINT(svregs);
  PRINT(stkargs);
  PRINT_P(FS_REGARGS, "<minimum 4 arg slots>");

#undef PRINT
#undef PRINT_P
#undef PLABEL
}

//-----------------------------------------------------------------------------
static void gen_builtin_functions(asm_ctx_t &ctx)
{
#define BIF(name, syscall)                  \
do                                          \
{                                           \
  ctx.print("\n%s:\n"                       \
            TAB1"li $v0, %d\n"              \
            TAB1"syscall\n"                 \
            TAB1"jr $ra\n", name, syscall); \
} while ( false );

  BIF(BI_PRINT_STRING, 4);
  BIF(BI_PRINT_INT,    1);
  BIF(BI_PRINT_CHAR,  11);
  BIF(BI_PRINT_HEX,   34);
  BIF(BI_EXIT,        10);

#undef BIF
}

//-----------------------------------------------------------------------------
static void init_genreg_names(ir_func_t &f)
{
  // the use of these registers does not affect the stack, so we go ahead
  // and name them all here. the other registers (saved regsters, $ra, etc)
  // are initialized when we build the stack_frame_t for this function.
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
  ctx.print(".text\n");

  for ( ir_funcs_t::iterator i = funcs.begin(); i != funcs.end(); i++ )
  {
    ir_func_t &f = **i;
    init_genreg_names(f);

    ctx.print("\n%s:\n", f.sym->c_str());

    stack_frame_t frame(f, ctx);
    frame.print();

    frame.gen_prologue();
    gen_func_body(ctx, f.code, frame.epilogue_lbl);
    frame.gen_epilogue();
  }

  gen_builtin_functions(ctx);
}

//-----------------------------------------------------------------------------
void generate_mips_asm(asm_ctx_t &ctx, ir_t &ir)
{
  init_gsyms(ctx, ir);
  gen_data_section(ctx);
  gen_text_section(ctx, ir.funcs);
}
