#include <stdlib.h>
#include <string.h>
#include <stdint.h>

#include <symbol.h>
#include <codenode.h>
#include <messages.h>
#include "mips_asm.h"

#define MAXNAMELEN 32
#define WORDSIZE 4

#define TAB1 "\t"
#define TAB2 "\t\t"

#define TEMPREGQTY 10
static const char *tempregs[TEMPREGQTY] =
  { "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7", "$t8", "$t9" };

#define SVREGQTY 8
static const char *svregs[SVREGQTY] =
  { "$s0", "$s1", "$s2", "$s3", "$s4", "$s5", "$s6", "$s7" };

#define ARGREGQTY 4
static const char *argregs[ARGREGQTY] =
  { "$a0", "$a1", "$a2", "$a3" };

static FILE *outfile;

//-----------------------------------------------------------------------------
template<class T>
static void gen_asm_names(T &syms, symtab_t &gsyms, const char *pfx)
{
  size_t counter = 0;
  char buf[MAXNAMELEN];
  for ( typename T::iterator i = syms.begin(); i != syms.end(); i++ )
  {
    symbol_t *sym = *i;
    do
    {
      snprintf(buf, MAXNAMELEN, "%s%lu", pfx, counter);
      sym->set_name(buf);
      counter++;
    }
    while ( gsyms.get(sym->name()) != NULL );

    gsyms.insert(sym);
  }
}

//-----------------------------------------------------------------------------
static void init_gsyms(symtab_t &gsyms, symtab_t &strings, symlist_t &labels)
{
  gsyms.make_asm_names("_");

  gen_asm_names<symtab_t>(strings, gsyms, "_str");
  gen_asm_names<symlist_t>(labels, gsyms, "_L");

  for ( symtab_t::iterator i = gsyms.begin(); i != gsyms.end(); i++ )
    (*i)->loc.set_global();

  strings.clear();
  labels.clear();
}

//-----------------------------------------------------------------------------
static void gen_data_section(const symtab_t &gsyms)
{
  fprintf(outfile, "\n.data\n\n");

  for ( symtab_t::const_iterator i = gsyms.begin(); i != gsyms.end(); i++ )
  {
    symbol_t *sym = *i;

    if ( sym->type() == ST_FUNCTION || sym->type() == ST_LABEL )
      continue;

    fprintf(outfile, TAB1"%s:\n", sym->c_str());

    switch ( sym->type() )
    {
      case ST_PRIMITIVE:
        if ( sym->base() == PRIM_INT )
          fprintf(outfile, TAB2".space %d\n", WORDSIZE);
        else
          fprintf(outfile, TAB2".space 1\n"
                           TAB2".align 2\n");
        break;
      case ST_ARRAY:
        if ( sym->base() == PRIM_INT )
          fprintf(outfile, TAB2".space %d\n", sym->size() * WORDSIZE);
        else
          fprintf(outfile, TAB2".space %d\n"
                           TAB2".align 2\n", sym->size());
        break;
      case ST_STRCON:
        fprintf(outfile,   TAB2".asciiz %s\n"
                           TAB2".align 2\n", sym->str());
        break;
      default:
        INTERR(0);
    }

    fprintf(outfile, "\n");
  }
}

//-----------------------------------------------------------------------------
struct frame_item_visitor_t
{
  uint32_t off;

  frame_item_visitor_t() : off(BADSIZE) {}
  frame_item_visitor_t(uint32_t _off) : off(_off) {}

  virtual void visit_item(symbol_t &sym, int idx) = 0;
};

//-----------------------------------------------------------------------------
template<class T>
class frame_section_t
{
  T &items;

public:
  uint32_t off;
  uint32_t size;

  frame_section_t(T &_items)
    : items(_items), off(0), size(0) {}

#define FIV_REVERSE 0x1

  void visit_items(frame_item_visitor_t &fiv, uint32_t flags = 0)
  {
    int idx = 0;
    if ( (flags & FIV_REVERSE) == 0 )
    {
      typename T::iterator i = items.begin();
      for ( ; i != items.end(); i++, idx++ )
        fiv.visit_item(**i, idx);
    }
    else
    {
      typename T::reverse_iterator i = items.rbegin();
      for ( ; i != items.rend(); i++, idx++ )
        fiv.visit_item(**i, idx);
    }
  }

  size_t nitems() { return items.size(); }
  uint32_t top()
  {
    uint32_t t = off + size - WORDSIZE;
    return t > 0 ? t : 0;
  }
  uint32_t end()  { return off + size; }
};

//-----------------------------------------------------------------------------
struct frame_summary_t
{
  uint32_t size;
  uint32_t flags;

  frame_section_t<symlist_t> params;
  frame_section_t<symtab_t>  lvars;
  frame_section_t<symlist_t> ra;
  frame_section_t<symlist_t> temps;
  frame_section_t<symlist_t> svtemps;
  frame_section_t<symlist_t> args;

  frame_summary_t(codefunc_t &cf)
    : size(BADSIZE), params(*cf.sym.params()), lvars(*cf.sym.symbols()),
      ra(cf.ra), temps(cf.temps), svtemps(cf.svtemps), args(cf.args) {}
};

//-----------------------------------------------------------------------------
static void build_stack_frame(frame_summary_t &frame, bool is_call_frame)
{
  uint32_t framesize = 0;

  //---------------------------------------------------------------------------
  // arglocs
  frame_section_t<symlist_t> &args = frame.args;

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

  if ( is_call_frame )
  {
    args_sizer_t aszr(uint32_t(WORDSIZE * ARGREGQTY)); // always allocate enough space for 4 arg regs
    args.visit_items(aszr);

    args.size = aszr.off - args.off;
    framesize += args.size;
  }

  //---------------------------------------------------------------------------
  // saved temporaries
  frame_section_t<symlist_t> &svtemps = frame.svtemps;
  svtemps.off = framesize;

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

  svtemps_sizer_t stszr(svtemps.off);
  svtemps.visit_items(stszr);

  svtemps.size = stszr.off - svtemps.off;
  framesize += svtemps.size;

  //---------------------------------------------------------------------------
  // temporaries
  frame_section_t<symlist_t> &temps = frame.temps;
  temps.off = framesize;

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

  temps_sizer_t tszr(temps.off);
  temps.visit_items(tszr);

  temps.size = tszr.off - temps.off;
  framesize += temps.size;

  //---------------------------------------------------------------------------
  // return address
  frame_section_t<symlist_t> &ra = frame.ra;
  ra.off = framesize;

  struct ra_sizer_t : public frame_item_visitor_t
  {
    virtual void visit_item(symbol_t &ra, int)
    {
      ra.loc.set_reg("$ra");
      off += WORDSIZE;
    }
    ra_sizer_t(uint32_t off) : frame_item_visitor_t(off) {}
  };

  ra_sizer_t raszr(ra.off);
  ra.visit_items(raszr);

  ra.size = raszr.off - ra.off;
  framesize += ra.size;

  //---------------------------------------------------------------------------
  // local variables
  frame_section_t<symtab_t> &lvars = frame.lvars;
  lvars.off = framesize;

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
          INTERR(0);
      }
      off = (off + (WORDSIZE-1)) & ~(WORDSIZE-1); // align to word boundary
    }
    lvars_sizer_t(uint32_t off) : frame_item_visitor_t(off) {}
  };

  lvars_sizer_t lvszr(lvars.off);
  lvars.visit_items(lvszr);

  lvars.size = lvszr.off - lvars.off;
  framesize += lvars.size;

  //---------------------------------------------------------------------------
  // params
  frame_section_t<symlist_t> &params = frame.params;
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

  params_sizer_t pszr(params.off, args.nitems());
  params.visit_items(pszr);

  params.size = pszr.off - params.off;
  // we dont grow the stack frame here - params are located in the caller's stack
  frame.size = framesize;
}

//-----------------------------------------------------------------------------
static void gen_prologue(frame_summary_t &frame)
{
  fprintf(outfile, TAB1"la $sp, -%u($sp)\n", frame.size);

  struct reg_saver_t : public frame_item_visitor_t
  {
    virtual void visit_item(symbol_t &item, int idx)
    {
      if ( item.loc.is_reg() )
        fprintf(outfile, TAB1"sw %s, %u($sp)\n",
                item.loc.reg(), off + idx * WORDSIZE);
    }
    reg_saver_t(uint32_t off) : frame_item_visitor_t(off) {}
  };

  reg_saver_t srsvr(frame.svtemps.off);
  frame.svtemps.visit_items(srsvr);

  reg_saver_t rasvr(frame.ra.off);
  frame.ra.visit_items(rasvr);

  struct argregs_saver_t : public frame_item_visitor_t
  {
    int nparams;
    virtual void visit_item(symbol_t &arg, int idx)
    {
      if ( arg.loc.is_reg() && idx < nparams )
        fprintf(outfile, TAB1"sw %s, %u($sp)\n",
                arg.loc.reg(), off + idx * WORDSIZE);
    }
    argregs_saver_t(uint32_t off, int _nparams)
      : frame_item_visitor_t(off), nparams(_nparams) {}
  };

  argregs_saver_t asvr(frame.params.off, frame.params.nitems());
  frame.args.visit_items(asvr);
}

//-----------------------------------------------------------------------------
static void gen_asm_function(codefunc_t &cf)
{
  fprintf(outfile, "\n%s:\n", cf.sym.c_str());

  frame_summary_t frame(cf);
  build_stack_frame(frame, cf.has_call);
  DBG_FRAME_SUMMARY(frame, cf.has_call);

  gen_prologue(frame);

  // loop through codenodes
}

//-----------------------------------------------------------------------------
static void gen_text_section(codefuncs_t &funcs)
{
  fprintf(outfile, ".text\n");

  for ( codefuncs_t::iterator i = funcs.begin(); i != funcs.end(); i++ )
    gen_asm_function(**i);
}

//-----------------------------------------------------------------------------
void generate_mips_asm(FILE *_outfile, ir_t &ir)
{
  outfile = _outfile;
  init_gsyms(ir.gsyms, ir.strings, ir.labels);
  gen_data_section(ir.gsyms);
  gen_text_section(ir.funcs);
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

  APPSTR (ptr, TAB1"# ", 3);
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
void print_frame_summary(frame_summary_t &frame, bool is_call_frame)
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

  frame_section_t<symlist_t> &params = frame.params;
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

  frame_section_t<symlist_t> &ra = frame.ra;
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

  frame_section_t<symlist_t> &temps = frame.temps;
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

  frame_section_t<symlist_t> &svtemps = frame.svtemps;
  svtemp_printer_t stprinter(svtemps.top());

  svtemps.visit_items(stprinter, FIV_REVERSE);

  //---------------------------------------------------------------------------
  frame_section_t<symlist_t> &args = frame.args;

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

  if ( is_call_frame )
    print_frame_item(args.off, "<minimum 4 arg slots>");
}
#endif // NDEBUG
