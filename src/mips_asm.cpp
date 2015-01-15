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

#define TREGQTY 10
static const char *tregs[TREGQTY] =
  { "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7", "$t8", "$t9" };

#define SVREGQTY 8
static const char *svregs[SVREGQTY] =
  { "$s0", "$s1", "$s2", "$s3", "$s4", "$s5", "$s6", "$s7" };

#define ARGREGQTY 4
static const char *argregs[ARGREGQTY] =
  { "$a0", "$a1", "$a2", "$a3" };

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
static void gen_data_section(FILE *outfile, const symtab_t &gsyms)
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
  virtual void visit_item(symbol_t &sym, int idx) = 0;
};

#define FIV_REVERSE 0x1

//-----------------------------------------------------------------------------
template<class T>
class frame_section_t
{
  T &items;

public:
  uint32_t off;
  uint32_t size;

  frame_section_t(T &_items)
    : items(_items), off(BADSIZE), size(BADSIZE) {}

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
};

//-----------------------------------------------------------------------------
struct frame_summary_t
{
  uint32_t size;

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

/*
//-----------------------------------------------------------------------------
static void init_params(symlist_t &params, int used_args)
{
  int off = 0;
  for ( symlist_t::iterator i = params.begin(); i != params.end(); i++ )
  {
    symbol_t *sym = *i;
    int idx = params->dist(i);

    if ( idx < ARGREGQTY && idx >= used_args )
      sym->loc.set_reg(argregs[idx]);
    else
      sym->loc.set_stkoff(off);

    off += WORDSIZE;
  }
}

//-----------------------------------------------------------------------------
static int init_lvars(symtab_t &lvars)
{
  int size = 0;
  for ( symtab_t::reverse_iterator i = lvars.rbegin(); i != lvars.rend(); i++ )
  {
    symbol_t *sym = *i;
    switch ( sym->type() )
    {
      case ST_PRIMITIVE:
        size += sym->base() == PRIM_INT ? WORDSIZE : 1;
        break;
      case ST_ARRAY:
        size += sym->base() == PRIM_INT ? (WORDSIZE * sym->size()) : sym->size();
        break;
      default:
        INTERR(0);
    }
    size += size % WORDSIZE;
    sym->loc.set_stkoff(-size);
  }
  return size;
}

//-----------------------------------------------------------------------------
static int init_temps(symlist_t &temps, int start)
{
  int off = start;
  for ( symlist::reverse_iterator i = temps.rbegin(); i != temps.rend(); i++ )
  {
    off += WORDSIZE;

    symbol_t *sym = *i;
    int idx = temps.dist(i);

    if ( idx < TREGQTY && idx >= temps.size() )
      sym->loc.set_reg(tempregs[idx]);
    else
      sym->loc.set_stkoff(-off);
  }
  return off;
}

//-----------------------------------------------------------------------------
static int init_svregs(symlist_t &svtemps)

//-----------------------------------------------------------------------------
static void build_stack_frame(ir_func_t &func)
{
  // TODO: must set up parameter locations before processing local vars. meh
  init_params(*func.sym.params(), func.args.size());

  func.frame.set_lvars(init_lvars(*func.sym.symbols());
  func.frame.set_ra(WORDSIZE);
  func.frame.set_temps(init_temps(func.temps));
  func.frame.set_svregs(init_svregs(func.svtemps));
  func.frame.set_args(init_args(func.args));
}

//-----------------------------------------------------------------------------
static void gen_prologue(ir_func_t &func)
{
  fprintf(outfile, TAB1"la $fp, 0($sp)\n");

  frame_summary_t frame;
  build_stack_frame(frame, func);
  DBG_FRAME_SUMMARY(frame);
  fprintf(outfile, TAB1"la $sp, -%d($sp)\n", frame.size);

  save_svregs(frame, func.svtemps);

  // ...
}
*/

static void build_stack_frame(frame_summary_t &frame)
{

}

//-----------------------------------------------------------------------------
static void gen_asm_function(FILE *outfile, codefunc_t &cf)
{
  fprintf(outfile, "%s\n", cf.sym.c_str());
  frame_summary_t frame(cf);
  build_stack_frame(frame);
  //DBG_FRAME_SUMMARY(frame);
}

//-----------------------------------------------------------------------------
static void gen_text_section(FILE *outfile, codefuncs_t &funcs)
{
  fprintf(outfile, ".data\n\n");

  for ( codefuncs_t::iterator i = funcs.begin(); i != funcs.end(); i++ )
    gen_asm_function(outfile, **i);
}

//-----------------------------------------------------------------------------
void generate_mips_asm(FILE *outfile, ir_t &ir)
{
  init_gsyms(ir.gsyms, ir.strings, ir.labels);
  gen_data_section(outfile, ir.gsyms);
  //gen_text_section(outfile, ir.funcs);
}
