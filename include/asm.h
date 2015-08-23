#ifndef MIPS_ASM_H
#define MIPS_ASM_H

#include <ir.h>

struct asm_ctx_t;
class frame_section_t;

//-----------------------------------------------------------------------------
void generate_mips_asm(asm_ctx_t &ctx, ir_t &ir);

//-----------------------------------------------------------------------------
struct item_info_t
{
  asm_ctx_t &ctx;
  frame_section_t &sec;
  symbol_t &sym;
  uint32_t idx;

  item_info_t(asm_ctx_t &ctx, frame_section_t &sn, symbol_t &s, uint32_t i)
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
// frame section ids
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

  symref_t epilogue;

  stack_frame_t(asm_ctx_t &_ctx, const ir_func_t &func);
  void visit_items(int section, frame_item_visitor_t &fiv, uint32_t flags = 0);
  offset_t size() const { return sections[FS_PADDING2].end; }

  struct reg_saver_t;
  void gen_prologue();
  void gen_epilogue();
};

#endif // MIPS_ASM_H
