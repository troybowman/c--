#ifndef ASM_H
#define ASM_H

#include <ir.h>

struct asm_context_t;
class frame_section_t;

//-----------------------------------------------------------------------------
void generate_mips_asm(asm_contex_t &ctx, ir_t &ir);

//-----------------------------------------------------------------------------
typedef uint32_t dbg_flags_t;

//-----------------------------------------------------------------------------
enum dbg_flag_t
{
  dbg_no_parse      = 1 << 0, // just collect cmdline args and exit
  dbg_print_gsyms   = 1 << 1, // print global symbol table
  dbg_print_structs = 1 << 2, // print structures table
  dbg_print_funcs   = 1 << 3, // print syntax tree and lvars for each function
  dbg_no_ir         = 1 << 4, // exit before generating intermediate code
  dbg_print_ir      = 1 << 5, // print intermediate code
  dbg_no_code       = 1 << 6, // exit before final code generation
  dbg_asm_cmts      = 1 << 7, // include debug messages in asm output
};

//-----------------------------------------------------------------------------
class asm_context_t
{
  FILE *outfile;
  dbg_flags_t flags;

  // all named symbols (labels, strings, global vars, and functions)
  symtab_t syms;

  // reserved temps. used for storing temporaries in memory when we
  // run out of temp registers
  symref_t t7;
  symref_t t8;
  symref_t t9;

  int tablevel;

  void print_gsyms(const symtab_t &);
  void print_trees(const stx_trees_t &);
  void print_structs(const structab_t &);
  void print_stack_frame(const stack_frame_t &frame);

  void out(int tablevel, const char *fmt, ...);
  void out(const char *fmt, ...);
  void outcmt(const char *fmt, ...);
  void outcmt(int tablevel, const char *fmt, ...);

public:
  asm_context_t(FILE *_outfile, dbg_flags_t _flags);

  void print_parse_results(const parse_results_t &res);
  void print_ir(const ir_t &ir);

  void init_named_symbols(const ir_t &ir);

  void gen_data_section();
  void gen_text_section(ir_funcs_t &ir);
};

//-----------------------------------------------------------------------------
struct item_info_t
{
  asm_context_t &actx;
  const area_t &sec;
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
  void visit_items(asm_context_t &, frame_item_visitor_t &, uint32_t flags = 0) const;
  void build_items(asm_context_t &, frame_item_builder_t &);

  size_t nitems() const { return items.size(); }
  bool is_valid() const { return size() >= WORDSIZE; }
  offset_t top()  const { return is_valid() ? end - WORDSIZE : BADOFFSET; }
};

//-----------------------------------------------------------------------------
// frame section indexes
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

//-----------------------------------------------------------------------------
struct reg_saver_t : public frame_item_visitor_t
{
  const char *cmd;
  frame_section_t &base;

  virtual void visit_item(item_info_t &info, const symbol_t &sym)
  {
    info.actx.out(TAB1,
        "%s %s, %d($sp)\n",
        cmd,
        sym.loc.reg(),
        base.start + info.idx * WORDSIZE);
  }
};

#endif // ASM_H
