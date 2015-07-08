#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <asm.h>

#define MAXNAMELEN 32

//-----------------------------------------------------------------------------
static const char *tempreg_names[TEMPREGQTY] =
  { "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6" };

static const char *svreg_names[SVREGQTY] =
  { "$s0", "$s1", "$s2", "$s3", "$s4", "$s5", "$s6", "$s7" };

static const char *argreg_names[ARGREGQTY] =
  { "$a0", "$a1", "$a2", "$a3" };

#define RESERVED_TEMP1 "$t7"
#define RESERVED_TEMP2 "$t8"
#define RESERVED_TEMP3 "$t9"

//-----------------------------------------------------------------------------
item_info_t::item_info_t(
    stack_frame_t &_frame,
    frame_section_t &_sec,
    symbol_t &_sym,
    uint32_t _idx) : frame(_frame), sec(_sec), sym(_sym), idx(_idx)
{
}

//-----------------------------------------------------------------------------
asm_ctx_t::asm_ctx_t(FILE *_outfile) : outfile(_outfile)
{
  ASSERT(0, outfile);

  t7 = symref_t(new symbol_t(ST_TEMPORARY));
  t8 = symref_t(new symbol_t(ST_TEMPORARY));
  t9 = symref_t(new symbol_t(ST_TEMPORARY));

  t7->loc.set_reg(RESERVED_TEMP1);
  t8->loc.set_reg(RESERVED_TEMP2);
  t9->loc.set_reg(RESERVED_TEMP3);
}

//-----------------------------------------------------------------------------
void asm_ctx_t::out(const char *fmt, ...)
{
  va_list va;
  va_start(va, fmt);
  vfprintf(outfile, fmt, va);
  va_end(va);
}

//-----------------------------------------------------------------------------
static bool prepare_named_symbol(asm_ctx_t &ctx, symref_t sym, const char *fmt, ...)
{
  va_list va;
  va_start(va, fmt);

  // TODO: must get rid of this limitation
  char buf[MAXNAMELEN];
  vsnprintf(buf, MAXNAMELEN, fmt, va);

  va_end(va);

  sym->set_name(buf);
  if ( ctx.gsyms.get(sym->name()) != NULL )
    return false;

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
  // 'main' must remain as is - i.e. no auto-generated name
  symref_t main = ir.gsyms.get("main");
  ir.gsyms.erase(main);
  ctx.gsyms.insert(main);

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
void frame_section_t::visit_items(
    stack_frame_t &frame,
    frame_item_visitor_t &fiv,
    uint32_t flags)
{
  for ( size_t i = 0; i < items.size(); i++ )
  {
    size_t idx = (flags & FIV_REVERSE) == 0 ? i : items.size() - 1 - i;
    item_info_t info(frame, *this, *items[idx], idx);
    fiv.visit_item(info);
  }
}

//-----------------------------------------------------------------------------
void stack_frame_t::build_regargs_section()
{
  frame_section_t &regargs = sections[FS_REGARGS];

  regargs.init(f.regargs);

  if ( f.has_call )
    regargs.end = ARGREGQTY * WORDSIZE;

  struct regargs_builder_t : public frame_item_visitor_t
  {
    virtual void visit_item(item_info_t &info)
    {
      symbol_t &regarg = info.sym;
      regarg.loc.set_reg(argreg_names[regarg.val()]);
    }
  } b;

  regargs.visit_items(*this, b);
}

//-----------------------------------------------------------------------------
void stack_frame_t::build_stkargs_section()
{
  frame_section_t &stkargs = sections[FS_STKARGS];

  stkargs.init(f.stkargs);
  stkargs.start = stkargs.end = sections[FS_REGARGS].end;

  struct stkargs_builder_t : public frame_item_visitor_t
  {
    virtual void visit_item(item_info_t &info)
    {
      info.sym.loc.set_stkoff(info.sec.end);
      info.sec.end += WORDSIZE;
    }
  } b;

  stkargs.visit_items(*this, b);
}

//-----------------------------------------------------------------------------
void stack_frame_t::build_svregs_section()
{
  frame_section_t &svregs = sections[FS_SVREGS];

  svregs.init(f.svregs);
  svregs.start = svregs.end = sections[FS_STKARGS].end;

  struct svregs_builder_t : public frame_item_visitor_t
  {
    virtual void visit_item(item_info_t &info)
    {
      symbol_t &svreg = info.sym;
      svreg.loc.set_reg(svreg_names[svreg.val()]);
      info.sec.end += WORDSIZE;
    }
  } b;

  svregs.visit_items(*this, b);
}

//-----------------------------------------------------------------------------
void stack_frame_t::build_stktemps_section()
{
  frame_section_t &stktemps = sections[FS_STKTEMPS];

  stktemps.init(f.stktemps);
  stktemps.start = stktemps.end = sections[FS_SVREGS].end;

  struct stktemps_builder_t : public frame_item_visitor_t
  {
    virtual void visit_item(item_info_t &info)
    {
      info.sym.loc.set_stkoff(info.sec.end);
      info.sec.end += WORDSIZE;
    }
  } b;

  stktemps.visit_items(*this, b);
};

//-----------------------------------------------------------------------------
void stack_frame_t::build_ra_section()
{
  frame_section_t &ra = sections[FS_RA];

  ra.init(f.ra);
  ra.start = ra.end = sections[FS_STKTEMPS].end;

  struct ra_builder_t : public frame_item_visitor_t
  {
    virtual void visit_item(item_info_t &info)
    {
      info.sym.loc.set_reg("$ra");
      info.sec.end += WORDSIZE;
    }
  } b;

  ra.visit_items(*this, b);
}

//-----------------------------------------------------------------------------
void stack_frame_t::build_padding_section(int padid, int previd)
{
  frame_section_t &padding = sections[padid];

  padding.start = sections[previd].end;
  padding.end   = ALIGN(padding.start, DWORDSIZE);
}

//-----------------------------------------------------------------------------
void stack_frame_t::build_lvars_section()
{
  frame_section_t &lvars = sections[FS_LVARS];

  lvars.init(*f.sym->symbols());
  lvars.start = lvars.end = sections[FS_PADDING1].end;

  struct lvars_builder_t : public frame_item_visitor_t
  {
    virtual void visit_item(item_info_t &info)
    {
      symbol_t &lvar = info.sym;
      frame_section_t &sec = info.sec;

      if ( lvar.is_param() )
        return;

      lvar.loc.set_stkoff(sec.end);

      switch ( lvar.type() )
      {
        case ST_PRIMITIVE:
          sec.end += lvar.base() == PRIM_INT ? WORDSIZE : 1;
          break;
        case ST_ARRAY:
          sec.end += lvar.base() == PRIM_INT
                   ? WORDSIZE * lvar.size()
                   : lvar.size();
          break;
        default:
          INTERR(1086);
      }

      sec.end = ALIGN(sec.end, WORDSIZE); // align to word boundary
    }
  } b;

  lvars.visit_items(*this, b);
}

//-----------------------------------------------------------------------------
void stack_frame_t::build_params_section()
{
  frame_section_t &params = sections[FS_PARAMS];

  params.init(*f.sym->params());
  params.start = params.end = sections[FS_PADDING2].end;

  struct params_builder_t : public frame_item_visitor_t
  {
    uint32_t nregargs;

    virtual void visit_item(item_info_t &info)
    {
      if ( info.idx < ARGREGQTY && info.idx >= nregargs )
        info.sym.loc.set_reg(argreg_names[info.idx]);
      else
        info.sym.loc.set_stkoff(info.sec.end);

      info.sec.end += WORDSIZE;
    }

    params_builder_t(uint32_t _nregargs) : nregargs(_nregargs) {}

  } b(sections[FS_REGARGS].nitems());

  params.visit_items(*this, b);
}

//-----------------------------------------------------------------------------
stack_frame_t::stack_frame_t(const ir_func_t &_f, asm_ctx_t &_ctx)
  : f(_f), ctx(_ctx), epilogue_lbl(new symbol_t(ST_LABEL))
{
  prepare_named_symbol(ctx, epilogue_lbl, "%s%s", "__leave", f.sym->c_str());

  build_regargs_section();
  build_stkargs_section();
  build_svregs_section();
  build_stktemps_section();
  build_ra_section();
  build_padding_section(FS_PADDING1, FS_RA);
  build_lvars_section();
  build_padding_section(FS_PADDING2, FS_LVARS);
  build_params_section();
}

//-----------------------------------------------------------------------------
struct stack_frame_t::reg_saver_t : public frame_item_visitor_t
{
  const char *cmd;

  virtual void visit_item(item_info_t &info)
  {
    symbol_t &reg = info.sym;
    frame_section_t &sec = info.sec;
    asm_ctx_t &ctx = info.frame.ctx;

    ctx.out(TAB1"%s %s, %d($sp)\n",
            cmd,
            reg.loc.reg(),
            sec.start + info.idx * WORDSIZE);
  }

  reg_saver_t(const char *_cmd) : frame_item_visitor_t(), cmd(_cmd) {}
};

//-----------------------------------------------------------------------------
void stack_frame_t::gen_prologue()
{
  ctx.out(TAB1"la $sp, -%u($sp)\n", size());

  reg_saver_t ras("sw");
  sections[FS_RA].visit_items(*this, ras);

  struct argreg_saver_t : public frame_item_visitor_t
  {
    frame_section_t &params;

    virtual void visit_item(item_info_t &info)
    {
      symbol_t &reg = info.sym;
      asm_ctx_t &ctx = info.frame.ctx;

      if ( info.idx < params.nitems() )
      {
        ctx.out(TAB1"sw %s, %d($sp)\n",
                reg.loc.reg(), params.start + info.idx * WORDSIZE);
      }
    }

    argreg_saver_t(frame_section_t &_params) : params(_params) {}

  } as(sections[FS_PARAMS]);

  sections[FS_REGARGS].visit_items(*this, as);

  reg_saver_t srs("sw");
  sections[FS_SVREGS].visit_items(*this, srs);

  ctx.out("\n");
}

//-----------------------------------------------------------------------------
void stack_frame_t::gen_epilogue()
{
  ctx.out("\n%s:\n", epilogue_lbl->c_str());

  reg_saver_t sv_r("lw");
  sections[FS_SVREGS].visit_items(*this, sv_r, FIV_REVERSE);

  reg_saver_t ra_r("lw");
  sections[FS_RA].visit_items(*this, ra_r, FIV_REVERSE);

  ctx.out(TAB1"la $sp, %u($sp)\n", size());
  ctx.out(TAB1"jr $ra\n");
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
    case CNT_ADD: return "add";
    case CNT_SUB: return "sub";
    case CNT_DIV: return "div";
    case CNT_MUL: return "mul";
    case CNT_AND: return "and";
    case CNT_OR:  return "or";
    case CNT_SLT: return "slt";
    case CNT_SGT: return "sgt";
    case CNT_SLE: return "sle";
    case CNT_SEQ: return "seq";
    case CNT_SNE: return "sne";
    case CNT_SGE: return "sge";
    default:
      INTERR(1089);
  }
}

//-----------------------------------------------------------------------------
static void gen_func_body(asm_ctx_t &ctx, codenode_t *code, symref_t epilogue)
{
  for ( code_iterator_t ci(code); *ci != NULL; ci++ )
  {
    codenode_t *node = *ci;

    switch ( node->type )
    {
      case CNT_LI:
        {
          ensure_compatible_operands(ctx, node, REQUIRE_REG_DEST);

          symref_t dest = node->dest;
          symref_t src1 = node->src1;

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
          ensure_compatible_operands(ctx, node, REQUIRE_REG_SRC1);

          symref_t dest = node->dest;
          symref_t src1 = node->src1;

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
          ensure_compatible_operands(ctx, node, REQUIRE_REG_DEST);

          symref_t dest = node->dest;
          symref_t src1 = node->src1;

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
          ensure_compatible_operands(ctx, node, REQUIRE_REG_SRC1);

          symref_t dest = node->dest;
          symref_t src1 = node->src1;

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
          ensure_compatible_operands(ctx, node, REQUIRE_REG_DEST);

          symref_t dest = node->dest;
          symref_t src1 = node->src1;

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
          symref_t dest = node->dest;
          symref_t src1 = node->src1;

          switch ( dest->loc.type() )
          {
            case SLT_REG:
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
              break;
            case SLT_STKOFF:
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
              break;
            default:
              INTERR(1097);
          }
        }
        break;
      case CNT_CNDJMP:
        {
          ensure_compatible_operands(ctx, node, REQUIRE_REG_SRC1);

          symref_t dest = node->dest;
          symref_t src1 = node->src1;

          ctx.out(TAB1"beq %s, $zero, %s\n", src1->loc.reg(), dest->c_str());
        }
        break;
      case CNT_RET:
        {
          symref_t dest = node->dest;
          symref_t src1 = node->src1;

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
        {
          ensure_compatible_operands(ctx, node,
              REQUIRE_REG_DEST | REQUIRE_REG_SRC1 | REQUIRE_REG_SRC2);

          symref_t dest = node->dest;
          symref_t src1 = node->src1;
          symref_t src2 = node->src2;

          ctx.out(TAB1"%s %s, %s, %s\n",
                  cnt2instr(node->type), dest->loc.reg(), src1->loc.reg(), src2->loc.reg());
        }
        break;
      case CNT_SLL:
      case CNT_XOR:
        {
          ensure_compatible_operands(ctx, node, REQUIRE_REG_DEST | REQUIRE_REG_SRC1);

          symref_t dest = node->dest;
          symref_t src1 = node->src1;
          symref_t src2 = node->src2;

          ASSERT(1109, src2->type() == ST_INTCON);

          ctx.out(TAB1"%s %s, %s, %d\n", node->type == CNT_SLL ? "sll" : "xor",
                                   dest->loc.reg(), src1->loc.reg(), src2->val());
        }
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
static void gen_builtin_function(asm_ctx_t &ctx, const char *name, int syscall)
{
  symref_t func = ctx.gsyms.get(name);

  if ( func != NULL && func->is_extern() )
  {
    ctx.out("\n%s:\n"
            TAB1"li $v0, %d\n"
            TAB1"syscall\n"
            TAB1"jr $ra\n", name, syscall);
  }
}

//-----------------------------------------------------------------------------
static void init_resources(ir_func_t &f)
{
  // temps
  symvec_t temps;
  f.temps.get_used_resources(temps);

  for ( symvec_t::iterator i = temps.begin(); i != temps.end(); i++ )
  {
    symbol_t &temp = **i;
    temp.loc.set_reg(tempreg_names[temp.val()]);
  }

  // $v0
  symref_t retval = f.retval.gen_resource();
  retval->loc.set_reg("$v0");

  // $zero
  f.zero->loc.set_reg("$zero");
}

//-----------------------------------------------------------------------------
static void gen_text_section(asm_ctx_t &ctx, ir_funcs_t &funcs)
{
  ctx.out(".text\n");

  for ( ir_funcs_t::iterator i = funcs.begin(); i != funcs.end(); i++ )
  {
    ir_func_t &f = **i;
    init_resources(f);

    ctx.out("\n%s:\n", f.sym->c_str());

    stack_frame_t frame(f, ctx);
    LOG_FRAME_SUMMARY(frame);

    frame.gen_prologue();
    gen_func_body(ctx, f.code, frame.epilogue_lbl);
    frame.gen_epilogue();

    delete *i;
  }

  gen_builtin_function(ctx, "_"BI_PRINT_STRING, 4);
  gen_builtin_function(ctx, "_"BI_PRINT_INT, 1);
  gen_builtin_function(ctx, "_"BI_PRINT_CHAR, 11);
}

//-----------------------------------------------------------------------------
void generate_mips_asm(asm_ctx_t &ctx, ir_t &ir)
{
  init_gsyms(ctx, ir);
  gen_data_section(ctx);
  gen_text_section(ctx, ir.funcs);
}
