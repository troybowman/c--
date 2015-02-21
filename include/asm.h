#ifndef MIPS_ASM_H
#define MIPS_ASM_H

#include <stdio.h>

#include <symbol.h>
#include <codenode.h>
#include <messages.h>

class frame_section_t;

//-----------------------------------------------------------------------------
void generate_mips_asm(FILE *outfile, ir_t &ir);

//-----------------------------------------------------------------------------
struct frame_item_visitor_t
{
  virtual void visit_item(frame_section_t &sec, symbol_t &sym, int idx) = 0;
};

//-----------------------------------------------------------------------------
class frame_section_t : public area_t
{
  symvec_t items;

public:
  frame_section_t() {}

  void init(const symvec_t &vec)
    { items.assign(vec); }
  void init(const symtab_t &table)
    { symvec_t *vec = table.as_vector(); items.assign(*vec); delete vec; }
  void init(const resource_manager_t &rm)
    { rm.get_used_resources(items); }

#define FIV_REVERSE 0x1
  void visit_items(frame_item_visitor_t &fiv, uint32_t flags = 0);

  size_t nitems() const { return items.size(); }
  bool is_valid() const { return size() >= WORDSIZE; }
  offset_t top()  const { return is_valid() ? end - WORDSIZE : BADOFFSET; }
};

//-----------------------------------------------------------------------------
class stack_frame_t
{
#define FRAME_SECTION_QTY 9
  frame_section_t sections[FRAME_SECTION_QTY];

#define FS_PARAMS   8
#define FS_PADDING2 7
#define FS_LVARS    6
#define FS_PADDING1 5
#define FS_RA       4
#define FS_STKTEMPS 3
#define FS_SVREGS   2
#define FS_STKARGS  1
#define FS_REGARGS  0

  void build_regargs_section();
  void build_stkargs_section();
  void build_svregs_section();
  void build_stktemps_section();
  void build_ra_section();
  void build_lvars_section();
  void build_params_section();
  void build_padding_section(int, int);

  struct reg_saver_t : public frame_item_visitor_t
  {
    bool restore;
    virtual void visit_item(frame_section_t &, symbol_t &, int);
  };

  struct argreg_saver_t : public frame_item_visitor_t
  {
    frame_section_t &params;
    virtual void visit_item(frame_section_t &, symbol_t &, int);
    argreg_saver_t(frame_section_t &_params) : params(_params) {}
  };

  const codefunc_t &cf;

public:
  symbol_t *epilogue_lbl;

  stack_frame_t(const codefunc_t &_cf);

  offset_t size() const { return sections[FS_PADDING2].end; }

  void gen_prologue();
  void gen_epilogue();

#ifndef NDEBUG
  void dump();
#endif
};

#define TAB1   "  "
#define TAB2   "    "
#define TABLEN 2

#endif // MIPS_ASM_H