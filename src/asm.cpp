#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#include <asm.h>
#include <resource.h>
#include <printf.h>

#define MAXNAMELEN 32

#define ALIGN(off, val) ((off + (val-1)) & ~(val-1))

//-----------------------------------------------------------------------------
static const char *tempreg_names[TEMPREGQTY] =
  { "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6" };

static const char *svreg_names[SVREGQTY] =
  { "$s0", "$s1", "$s2", "$s3", "$s4", "$s5", "$s6", "$s7" };

static const char *argreg_names[ARGREGQTY] =
  { "$a0", "$a1", "$a2", "$a3" };

// used to store temporaries in memory when we run out of temp registers
#define RESERVED_TEMP1 "$t7"
#define RESERVED_TEMP2 "$t8"
#define RESERVED_TEMP3 "$t9"

static symbol_t *t7;
static symbol_t *t8;
static symbol_t *t9;

//-----------------------------------------------------------------------------
static FILE *outfile;
static symtab_t gsyms; // all named symbols (labels, strings, src symbols)

//-----------------------------------------------------------------------------
static bool prepare_named_symbol(symbol_t *sym, const char *fmt, ...)
{
  va_list va;
  va_start(va, fmt);

  char buf[MAXNAMELEN];
  vsnprintf(buf, MAXNAMELEN, fmt, va);

  va_end(va);

  sym->set_name(buf);
  if ( gsyms.get(sym->name()) != NULL )
    return false;

  sym->loc.set_global();
  gsyms.insert(sym);

  return true;
}

//-----------------------------------------------------------------------------
template<class T>
static void gen_asm_names(T &syms, const char *pfx, bool make_dummy_names = false)
{
  size_t counter = 0;
  for ( typename T::iterator i = syms.begin(); i != syms.end(); i++ )
  {
    symbol_t *sym = *i;
    if ( make_dummy_names )
    {
      while ( !prepare_named_symbol(sym, "%s%lu", pfx, counter) )
        counter++;
    }
    else
    {
      prepare_named_symbol(sym, "%s%s", pfx, sym->c_str());
    }
  }
}

//-----------------------------------------------------------------------------
static void init_gsyms(symtab_t &src_syms, symtab_t &strings, symvec_t &labels)
{
  // 'main' must remain as is - i.e. no auto-generated name
  symbol_t *main = src_syms.get("main");
  if ( main != NULL )
  {
    src_syms.erase(*main);
    gsyms.insert(main);
  }

  gen_asm_names<symtab_t>(src_syms, "_");
  gen_asm_names<symtab_t>(strings,  "_str", true);
  gen_asm_names<symvec_t>(labels,   "_L",   true);

  src_syms.clear();
  strings.clear();
  labels.clear();
}

//-----------------------------------------------------------------------------
static void gen_data_section()
{
  fprintf(outfile, "\n.data\n\n");

  for ( symtab_t::const_iterator i = gsyms.begin(); i != gsyms.end(); i++ )
  {
    symbol_t &sym = **i;

    if ( sym.type() == ST_FUNCTION || sym.type() == ST_LABEL )
      continue;

    fprintf(outfile, TAB1"%s:\n", sym.c_str());

    switch ( sym.type() )
    {
      case ST_PRIMITIVE:
        if ( sym.base() == PRIM_INT )
          fprintf(outfile, TAB2".space %d\n", WORDSIZE);
        else
          fprintf(outfile, TAB2".space 1\n"
                           TAB2".align 2\n");
        break;
      case ST_ARRAY:
        if ( sym.base() == PRIM_INT )
          fprintf(outfile, TAB2".space %d\n", sym.size() * WORDSIZE);
        else
          fprintf(outfile, TAB2".space %d\n"
                           TAB2".align 2\n",  sym.size());
        break;
      case ST_STRCON:
        fprintf(outfile,   TAB2".asciiz %s\n"
                           TAB2".align 2\n",  sym.str());
        break;
      default:
        INTERR(1085);
    }

    fprintf(outfile, "\n");
  }
}

//-----------------------------------------------------------------------------
void frame_section_t::visit_items(frame_item_visitor_t &fiv, uint32_t flags)
{
  size_t sz = items.size();
  for ( size_t i = 0; i < sz; i++ )
  {
    size_t idx = (flags & FIV_REVERSE) == 0 ? i : sz - 1 - i;
    fiv.visit_item(*this, *items[idx], i);
  }
}

//-----------------------------------------------------------------------------
void stack_frame_t::build_regargs_section()
{
  frame_section_t &regargs = sections[FS_REGARGS];

  regargs.init(cf.regargs);

  if ( cf.has_call )
    regargs.end = ARGREGQTY * WORDSIZE;

  struct regargs_builder_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &, symbol_t &regarg, uint32_t)
    {
      regarg.loc.set_reg(argreg_names[regarg.val()]);
    }
  } b;

  regargs.visit_items(b);
}

//-----------------------------------------------------------------------------
void stack_frame_t::build_stkargs_section()
{
  frame_section_t &stkargs = sections[FS_STKARGS];

  stkargs.init(cf.stkargs);
  stkargs.start = stkargs.end = sections[FS_REGARGS].end;

  struct stkargs_builder_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &sec, symbol_t &stkarg, uint32_t)
    {
      stkarg.loc.set_stkoff(sec.end);
      sec.end += WORDSIZE;
    }
  } b;

  stkargs.visit_items(b);
}

//-----------------------------------------------------------------------------
void stack_frame_t::build_svregs_section()
{
  frame_section_t &svregs = sections[FS_SVREGS];

  svregs.init(cf.svregs);
  svregs.start = svregs.end = sections[FS_STKARGS].end;

  struct svregs_builder_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &sec, symbol_t &svreg, uint32_t)
    {
      svreg.loc.set_reg(svreg_names[svreg.val()]);
      sec.end += WORDSIZE;
    }
  } b;

  svregs.visit_items(b);
}

//-----------------------------------------------------------------------------
void stack_frame_t::build_stktemps_section()
{
  frame_section_t &stktemps = sections[FS_STKTEMPS];

  stktemps.init(cf.stktemps);
  stktemps.start = stktemps.end = sections[FS_SVREGS].end;

  struct stktemps_builder_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &sec, symbol_t &stktemp, uint32_t)
    {
      stktemp.loc.set_stkoff(sec.end);
      sec.end += WORDSIZE;
    }
  } b;

  stktemps.visit_items(b);
};

//-----------------------------------------------------------------------------
void stack_frame_t::build_ra_section()
{
  frame_section_t &ra = sections[FS_RA];

  ra.init(cf.ra);
  ra.start = ra.end = sections[FS_STKTEMPS].end;

  struct ra_builder_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &sec, symbol_t &sym, uint32_t)
    {
      sym.loc.set_reg("$ra");
      sec.end += WORDSIZE;
    }
  } b;

  ra.visit_items(b);
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

  lvars.init(*cf.sym.symbols());
  lvars.start = lvars.end = sections[FS_PADDING1].end;

  struct lvars_builder_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &sec, symbol_t &lvar, uint32_t)
    {
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

  lvars.visit_items(b);
}

//-----------------------------------------------------------------------------
void stack_frame_t::build_params_section()
{
  frame_section_t &params = sections[FS_PARAMS];

  params.init(*cf.sym.params());
  params.start = params.end = sections[FS_PADDING2].end;

  struct params_builder_t : public frame_item_visitor_t
  {
    uint32_t nregargs;

    virtual void visit_item(frame_section_t &sec, symbol_t &param, uint32_t idx)
    {
      if ( idx < ARGREGQTY && idx >= nregargs )
        param.loc.set_reg(argreg_names[idx]);
      else
        param.loc.set_stkoff(sec.end);

      sec.end += WORDSIZE;
    }

    params_builder_t(uint32_t _nregargs) : nregargs(_nregargs) {}

  } b(sections[FS_REGARGS].nitems());

  params.visit_items(b);
}

//-----------------------------------------------------------------------------
stack_frame_t::stack_frame_t(const codefunc_t &_cf) : cf(_cf)
{
  build_regargs_section();
  build_stkargs_section();
  build_svregs_section();
  build_stktemps_section();
  build_ra_section();
  build_padding_section(FS_PADDING1, FS_RA);
  build_lvars_section();
  build_padding_section(FS_PADDING2, FS_LVARS);
  build_params_section();

  epilogue_lbl = new symbol_t(ST_LABEL);
  prepare_named_symbol(epilogue_lbl, "%s%s", "__leave", cf.sym.c_str());
}

//-----------------------------------------------------------------------------
struct stack_frame_t::reg_saver_t : public frame_item_visitor_t
{
  bool restore;

  virtual void visit_item(frame_section_t &sec, symbol_t &reg, uint32_t idx)
  {
    fprintf(outfile,
            TAB1"%s %s, %d($sp)\n",
            restore ? "lw" : "sw",
            reg.loc.reg(),
            restore ? (sec.top() - idx * WORDSIZE)
                    : (sec.start + idx * WORDSIZE));
  }

  reg_saver_t(bool _restore = false) : frame_item_visitor_t(), restore(_restore) {}
};

//-----------------------------------------------------------------------------
void stack_frame_t::gen_prologue()
{
  fprintf(outfile, TAB1"la $sp, -%u($sp)\n", size());

  reg_saver_t ras;
  sections[FS_RA].visit_items(ras);

  struct argreg_saver_t : public frame_item_visitor_t
  {
    frame_section_t &params;
    virtual void visit_item(frame_section_t &, symbol_t &reg, uint32_t idx)
    {
      if ( idx < params.nitems() )
      {
        fprintf(outfile, TAB1"sw %s, %d($sp)\n",
                reg.loc.reg(), params.start + idx * WORDSIZE);
      }
    }
    argreg_saver_t(frame_section_t &_params) : params(_params) {}
  } as(sections[FS_PARAMS]);

  sections[FS_REGARGS].visit_items(as);

  reg_saver_t srs;
  sections[FS_SVREGS].visit_items(srs);

  fprintf(outfile, "\n");
}

//-----------------------------------------------------------------------------
void stack_frame_t::gen_epilogue()
{
  fprintf(outfile, "\n%s:\n", epilogue_lbl->c_str());

  reg_saver_t sv_r(true);
  sections[FS_SVREGS].visit_items(sv_r, FIV_REVERSE);

  reg_saver_t ra_r(true);
  sections[FS_RA].visit_items(ra_r, FIV_REVERSE);

  fprintf(outfile, TAB1"la $sp, %u($sp)\n", size());
  fprintf(outfile, TAB1"jr $ra\n");
}

//-----------------------------------------------------------------------------
#define REQUIRE_REG_DEST 0x1
#define REQUIRE_REG_SRC1 0x2
#define REQUIRE_REG_SRC2 0x4

//-----------------------------------------------------------------------------
static void ensure_compatible_operands(codenode_t *node, uint32_t flags)
{
  symbol_t *dest = node->dest;
  symbol_t *src1 = node->src1;
  symbol_t *src2 = node->src2;

  if ( (flags & REQUIRE_REG_SRC1) != 0 && !src1->loc.is_reg() )
  {
    if ( src1->loc.is_stkoff() )
      fprintf(outfile, TAB1"lw %s, %d($sp)\n", t7->loc.reg(), src1->loc.stkoff());
    else
      fprintf(outfile, TAB1"lw %s, %s\n", t7->loc.reg(), src1->c_str());

    node->src1 = t7;
  }

  if ( (flags & REQUIRE_REG_SRC2) != 0 && !src2->loc.is_reg() )
  {
    if ( src2->loc.is_stkoff() )
      fprintf(outfile, TAB1"lw %s, %d($sp)\n", t8->loc.reg(), src2->loc.stkoff());
    else
      fprintf(outfile, TAB1"lw %s, %s\n", t8->loc.reg(), src2->c_str());

    node->src2 = t8;
  }

  if ( (flags & REQUIRE_REG_DEST) != 0 && !dest->loc.is_reg() )
  {
    symbol_t *olddest = node->dest;
    node->dest = t9;
    codenode_t *store = new codenode_t(CNT_SW, olddest, t9, NULL);
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
static void gen_func_body(codenode_t *code, symbol_t *epilogue)
{
  for ( code_iterator_t ci(code); *ci != NULL; ci++ )
  {
    codenode_t *node = *ci;

    switch ( node->type )
    {
      case CNT_LI:
        {
          ensure_compatible_operands(node, REQUIRE_REG_DEST);

          symbol_t *dest = node->dest;
          symbol_t *src1 = node->src1;

          switch ( src1->type() )
          {
            case ST_INTCON:
              fprintf(outfile, TAB1"li %s, %d\n", dest->loc.reg(), src1->val());
              break;
            case ST_CHARCON:
              fprintf(outfile, TAB1"li %s, %s\n", dest->loc.reg(), src1->str());
              break;
            default:
              INTERR(1090);
          }
        }
        break;
      case CNT_MOV:
        {
          ensure_compatible_operands(node, REQUIRE_REG_SRC1);

          symbol_t *dest = node->dest;
          symbol_t *src1 = node->src1;

          switch ( dest->loc.type() )
          {
            case SLT_GLOBAL:
              fprintf(outfile, TAB1"sw %s, %s\n", src1->loc.reg(), dest->c_str());
              break;
            case SLT_STKOFF:
              fprintf(outfile, TAB1"sw %s, %d($sp)\n", src1->loc.reg(), dest->loc.stkoff());
              break;
            case SLT_REG:
              fprintf(outfile, TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
              break;
            default:
              INTERR(1091);
          }
        }
        break;
      case CNT_LEA:
        {
          ensure_compatible_operands(node, REQUIRE_REG_DEST);

          symbol_t *dest = node->dest;
          symbol_t *src1 = node->src1;

          switch ( src1->loc.type() )
          {
            case SLT_GLOBAL:
              fprintf(outfile, TAB1"la %s, %s\n", dest->loc.reg(), src1->c_str());
              break;
            case SLT_STKOFF:
              if ( src1->is_param() )
                fprintf(outfile, TAB1"lw %s, %d($sp)\n", dest->loc.reg(), src1->loc.stkoff());
              else
                fprintf(outfile, TAB1"la %s, %d($sp)\n", dest->loc.reg(), src1->loc.stkoff());
              break;
            case SLT_REG:
              fprintf(outfile, TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
              break;
            default:
              INTERR(1092);
          }
        }
        break;
      case CNT_SB:
      case CNT_SW:
        {
          ensure_compatible_operands(node, REQUIRE_REG_SRC1);

          symbol_t *dest = node->dest;
          symbol_t *src1 = node->src1;

          const char *store = node->type == CNT_SB ? "sb" : "sw";

          switch ( dest->loc.type() )
          {
            case SLT_GLOBAL:
              fprintf(outfile, TAB1"%s %s, %s\n", store, src1->loc.reg(), dest->c_str());
              break;
            case SLT_STKOFF:
              fprintf(outfile, TAB1"%s %s, %d($sp)\n", store, src1->loc.reg(), dest->loc.stkoff());
              break;
            case SLT_REG:
              if ( dest->is_param() )
                fprintf(outfile, TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
              else
                fprintf(outfile, TAB1"%s %s, (%s)\n", store, src1->loc.reg(), dest->loc.reg());
              break;
            default:
              INTERR(1093);
          }
        }
        break;
      case CNT_LB:
      case CNT_LW:
        {
          ensure_compatible_operands(node, REQUIRE_REG_DEST);

          symbol_t *dest = node->dest;
          symbol_t *src1 = node->src1;

          const char *load = node->type == CNT_LB ? "lb" : "lw";

          switch ( src1->loc.type() )
          {
            case SLT_GLOBAL:
              fprintf(outfile, TAB1"%s %s, %s\n", load, dest->loc.reg(), src1->c_str());
              break;
            case SLT_STKOFF:
              fprintf(outfile, TAB1"%s %s, %d($sp)\n", load, dest->loc.reg(), src1->loc.stkoff());
              break;
            case SLT_REG:
              if ( src1->is_param() )
                fprintf(outfile, TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
              else
                fprintf(outfile, TAB1"%s %s, (%s)\n", load, dest->loc.reg(), src1->loc.reg());
              break;
            default:
              INTERR(1094);
          }
        }
        break;
      case CNT_ARG:
        {
          symbol_t *dest = node->dest;
          symbol_t *src1 = node->src1;

          switch ( dest->loc.type() )
          {
            case SLT_REG:
              switch ( src1->loc.type() )
              {
                case SLT_STKOFF:
                  fprintf(outfile, TAB1"lw %s, %d($sp)\n", dest->loc.reg(), src1->loc.stkoff());
                  break;
                case SLT_REG:
                  fprintf(outfile, TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
                  break;
                default:
                  INTERR(1095);
              }
              break;
            case SLT_STKOFF:
              switch ( src1->loc.type() )
              {
                case SLT_STKOFF:
                  ensure_compatible_operands(node, REQUIRE_REG_SRC1);
                  src1 = node->src1;
                case SLT_REG:
                  fprintf(outfile, TAB1"sw %s, %d($sp)\n", src1->loc.reg(), dest->loc.stkoff());
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
          ensure_compatible_operands(node, REQUIRE_REG_SRC1);

          symbol_t *dest = node->dest;
          symbol_t *src1 = node->src1;

          fprintf(outfile, TAB1"beq %s, 0, %s\n", src1->loc.reg(), dest->c_str());
        }
        break;
      case CNT_RET:
        {
          symbol_t *dest = node->dest;
          symbol_t *src1 = node->src1;

          if ( dest != NULL )
          {
            switch ( src1->loc.type() )
            {
              case SLT_GLOBAL:
                fprintf(outfile, TAB1"lw %s, %s\n", dest->loc.reg(), src1->c_str());
                break;
              case SLT_STKOFF:
                fprintf(outfile, TAB1"lw %s, %d($sp)\n", dest->loc.reg(), src1->loc.stkoff());
                break;
              case SLT_REG:
                fprintf(outfile, TAB1"move %s, %s\n", dest->loc.reg(), src1->loc.reg());
                break;
              default:
                INTERR(1098);
            }
          }

          fprintf(outfile, TAB1"j %s\n", epilogue->c_str());
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
          ensure_compatible_operands(node,
              REQUIRE_REG_DEST | REQUIRE_REG_SRC1 | REQUIRE_REG_SRC2);

          symbol_t *dest = node->dest;
          symbol_t *src1 = node->src1;
          symbol_t *src2 = node->src2;

          fprintf(outfile, TAB1"%s %s, %s, %s\n",
                  cnt2instr(node->type), dest->loc.reg(), src1->loc.reg(), src2->loc.reg());
        }
        break;
      case CNT_SLL:
      case CNT_XOR:
        {
          ensure_compatible_operands(node, REQUIRE_REG_DEST | REQUIRE_REG_SRC1);

          symbol_t *dest = node->dest;
          symbol_t *src1 = node->src1;
          symbol_t *src2 = node->src2;

          ASSERT(0, src2->type() == ST_INTCON);

          fprintf(outfile, TAB1"%s %s, %s, %d\n", node->type == CNT_SLL ? "sll" : "xor",
                                   dest->loc.reg(), src1->loc.reg(), src2->val());
        }
        break;
      case CNT_CALL:
        fprintf(outfile, TAB1"jal %s\n", node->src1->c_str());
        break;
      case CNT_LABEL:
        fprintf(outfile, "%s:\n", node->src1->c_str());
        break;
      case CNT_JUMP:
        fprintf(outfile, TAB1"j %s\n", node->dest->c_str());
        break;
      default:
        continue;
    }
  }
}

//-----------------------------------------------------------------------------
static void init_reserved_temps()
{
  t7 = new symbol_t(ST_TEMPORARY);
  t8 = new symbol_t(ST_TEMPORARY);
  t9 = new symbol_t(ST_TEMPORARY);

  t7->loc.set_reg(RESERVED_TEMP1);
  t8->loc.set_reg(RESERVED_TEMP2);
  t9->loc.set_reg(RESERVED_TEMP3);
}

//-----------------------------------------------------------------------------
static void gen_builtin_function(const char *name, int syscall)
{
  symbol_t *func = gsyms.get(name);

  if ( func != NULL && func->is_extern() )
  {
    fprintf(outfile,
            "\n%s:\n"
            TAB1"li $v0, %d\n"
            TAB1"syscall\n"
            TAB1"jr $ra\n", name, syscall);
  }
}

//-----------------------------------------------------------------------------
static void init_resources(codefunc_t &cf)
{
  // temps
  symvec_t temps;
  cf.temps.get_used_resources(temps);

  for ( symvec_t::iterator i = temps.begin(); i != temps.end(); i++ )
  {
    symbol_t &temp = **i;
    temp.loc.set_reg(tempreg_names[temp.val()]);
  }

  // $v0
  symbol_t *retval = cf.retval.gen_resource();
  retval->loc.set_reg("$v0");

  // $zero
  cf.zero->loc.set_reg("$zero");
}

//-----------------------------------------------------------------------------
static void gen_text_section(codefuncs_t &funcs)
{
  init_reserved_temps();

  fprintf(outfile, ".text\n");

  for ( codefuncs_t::iterator i = funcs.begin(); i != funcs.end(); i++ )
  {
    codefunc_t &cf = **i;
    init_resources(cf);

    fprintf(outfile, "\n%s:\n", cf.sym.c_str());

    stack_frame_t frame(cf);
    DBG_FRAME_SUMMARY(frame);

    frame.gen_prologue();
    gen_func_body(cf.code, frame.epilogue_lbl);
    frame.gen_epilogue();
  }

  gen_builtin_function("_"BI_PRINT_STRING, 4);
  gen_builtin_function("_"BI_PRINT_INT, 1);
  gen_builtin_function("_"BI_PRINT_CHAR, 11);
}

//-----------------------------------------------------------------------------
void generate_mips_asm(FILE *_outfile, ir_t &ir)
{
  outfile = _outfile;
  init_gsyms(ir.gsyms, ir.strings, ir.labels);
  gen_data_section();
  gen_text_section(ir.funcs);
}
