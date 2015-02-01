#include <stdlib.h>
#include <string.h>

#include <asm.h>
#include <resource.h>

#define MAXNAMELEN 32

#define TAB1 "  "
#define TAB2 "    "

//-----------------------------------------------------------------------------
static const char *tempregs[TEMPREGQTY] =
  { "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6" };

static const char *svregs[SVREGQTY] =
  { "$s0", "$s1", "$s2", "$s3", "$s4", "$s5", "$s6", "$s7" };

static const char *argregs[ARGREGQTY] =
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
template<class T>
static uint32_t build_frame_section(
    frame_section_t &sec,
    uint32_t framesize,
    uint32_t start = BADOFFSET)
{
  sec.off = framesize;

  T sizer(start == BADOFFSET ? sec.off : start);
  sec.visit_items(sizer);

  sec.size = sizer.off - sec.off;
  return sec.size;
}

//-----------------------------------------------------------------------------
static uint32_t build_args_section(frame_section_t &args)
{
  struct args_sizer_t : public frame_item_visitor_t
  {
    virtual void visit_item(symbol_t &arg, int)
    {
      if ( arg.val() < ARGREGQTY )
      {
        arg.loc.set_reg(argregs[arg.val()]);
      }
      else
      {
        arg.loc.set_stkoff(off, SLF_SP);
        off += WORDSIZE;
      }
    }
    args_sizer_t(uint32_t off) : frame_item_visitor_t(off) {}
  };

  return build_frame_section<args_sizer_t>(args, 0, WORDSIZE * ARGREGQTY);
}

//-----------------------------------------------------------------------------
static uint32_t build_svtemps_section(frame_section_t &svtemps, uint32_t framesize)
{
  struct svtemps_sizer_t : public frame_item_visitor_t
  {
    virtual void visit_item(symbol_t &svtemp, int)
    {
      if ( svtemp.val() < SVREGQTY )
        svtemp.loc.set_reg(svregs[svtemp.val()]);
      else
        svtemp.loc.set_stkoff(off, SLF_SP);

      off += WORDSIZE;
    }
    svtemps_sizer_t(uint32_t off) : frame_item_visitor_t(off) {}
  };

  return build_frame_section<svtemps_sizer_t>(svtemps, framesize);
}

//-----------------------------------------------------------------------------
static uint32_t build_temps_section(frame_section_t &temps, uint32_t framesize)
{
  struct temps_sizer_t : public frame_item_visitor_t
  {
    virtual void visit_item(symbol_t &temp, int)
    {
      if ( temp.val() < TEMPREGQTY )
      {
        temp.loc.set_reg(tempregs[temp.val()]);
      }
      else
      {
        temp.loc.set_stkoff(off, SLF_SP);
        off += WORDSIZE;
      }
    }
    temps_sizer_t(uint32_t off) : frame_item_visitor_t(off) {}
  };

  return build_frame_section<temps_sizer_t>(temps, framesize);
}

//-----------------------------------------------------------------------------
static uint32_t build_ra_section(frame_section_t &ra, uint32_t framesize)
{
  struct ra_sizer_t : public frame_item_visitor_t
  {
    virtual void visit_item(symbol_t &ra, int)
    {
      ra.loc.set_reg("$ra");
      off += WORDSIZE;
    }
    ra_sizer_t(uint32_t off) : frame_item_visitor_t(off) {}
  };

  return build_frame_section<ra_sizer_t>(ra, framesize);
}

//-----------------------------------------------------------------------------
static uint32_t build_lvars_section(frame_section_t &lvars, uint32_t framesize)
{
  struct lvars_sizer_t : public frame_item_visitor_t
  {
    virtual void visit_item(symbol_t &lvar, int)
    {
      if ( lvar.is_param() )
        return;

      lvar.loc.set_stkoff(off, SLF_SP);
      switch ( lvar.type() )
      {
        case ST_PRIMITIVE:
          off += lvar.base() == PRIM_INT ? WORDSIZE : 1;
          break;
        case ST_ARRAY:
          off += lvar.base() == PRIM_INT
               ? WORDSIZE * lvar.size()
               : lvar.size();
          break;
        default:
          INTERR(1086);
      }
      off = (off + (WORDSIZE-1)) & ~(WORDSIZE-1); // align to word boundary
    }
    lvars_sizer_t(uint32_t off) : frame_item_visitor_t(off) {}
  };

  return build_frame_section<lvars_sizer_t>(lvars, framesize);
}

//-----------------------------------------------------------------------------
static uint32_t build_params_section(frame_section_t &params, uint32_t framesize, size_t nargs)
{
  params.off = framesize;

  struct params_sizer_t : public frame_item_visitor_t
  {
    int nargs;
    virtual void visit_item(symbol_t &param, int idx)
    {
      if ( idx < ARGREGQTY && idx >= nargs )
        param.loc.set_reg(argregs[idx]);
      else
        param.loc.set_stkoff(off, SLF_SP);

      off += WORDSIZE;
    }
    params_sizer_t(uint32_t off, size_t n) : frame_item_visitor_t(off), nargs(n) {}
  };

  params_sizer_t pszr(params.off, nargs);
  params.visit_items(pszr);

  params.size = pszr.off - params.off;
  return params.size;
}

//-----------------------------------------------------------------------------
static void build_stack_frame(frame_summary_t &frame)
{
  uint32_t framesize = 0;

  if ( frame.is_call_frame )
    framesize += build_args_section(frame.args);

  framesize += build_svtemps_section(frame.svtemps, framesize);
  framesize += build_temps_section(frame.temps, framesize);
  framesize += build_ra_section(frame.ra, framesize);
  framesize += build_lvars_section(frame.lvars, framesize);

  // we dont grow the stack frame here - params are located in the caller's stack
  build_params_section(frame.params, framesize, frame.args.nitems());

  frame.size = framesize;
}

//-----------------------------------------------------------------------------
class prologue_t
{
  struct reg_saver_t : public frame_item_visitor_t
  {
    bool restore;

    virtual bool apply_to(const symbol_t &item, int)
      { return item.loc.is_reg(); }

    virtual void visit_item(symbol_t &item, int idx)
    {
      if ( apply_to(item, idx) )
        fprintf(outfile,
                TAB1"%s %s, %u($sp)\n",
                restore ? "lw" : "sw",
                item.loc.reg(),
                off + WORDSIZE * (restore ? -idx : idx));
    }

    reg_saver_t(uint32_t off, bool _restore = false)
      : frame_item_visitor_t(off), restore(_restore) {}
  };

  struct argreg_saver_t : public reg_saver_t
  {
    int nparams;

    virtual bool apply_to(const symbol_t &arg, int idx)
      { return arg.loc.is_reg() && idx < nparams; }

    argreg_saver_t(uint32_t off, int _nparams)
      : reg_saver_t(off), nparams(_nparams) {}
  };

public:
  frame_summary_t frame;
  symbol_t *epilogue_lbl;

  prologue_t(codefunc_t &cf) : frame(cf)
  {
    fprintf(outfile, "\n%s:\n", cf.sym.c_str());

    build_stack_frame(frame);
    DBG_FRAME_SUMMARY(frame);

    fprintf(outfile, TAB1"la $sp, -%u($sp)\n", frame.size);

    reg_saver_t st_saver(frame.svtemps.off);
    frame.svtemps.visit_items(st_saver);

    reg_saver_t ra_saver(frame.ra.off);
    frame.ra.visit_items(ra_saver);

    argreg_saver_t args_saver(frame.params.off, frame.params.nitems());
    frame.args.visit_items(args_saver);

    epilogue_lbl = new symbol_t(ST_LABEL);
    prepare_named_symbol(epilogue_lbl, "%s%s", "__leave", cf.sym.c_str());
  }

  ~prologue_t()
  {
    fprintf(outfile, "\n%s:\n", epilogue_lbl->c_str());

    reg_saver_t ra_restore(frame.ra.top(), true);
    frame.ra.visit_items(ra_restore);

    reg_saver_t st_restore(frame.svtemps.top(), true);
    frame.svtemps.visit_items(st_restore, FIV_REVERSE);

    fprintf(outfile, TAB1"la $sp, %u($sp)\n", frame.size);
    fprintf(outfile, TAB1"jr $ra\n");
  }
};

//-----------------------------------------------------------------------------
static void gen_text_section(codefuncs_t &funcs)
{
  fprintf(outfile, ".text\n");

  for ( codefuncs_t::iterator i = funcs.begin(); i != funcs.end(); i++ )
  {
    prologue_t prologue(**i);
    run_asm_engine((*i)->code, prologue.epilogue_lbl);
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

//-----------------------------------------------------------------------------
#ifndef NDEBUG

#define FMTLEN  1024
#define NAMELEN 32
#define OFFLEN  32

static const char *sep =
"|--------------------------------|";

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
  snprintf(offstr, OFFLEN, "sp+%d", off);

  fprintf(outfile, TAB1"# %s %s\n", sep, offstr);
}

//-----------------------------------------------------------------------------
void print_frame_summary(frame_summary_t &frame)
{
  fprintf(outfile, "\n"TAB1"# STACK FRAME SUMMARY:\n"TAB1"# %s\n", sep);

  //---------------------------------------------------------------------------
  struct param_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(symbol_t &param, int idx) // TODO: const?
    {
      if ( param.loc.is_stkoff() )
        print_frame_item(param.loc.stkoff(), param.c_str());
      else
        print_frame_item(off - idx * WORDSIZE,
                         "<%s is in %s>",
                         param.c_str(), param.loc.reg());
    }
    param_printer_t(uint32_t off) : frame_item_visitor_t(off) {}
  };

  frame_section_t &params = frame.params;
  param_printer_t pprinter(params.top());

  params.visit_items(pprinter, FIV_REVERSE);

  //---------------------------------------------------------------------------
  struct lvar_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(symbol_t &lvar, int)
    {
      if ( !lvar.is_param() )
        print_frame_item(lvar.loc.stkoff(), lvar.c_str());
    }
  };

  lvar_printer_t lvprinter;
  frame.lvars.visit_items(lvprinter, FIV_REVERSE);

  //---------------------------------------------------------------------------
  struct ra_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(symbol_t &ra, int idx)
    {
      print_frame_item(off - idx*WORDSIZE, ra.loc.reg());
    }
    ra_printer_t(uint32_t off) : frame_item_visitor_t(off) {}
  };

  frame_section_t &ra = frame.ra;
  ra_printer_t raprinter(ra.top());

  ra.visit_items(raprinter, FIV_REVERSE);

  //---------------------------------------------------------------------------
  struct temp_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(symbol_t &temp, int)
    {
      if ( temp.loc.is_stkoff() )
        print_frame_item(temp.loc.stkoff(), "<temp%d>", temp.val());
    }
    temp_printer_t(uint32_t off) : frame_item_visitor_t(off) {}
  };

  frame_section_t &temps = frame.temps;
  temp_printer_t tprinter(temps.top());

  temps.visit_items(tprinter, FIV_REVERSE);

  //---------------------------------------------------------------------------
  struct svtemp_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(symbol_t &svtemp, int idx)
    {
      if ( svtemp.loc.is_stkoff() )
        print_frame_item(svtemp.loc.stkoff(), "<svtemp%d>", svtemp.val());
      else
        print_frame_item(off - idx * WORDSIZE, svtemp.loc.reg());
    }
    svtemp_printer_t(uint32_t off) : frame_item_visitor_t(off) {}
  };

  frame_section_t &svtemps = frame.svtemps;
  svtemp_printer_t stprinter(svtemps.top());

  svtemps.visit_items(stprinter, FIV_REVERSE);

  //---------------------------------------------------------------------------
  frame_section_t &args = frame.args;

  struct args_printer_t : public frame_item_visitor_t
  {
    virtual void visit_item(symbol_t &arg, int)
    {
      if ( arg.loc.is_stkoff() )
        print_frame_item(arg.loc.stkoff(), "<arg%d>", arg.val());
    }
  };

  args_printer_t aprinter;
  args.visit_items(aprinter, FIV_REVERSE);

  if ( frame.is_call_frame )
    print_frame_item(args.off, "<minimum 4 arg slots>");
}
#endif // NDEBUG
