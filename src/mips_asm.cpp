#include <stdlib.h>
#include <string.h>
#include <stdint.h>

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
static const char **svregs[SVREGQTY] =
  { "$s0", "$s1", "$s2", "$s3", "$s4", "$s5", "$s6", "$s7" };

#define ARGREGQTY 4
static const char *argregs[ARGREGQTY] =
  { "$a0", "$a1", "$a2", "$a3" };

//-----------------------------------------------------------------------------
static void init_gsyms(symtab_t &gsyms)
{
  symlist_t list;
  for ( symtab_t::iterator i = gsyms.begin(); i != gsyms.end(); i++ )
  {
    list.push_back(i->second);
    gsyms.erase(i);
  }
  for ( symlist_t::iterator i = list.begin(); i != list.end(); i++)
  {
    symbol_t *sym = *i;

    if ( !sym->is_func() || sym->name() != "main" )
      sym->make_asm_name();

    sym->loc.set_global();
    gsyms.insert(sym);
  }
}

//-----------------------------------------------------------------------------
struct list_accessor_t
{
  symbol_t *get(symlist_t::iterator i) { return *i; }
};

struct table_accessor_t
{
  symbol_t *get(symtab_t::iterator i) { return i->second; }
};

template<typename T, typename V>
static void init_syms(T &syms, symtab_t &gsyms, const char *pfx)
{
  size_t counter = 0;
  char buf[MAXNAMELEN];
  for ( typename T::iterator i = syms.begin(); i != syms.end(); i++ )
  {
    V accessor;
    symbol_t *sym = accessor.get(i);
    do
    {
      snprintf(buf, MAXNAMELEN, "%s%lu", pfx, counter);
      sym->set_name(buf);
      counter++;
    }
    while ( gsyms.get(sym->name()) != NULL );
    sym->loc.set_global();
    gsyms.insert(sym);
  }
}

//-----------------------------------------------------------------------------
static void init_names(symtab_t &gsyms, symtab_t &strings, symlist_t &labels)
{
  init_gsyms(gsyms);
  init_syms<symtab_t, table_accessor_t>(strings, gsyms, "_str");
  init_syms<symlist_t, list_accessor_t>(labels,  gsyms, "_L");
}

//-----------------------------------------------------------------------------
static void gen_data_section(FILE *outfile, const symtab_t &gsyms)
{
  fprintf(outfile, "\n.data\n\n");

  symtab_t::const_iterator i = gsyms.begin();

  while ( i != gsyms.end() )
  {
    symbol_t *sym = i->second;

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
        fprintf(outfile, TAB2".asciiz %s\n"
                         TAB2".align 2\n", sym->str());
        break;
      default:
        INTERR(0);
    }

    if ( ++i != gsyms.end() )
      fprintf(outfile, "\n");
  }
}

//-----------------------------------------------------------------------------
static void init_frame_data(const ir_func_t &func)
{
  symlist_t &temps = func.temps;
  for ( symlist_t::iterator i = temps.begin(); i != temps.end(); i++ )
  {
    if ( )
  }
}

//-----------------------------------------------------------------------------
struct frame_summary_t
{
  uint32_t lvars;
  uint32_t ra;
  uint32_t temps;
  uint32_t svregs;
  uint32_t args;
  frame_summary_t() : ra(WORDSIZE) {}
};

//-----------------------------------------------------------------------------
static void init_params(symlist_t &params, int used_args)
{
  int off = 0;
  symlist_t *params = func.sym.params();
  for ( symlist_t::iterator i = params->begin(); i != params->end(); i++ )
  {
    symbol_t *sym = *i;
    int idx = params->dist(i);

    if ( idx < ARGREGQTY && idx >= used_args )
      sym->loc.set_reg(argregs[idx]);
    else
      sym->loc.set_stkoff(off);

    off -= WORDSIZE;
  }
}

//-----------------------------------------------------------------------------
static uint32_t init_lvars(symtab_t &lvars)
{
  uint32_t off = 0;

  for ( symtab_t::iterator i = lvars.begin(); i != lvars.end(); i++ )
  {
    symbol_t *sym = *i;

    if ( sym->loc.type() != SLT_UNKNOWN )
      continue;

    sym->loc.set_stkoff(off);

    switch ( sym->type() )
    {
      case ST_PRIMITIVE:

    }
  }
}

//-----------------------------------------------------------------------------
static void build_stack_frame(frame_summary_t &frame, ir_func_t &func)
{
  frame.lvars = init_lvars(*func.sym.symbols());

}

//-----------------------------------------------------------------------------
static gen_prologue(const ir_func_t &func)
{
  // TODO: must set up parameter locations before processing local vars. meh
  init_params(*func.sym.params(), func.args.size());

  frame_summary_t frame;
  build_stack_frame(frame, func);

  fprintf(outfile, TAB1"la $fp, 0($sp)\n");
  // ...
}

//-----------------------------------------------------------------------------
static void gen_text_section(FILE *outfile, const ir_funcs_t &funcs);
{
  fprintf(outfile, ".data\n\n");

  for ( ir_funcs_t::iterator i = funcs.begin(); i != funcs.end(); i++ )
  {
    const ir_func_t *func = *i;
    fprintf("%s\n", func->sym.c_str());
    gen_prologue(func);
  }
}

//-----------------------------------------------------------------------------
void mips_asm_generate(ir_t &ir, FILE *outfile)
{
  init_names(ir.gsyms, ir.strings, ir.labels);
  print_data_section(outfile, ir.gsyms);
  print_text_section(outfile, ir.funcs);
}
