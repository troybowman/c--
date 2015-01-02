#include <stdlib.h>
#include <string.h>

#include <messages.h>
#include "mips_asm.h"

#define MAXNAMELEN 32

//-----------------------------------------------------------------------------
static void init_gsym_names(symtab_t &gsyms)
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
    sym->make_asm_name();
    gsyms.insert(sym);
  }
}

//-----------------------------------------------------------------------------
static void init_string_names(symtab_t &strings, const symtab_t &gsyms)
{
  char buf[MAXNAMELEN];
  size_t counter = 0;
  symtab_t::iterator i = strings.begin();
  for ( ; i != strings.end(); i++, counter++ )
  {
    symbol_t *sym = i->second;
    do
    {
      snprintf(buf, MAXNAMELEN, "_str%lu\n", counter);
      sym->set_name(buf);
    }
    while ( gsyms.get(sym->name()) == NULL );
  }
}

//-----------------------------------------------------------------------------
static void init_label_names(symlist_t &labels, const symtab_t &gsyms, const symtab_t &strings)
{
  char buf[MAXNAMELEN];
  size_t counter = 0;
  symlist_t::iterator i = labels.begin();
  for ( ; i != labels.end(); i++, counter++ )
  {
    symbol_t *sym = *i;
    do
    {
      snprintf(buf, MAXNAMELEN, "_L%lu\n", counter);
      sym->set_name(buf);
    }
    while ( gsyms.get(sym->name())   == NULL
         && strings.get(sym->name()) == NULL );
  }
}

//-----------------------------------------------------------------------------
static void init_names(symtab_t &gsyms, symtab_t &strings, symlist_t &labels)
{
  init_gsym_names(gsyms);
  init_string_names(strings, gsyms);
  init_label_names(labels, gsyms, strings);
}

//-----------------------------------------------------------------------------
void mips_asm_generate(ir_t &ir, FILE *outfile)
{
  init_names(ir.gsyms, ir.strings, ir.labels);

  //DBG_IR(ir);
}
