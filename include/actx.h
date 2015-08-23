#ifndef LOGGER_H
#define LOGGER_H

#include <symbol.h>

struct ir_t;
struct parse_results_t;
struct stack_frame_t;
class stx_trees_t;

//-----------------------------------------------------------------------------
typedef uint32_t dbg_flags_t;

//-----------------------------------------------------------------------------
enum dbg_flag_t
{
  dbg_no_parse     = 1 << 0, // just collect cmdline args and exit
  dbg_dump_gsyms   = 1 << 1, // dump global symbol table
  dbg_dump_structs = 1 << 2, // dump structure table
  dbg_dump_funcs   = 1 << 3, // dump syntax tree and lvars for each function
  dbg_no_ir        = 1 << 4, // exit before generating intermediate code
  dbg_dump_ir      = 1 << 5, // dump intermediate code
  dbg_no_code      = 1 << 6, // exit before final code generation
  dbg_asm_cmts     = 1 << 7, // include debug messages in asm output
};

#define TAB "  "
#define TABLEN sizeof(TAB)-1

//-----------------------------------------------------------------------------
enum tab_t { TAB0, TAB1, TAB2 };

//-----------------------------------------------------------------------------
class asm_context_t
{
  FILE *outfile;
  dbg_flags_t flags;
  tab_t tab;

  void print_tinfo(char *, size_t, const tinfo_t &);
  void print_gsyms(const symtab_t &);
  void print_trees(const stx_trees_t &);
  void print_structs(const structab_t &);
  void print_frame_item(const stack_frame_t &, offset_t, const char *, ...);

public:
  // all named symbols (labels, strings, global vars, and functions)
  symtab_t nsyms;

  // reserved temps. used for storing temporaries in memory when we
  // run out of temp registers
  symref_t t7;
  symref_t t8;
  symref_t t9;

  asm_context_t(FILE *_outfile, dbg_flags_t _flags);

  void set_tab_level(tab_t level);

  void print_parse_results(const parse_results_t &res);
  void print_ir(const ir_t &ir);
  void print_stack_frame(const stack_frame_t &frame);
  void out(tab_t tab, const char *fmt, ...);
  void out(const char *fmt, ...);
};

#endif // LOGGER_H
