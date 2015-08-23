#ifndef MIPS_ASM_H
#define MIPS_ASM_H

#include <ir.h>

struct asm_context_t;
class frame_section_t;

//-----------------------------------------------------------------------------
void generate_mips_asm(asm_contex_t &ctx, ir_t &ir);

//-----------------------------------------------------------------------------
struct item_info_t
{
  asm_context_t &actx;
  const area_t &sec;
  const uint32_t idx;

  item_info_t(asm_context_t &_actx, const area_t &_sec, uint32_t _idx)
    : actx(_actx), area(_sec), idx(_idx) {}
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

  frame_mods_t(asm_context_t &actx, const area_t &sec, uint32_t idx)
    : delta(BADOFFSET), item_info_t(actx, sec, idx) {}
};

//-----------------------------------------------------------------------------
struct frame_item_builder_t
{
  virtual void visit_item(frame_mods_t &mods, symbol_t &item) = 0;
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
  void visit_items(asm_context_t &, frame_item_visitor_t &, uint32_t flags = 0) const;
  void visit_items(frame_item_builder_t &);

  size_t nitems() const { return items.size(); }
  bool is_valid() const { return size() >= WORDSIZE; }
  offset_t top()  const { return is_valid() ? end - WORDSIZE : BADOFFSET; }
};

//-----------------------------------------------------------------------------
// frame section indices
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
  symref_t epilogue_label;

  stack_frame_t(asm_context_t &_ctx, const ir_func_t &func);

  offset_t size() const { return sections[FS_PADDING2].end; }

  void gen_prologue();
  void gen_epilogue();
};

#endif // MIPS_ASM_H
