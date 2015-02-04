#include <stdlib.h>
#include <string.h>

#include <asm.h>
#include <resource.h>

#define MAXNAMELEN 32

#define TAB1 "  "
#define TAB2 "    "

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

//static symbol_t *t7;
//static symbol_t *t8;
//static symbol_t *t9;

//-----------------------------------------------------------------------------
static FILE *outfile;
static symtab_t gsyms; // all named symbols (labels, strings, src symbols)
static void run_asm_engine(const codenode_t *code, symbol_t *epilogue);

//-----------------------------------------------------------------------------
static bool prepare_named_symbol(symbol_t *sym, const char *fmt, ...)
{
  va_list va;
  va_start(va, fmt);

  char buf[MAXNAMELEN];
  vsnprintf(buf, MAXNAMELEN, fmt, va);

  va_end(va);

  sym->set_name(buf);
  if ( gsyms.get(sym->name()) )
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
static void init_gsyms(symtab_t &src_syms, symtab_t &strings, symlist_t &labels)
{
  gen_asm_names<symtab_t> (src_syms, "_");
  gen_asm_names<symtab_t> (strings,  "_str", true);
  gen_asm_names<symlist_t>(labels,   "_L",   true);

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
  int idx = 0;
  if ( (flags & FIV_REVERSE) == 0 )
  {
    symlist_t::iterator i = items.begin();
    for ( ; i != items.end(); i++, idx++ )
      fiv.visit_item(*this, **i, idx);
  }
  else
  {
    symlist_t::reverse_iterator i = items.rbegin();
    for ( ; i != items.rend(); i++, idx++ )
      fiv.visit_item(*this, **i, idx);
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
    virtual void visit_item(frame_section_t &, symbol_t &regarg, int)
    {
      regarg.loc.set_reg(argreg_names[regarg.val()]);
    }
  };

  regargs_builder_t b;
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
    virtual void visit_item(frame_section_t &sec, symbol_t &stkarg, int)
    {
      stkarg.loc.set_stkoff(sec.end);
      sec.end += WORDSIZE;
    }
  };

  stkargs_builder_t b;
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
    virtual void visit_item(frame_section_t &sec, symbol_t &svreg, int)
    {
      svreg.loc.set_reg(svreg_names[svreg.val()]);
      sec.end += WORDSIZE;
    }
  };

  svregs_builder_t b;
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
    virtual void visit_item(frame_section_t &sec, symbol_t &stktemp, int)
    {
      stktemp.loc.set_stkoff(sec.end);
      sec.end += WORDSIZE;
    }
  };

  stktemps_builder_t b;
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
    virtual void visit_item(frame_section_t &sec, symbol_t &sym, int)
    {
      sym.loc.set_reg("$ra");
      sec.end += WORDSIZE;
    }
  };

  ra_builder_t b;
  ra.visit_items(b);
}

//-----------------------------------------------------------------------------
void stack_frame_t::build_padding_section(section_id_t padid, section_id_t previd)
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
    virtual void visit_item(frame_section_t &sec, symbol_t &lvar, int)
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
  };

  lvars_builder_t b;
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
    int nregargs;

    virtual void visit_item(frame_section_t &sec, symbol_t &param, int idx)
    {
      if ( idx < ARGREGQTY && idx >= nregargs )
        param.loc.set_reg(argreg_names[idx]);
      else
        param.loc.set_stkoff(sec.end);

      sec.end += WORDSIZE;
    }

    params_builder_t(int _nregargs) : nregargs(_nregargs) {}
  };

  params_builder_t b(sections[FS_REGARGS].nitems());
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
void stack_frame_t::reg_saver_t::visit_item(
    frame_section_t &sec,
    symbol_t &reg,
    int idx)
{
  fprintf(outfile,
          TAB1"%s %s, %d($sp)\n",
          restore ? "lw" : "sw",
          reg.loc.reg(),
          restore ? (sec.top() - idx * WORDSIZE)
                  : (sec.start + idx * WORDSIZE));
}

//-----------------------------------------------------------------------------
void stack_frame_t::argreg_saver_t::visit_item(
    frame_section_t &,
    symbol_t &reg,
    int idx)
{
  if ( idx < params.nitems() )
  {
    fprintf(outfile, TAB1"sw %s, %d($sp)\n",
            reg.loc.reg(), params.start + idx * WORDSIZE);
  }
}

//-----------------------------------------------------------------------------
void stack_frame_t::gen_prologue()
{
  fprintf(outfile, "\n%s:\n", cf.sym.c_str());

  DBG_FRAME_SUMMARY();

  fprintf(outfile, TAB1"la $sp, -%u($sp)\n", size());

  reg_saver_t ra_saver;
  sections[FS_RA].visit_items(ra_saver);

  argreg_saver_t argregs_saver(sections[FS_PARAMS]);
  sections[FS_REGARGS].visit_items(argregs_saver);

  reg_saver_t svreg_saver;
  sections[FS_SVREGS].visit_items(svreg_saver);

  fprintf(outfile, "\n");
}

//-----------------------------------------------------------------------------
void stack_frame_t::gen_epilogue()
{
  fprintf(outfile, "\n%s:\n", epilogue_lbl->c_str());

  reg_saver_t svreg_saver;
  svreg_saver.restore = true;
  sections[FS_SVREGS].visit_items(svreg_saver, FIV_REVERSE);

  reg_saver_t ra_saver;
  ra_saver.restore = true;
  sections[FS_RA].visit_items(ra_saver, FIV_REVERSE);

  fprintf(outfile, TAB1"la $sp, %u($sp)\n", size());
  fprintf(outfile, TAB1"jr $ra\n");
}

//-----------------------------------------------------------------------------
#ifndef NDEBUG

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

  char item[NAMELEN+6];
  char *ptr = item;

  const char *pfx = TAB1"# ";
  APPSTR (ptr, pfx, strlen(pfx));
  APPCHAR(ptr, '|', 1);

  int len = strlen(namestr);
  const char *const end = ptr + NAMELEN;

  APPCHAR(ptr, ' ', (NAMELEN - len) / 2);
  APPSTR (ptr, namestr, len);
  APPCHAR(ptr, ' ', end-ptr);
  APPCHAR(ptr, '|', 1);
  *ptr = '\0';

  fprintf(outfile, "%s\n", item);

  char offstr[OFFLEN];
  snprintf(offstr, OFFLEN, "sp+%d%s", off,
           off == dbg_stksize ? "  <-- start of caller's stack" : "");

  fprintf(outfile, TAB1"# %s %s\n", sep, offstr);
}

//-----------------------------------------------------------------------------
void stack_frame_t::dump()
{
  dbg_stksize = size();

  fprintf(outfile, "\n"TAB1"# STACK FRAME SUMMARY:\n"TAB1"# %s\n", sep);

  // PARAMS -------------------------------------------------------------------
  struct param_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &sec, symbol_t &param, int idx) // TODO: const?
    {
      if ( param.loc.is_stkoff() )
        print_frame_item(param.loc.stkoff(), param.c_str());
      else
        print_frame_item(sec.top() - idx * WORDSIZE,
                         "<%s is in %s>",
                         param.c_str(), param.loc.reg());
    }
  };
  param_printer_t pp;
  sections[FS_PARAMS].visit_items(pp, FIV_REVERSE);

  // PADDING2 -----------------------------------------------------------------
  if ( sections[FS_PADDING2].is_valid() )
    print_frame_item(sections[FS_PADDING2].start, "<padding>");

  // LVARS --------------------------------------------------------------------
  struct lvar_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &, symbol_t &lvar, int)
    {
      if ( !lvar.is_param() )
        print_frame_item(lvar.loc.stkoff(), lvar.c_str());
    }
  };
  lvar_printer_t lvp;
  sections[FS_LVARS].visit_items(lvp, FIV_REVERSE);

  // PADDING1 -----------------------------------------------------------------
  if ( sections[FS_PADDING1].is_valid() )
    print_frame_item(sections[FS_PADDING1].start, "<padding>");

  // RA -----------------------------------------------------------------------
  struct ra_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &sec, symbol_t &ra, int)
    {
      print_frame_item(sec.start, ra.loc.reg());
    }
  };
  ra_printer_t rap;
  sections[FS_RA].visit_items(rap, FIV_REVERSE);

  // STKTEMPS -----------------------------------------------------------------
  struct stktemp_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &, symbol_t &stktemp, int)
    {
      print_frame_item(stktemp.loc.stkoff(), "<stktemp %d>", stktemp.val());
    }
  };
  stktemp_printer_t stp;
  sections[FS_STKTEMPS].visit_items(stp, FIV_REVERSE);

  // SVREGS -------------------------------------------------------------------
  struct svregs_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &sec, symbol_t &svreg, int idx)
    {
      print_frame_item(sec.top() - idx * WORDSIZE, svreg.loc.reg());
    }
  };
  svregs_printer_t srp;
  sections[FS_SVREGS].visit_items(srp, FIV_REVERSE);

  // STKARGS ------------------------------------------------------------------
  struct stkargs_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(frame_section_t &, symbol_t &stkarg, int)
    {
      print_frame_item(stkarg.loc.stkoff(), "<stkarg %d>", stkarg.val());
    }
  };
  stkargs_printer_t sag;
  sections[FS_STKARGS].visit_items(sag, FIV_REVERSE);

  // REGARGS ------------------------------------------------------------------
  if ( sections[FS_REGARGS].is_valid() )
    print_frame_item(0, "<minimum 4 arg slots>");
}

#endif // NDEBUG

//-----------------------------------------------------------------------------
static void init_temps(const resource_manager_t &rs)
{
  symlist_t temps;
  rs.get_used_resources(temps);

  for ( symlist_t::iterator i = temps.begin(); i != temps.end(); i++ )
  {
    symbol_t &temp = **i;
    temp.loc.set_reg(tempreg_names[temp.val()]);
  }
}

//-----------------------------------------------------------------------------
static void gen_text_section(codefuncs_t &funcs)
{
  fprintf(outfile, ".text\n");

  for ( codefuncs_t::iterator i = funcs.begin(); i != funcs.end(); i++ )
  {
    const codefunc_t &cf = **i;
    init_temps(cf.temps);

    stack_frame_t frame(cf);
    frame.gen_prologue();

    run_asm_engine((*i)->code, frame.get_epilogue_lbl());

    frame.gen_epilogue();
  }
}

//-----------------------------------------------------------------------------
void generate_mips_asm(FILE *_outfile, ir_t &ir)
{
  outfile = _outfile;
  init_gsyms(ir.gsyms, ir.strings, ir.labels);
  gen_data_section();
  gen_text_section(ir.funcs);
}

//-----------------------------------------------------------------------------
static void run_asm_engine(const codenode_t *code, symbol_t *epilogue)
{
  for ( code_iterator_t ci(code); *ci != NULL; ci++ )
  {
    const codenode_t &node = **ci;
    switch ( node.type )
    {
      default:
        continue;
    }
  }
}
