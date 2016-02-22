#ifndef MESSAGES_H
#define MESSAGES_H

//-----------------------------------------------------------------------------
// Debug/Logging messages
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#ifndef NDEBUG

#include <common.h>

typedef uint32_t dbg_flags_t;

//-----------------------------------------------------------------------------
extern dbg_flags_t dbg_flags;

//-----------------------------------------------------------------------------
enum dbg_flag_t
{
  dbg_no_parse    = 1 << 0,
  dbg_dump_gsyms  = 1 << 1,
  dbg_dump_lsyms  = 1 << 2,
  dbg_dump_tree   = 1 << 3,
  dbg_no_ir       = 1 << 4,
  dbg_dump_ir     = 1 << 5,
  dbg_no_code     = 1 << 6,
  dbg_asm_cmts    = 1 << 7,
};

//-----------------------------------------------------------------------------
#define DBG(flag, ...)             \
do                                 \
{                                  \
  if ( (dbg_flags & flag) != 0 )   \
    fprintf(stdout, __VA_ARGS__);  \
} while ( false );

//-----------------------------------------------------------------------------
class symtab_t;
class stx_trees_t;
class treenode_t;
struct ir_t;
struct codenode_t;
struct stx_tree_t;

//-----------------------------------------------------------------------------
struct logger_t
{
  FILE *logfile;

  logger_t(FILE *_logfile) : logfile(_logfile)
  {
    ASSERT(1114, logfile);
  }

  void cmtout(int indent, const char *fmt, ...);
  void print_syms(const symtab_t &syms, const char *title, const char *extra);
  void print_tree(const treenode_t *node, int *cnt);
  void print_ir_code(const codenode_t *code);
  void print_ir(const ir_t &ir);
  void walk_funcs(const stx_trees_t &trees, dbg_flags_t flags);
};

//-----------------------------------------------------------------------------
#define LOG_INIT(outfile) logger_t logger(outfile);

//-----------------------------------------------------------------------------
#define LOG_PARSE_RESULTS(results)                               \
do                                                               \
{                                                                \
  if ( (dbg_flags & dbg_dump_gsyms) != 0 )                       \
    logger.print_syms(results.gsyms, "GLOBAL SYMBOL TABLE", ""); \
  if ( (dbg_flags & dbg_dump_lsyms) != 0                         \
    || (dbg_flags & dbg_dump_tree)  != 0 )                       \
  {                                                              \
    logger.walk_funcs(results.trees, dbg_flags & 0xC);           \
  }                                                              \
} while ( false );

//-----------------------------------------------------------------------------
#define LOG_CHECK_PHASE_FLAG(flag)  \
do                                  \
{                                   \
  if ( (dbg_flags & flag) != 0 )    \
    return 0;                       \
} while ( false );

//-----------------------------------------------------------------------------
#define LOG_IR(ir)                      \
do                                      \
{                                       \
  if ( (dbg_flags & dbg_dump_ir) != 0 ) \
    logger.print_ir(ir);                \
} while ( false );

//-----------------------------------------------------------------------------
#define LOG_FRAME_SUMMARY(frame) frame.print()

#else

//-----------------------------------------------------------------------------
#define DBG(flag, ...)              // nothing
#define LOG_INIT(outfile)           // nothing
#define LOG_PARSE_RESULTS(results)  // nothing
#define LOG_IR(code)                // nothing
#define LOG_CHECK_PHASE_FLAG(flags) // nothing
#define LOG_FRAME_SUMMARY(frame)    // nothing

#endif // DEBUG

#endif // MESSAGES_H
