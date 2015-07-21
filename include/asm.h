#ifndef MIPS_ASM_H
#define MIPS_ASM_H

#include <ir.h>
#include <logger.h>

struct asm_ctx_t;
class frame_section_t;
class stack_frame_t;

//-----------------------------------------------------------------------------
void generate_mips_asm(asm_ctx_t &ctx, ir_t &ir);

//-----------------------------------------------------------------------------
struct item_info_t
{
  stack_frame_t &frame;
  frame_section_t &sec;
  symbol_t &sym;
  uint32_t idx;

  item_info_t(stack_frame_t &f, frame_section_t &sn, symbol_t &s, uint32_t i)
    : frame(f), sec(sn), sym(s), idx(i) {}
};

//-----------------------------------------------------------------------------
struct frame_item_visitor_t
{
  virtual void visit_item(item_info_t &info) = 0;
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
    { table.assign_to(items); }
  void init(const resource_manager_t &rm)
    { rm.get_used_resources(items); }

#define FIV_REVERSE 0x1
  void visit_items(stack_frame_t &, frame_item_visitor_t &, uint32_t flags = 0);

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

  struct reg_saver_t;
  struct argreg_saver_t;

  const ir_func_t &f;

public:
  asm_ctx_t &ctx;
  symref_t epilogue_lbl;

  stack_frame_t(const ir_func_t &_f, asm_ctx_t &_ctx);

  void visit_items(int, frame_item_visitor_t &, uint32_t flags = 0);

  void gen_prologue();
  void gen_epilogue();

  offset_t size() const { return sections[FS_PADDING2].end; }

#ifndef NDEBUG
  void print();
  void print_pseudo_section(int, const char *);
#endif
};

#define TAB1   "  "
#define TAB2   "    "
#define TABLEN 2

//-----------------------------------------------------------------------------
struct asm_ctx_t
{
  FILE *outfile;

  // all named symbols (labels, strings, src symbols)
  symtab_t gsyms;

  // reserved temps. used for storing temporaries in memory when we
  // run out of temp registers
  symref_t t7;
  symref_t t8;
  symref_t t9;

  asm_ctx_t(FILE *_outfile);

  void out(const char *fmt, ...);
};

#endif // MIPS_ASM_H
