#ifndef MIPS_ASM_H
#define MIPS_ASM_H

#include "ir.h"

struct asm_ctx_t;

//-----------------------------------------------------------------------------
void generate_mips_asm(asm_ctx_t &ctx, ir_t &ir);

//-----------------------------------------------------------------------------
class asm_ctx_t
{
  FILE *outfile;

public:
  // all named symbols (labels, strings, src symbols)
  symtab_t gsyms;

  // reserved temps. used for storing temporaries in memory when we
  // run out of temp registers
  symref_t t7;
  symref_t t8;
  symref_t t9;

  asm_ctx_t(FILE *_outfile);

  void print(const char *fmt, ...);
};

//-----------------------------------------------------------------------------
struct item_info_t
{
  asm_ctx_t *ctx;
  area_t sec;
  uint32_t idx;
};

//-----------------------------------------------------------------------------
struct frame_item_visitor_t
{
  virtual void visit_item(item_info_t &info, const symbol_t &item) = 0;
};

//-----------------------------------------------------------------------------
struct frame_mods_t : public item_info_t
{
  offset_t delta;
};

//-----------------------------------------------------------------------------
struct frame_item_builder_t
{
  virtual void build_item(frame_mods_t &mods, symbol_t &item) = 0;
};

//-----------------------------------------------------------------------------
class frame_section_t : public area_t
{
  symvec_t items;

public:
  void init(const symvec_t &vec)
    { items.assign(vec); }
  void init(const symtab_t &table)
    { table.assign_to(items); }
  void init(const resource_manager_t &rm)
    { rm.get_used_resources(items); }

#define FIV_REVERSE 0x1
  void visit_items(asm_ctx_t &, frame_item_visitor_t &, uint32_t flags = 0) const;
  void build_items(asm_ctx_t &, frame_item_builder_t &);

  size_t nitems() const { return items.size(); }
  bool is_valid() const { return size() >= WORDSIZE; }
  offset_t top()  const { return is_valid() ? end - WORDSIZE : BADOFFSET; }
};

//-----------------------------------------------------------------------------
#define FS_PARAMS   8
#define FS_PADDING2 7
#define FS_LVARS    6
#define FS_PADDING1 5
#define FS_RA       4
#define FS_STKTEMPS 3
#define FS_SVREGS   2
#define FS_STKARGS  1
#define FS_REGARGS  0

//-----------------------------------------------------------------------------
struct stack_frame_t
{
  frame_section_t sections[9];
  const ir_func_t &f;
  asm_ctx_t &ctx;
  symref_t epilogue_lbl;

  stack_frame_t(const ir_func_t &_f, asm_ctx_t &_ctx);

  offset_t size() const { return sections[FS_PADDING2].end; }

  void gen_prologue();
  void gen_epilogue();

  void print();
};

#define TAB1   "  "
#define TAB2   "    "
#define TABLEN 2

#endif // MIPS_ASM_H
