#ifndef MIPS_ASM_H
#define MIPS_ASM_H

#include <stdio.h>
#include <symbol.h>
#include <codenode.h>
#include <messages.h>

#define WORDSIZE 4

//-----------------------------------------------------------------------------
void generate_mips_asm(FILE *outfile, ir_t &ir);

//-----------------------------------------------------------------------------
struct frame_item_visitor_t
{
  uint32_t off;

  frame_item_visitor_t() : off(BADOFFSET) {}
  frame_item_visitor_t(uint32_t _off) : off(_off) {}

  virtual void visit_item(symbol_t &sym, int idx) = 0;
};

//-----------------------------------------------------------------------------
class frame_section_t
{
public:
  uint32_t off;
  uint32_t size;

  frame_section_t() : off(0), size(0) {}

#define FIV_REVERSE 0x1
  virtual void visit_items(frame_item_visitor_t &fiv, uint32_t flags = 0) = 0;
  virtual size_t nitems() = 0;

  uint32_t end() { return off + size; }

  uint32_t top()
  {
    uint32_t t = off + size - WORDSIZE;
    return t > 0 ? t : 0;
  }
};

//-----------------------------------------------------------------------------
template<class T>
class complex_section_t : public frame_section_t
{
  T &items;

public:
  complex_section_t(T &_items) : items(_items) {}

  virtual void visit_items(frame_item_visitor_t &fiv, uint32_t flags = 0)
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

  virtual size_t nitems() { return items.size(); }
};

//-----------------------------------------------------------------------------
typedef complex_section_t<symlist_t> list_section_t;
typedef complex_section_t<symtab_t>  table_section_t;

//-----------------------------------------------------------------------------
class ra_section_t : public frame_section_t
{
  symbol_t *ra;

public:
  ra_section_t(symbol_t *_ra) : ra(_ra) {}

  virtual void visit_items(frame_item_visitor_t &fiv, uint32_t flags = 0)
  {
    if ( ra != NULL )
      fiv.visit_item(*ra, 0);
  }

  virtual size_t nitems() { return ra != NULL ? 1 : 0; }
};

//-----------------------------------------------------------------------------
struct frame_summary_t
{
  uint32_t size;
  bool is_call_frame;

  list_section_t  params;
  table_section_t lvars;
  ra_section_t    ra;
  list_section_t  temps;
  list_section_t  svtemps;
  list_section_t  args;

  frame_summary_t(codefunc_t &cf)
    : size(BADOFFSET), is_call_frame(cf.has_call), params(*cf.sym.params()),
      lvars(*cf.sym.symbols()), ra(cf.ra), temps(cf.temps),
      svtemps(cf.svtemps), args(cf.args) {}

//private:
  //struct reg_saver_t : public frame_item_visitor_t
  //{

  //}
};

//-----------------------------------------------------------------------------
#ifndef NDEBUG
struct frame_summary_t;
void print_frame_summary(frame_summary_t &frame);
#define DBG_FRAME_SUMMARY(frame) print_frame_summary(frame);
#else
#define DBG_FRAME_SUMMARY(frame) // nothing
#endif // NDEBUG

#endif // MIPS_ASM_H
