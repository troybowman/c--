#ifndef ASMCTX_H
#define ASMCTX_H

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

  void print_tinfo(char *buf, size_t bufsize, const tinfo_t &tinfo);
  void print_gsyms(const symtab_t &);
  void print_trees(const stx_trees_t &);
  void print_structs(const structab_t &);

public:
  // all named symbols (labels, strings, global vars, and functions)
  symtab_t nsyms;

  // reserved temps. used for storing temporaries in memory when we
  // run out of temp registers
  symref_t t7;
  symref_t t8;
  symref_t t9;

  int tablevel;

  asm_context_t(FILE *_outfile, dbg_flags_t _flags);

  void out(int tablevel, const char *fmt, ...);
  void out(const char *fmt, ...);
  void outcmt(const char *fmt, ...);
  void outcmt(int tablevel, const char *fmt, ...);

  void print_parse_results(const parse_results_t &res);
  void print_ir(const ir_t &ir);
  void print_stack_frame(const stack_frame_t &frame);
};

#endif // ASMCTX_H
