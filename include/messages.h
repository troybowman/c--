#ifndef MESSAGES_H
#define MESSAGES_H

//-----------------------------------------------------------------------------
// Debug/Logging messages
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
#ifndef NDEBUG

#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

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

struct codenode_t;
class symtab_t;
struct ir_t;
struct stx_tree_t;
class stx_trees_t;

void print_syms(const symtab_t &syms, const char *title, const char *extra);
void walk_funcs(const stx_trees_t &trees, dbg_flags_t flags);
void print_ir(const ir_t &ir);
void set_dbgfile(FILE *dbgfile);

//-----------------------------------------------------------------------------
#define SET_DBGFILE(dbgfile) do { set_dbgfile(dbgfile); } while ( false )

//-----------------------------------------------------------------------------
#define DBG_PARSE_RESULTS(results)                        \
do                                                        \
{                                                         \
  if ( (dbg_flags & dbg_dump_gsyms) != 0 )                \
    print_syms(results.gsyms, "GLOBAL SYMBOL TABLE", ""); \
  if ( (dbg_flags & dbg_dump_lsyms) != 0                  \
    || (dbg_flags & dbg_dump_tree)  != 0 )                \
  {                                                       \
    walk_funcs(results.trees, dbg_flags & 0xC);           \
  }                                                       \
} while ( false );

//-----------------------------------------------------------------------------
#define DBG_CHECK_PHASE_FLAG(flag) \
do                                 \
{                                  \
  if ( (dbg_flags & flag) != 0 )   \
    return 0;                      \
} while ( false );

//-----------------------------------------------------------------------------
#define DBG_IR(ir)                      \
do                                      \
{                                       \
  if ( (dbg_flags & dbg_dump_ir) != 0 ) \
    print_ir(ir);                       \
} while ( false );

//-----------------------------------------------------------------------------
#define DBG_FRAME_SUMMARY(frame) frame.dump()

#else

//-----------------------------------------------------------------------------
#define DBG(flag, ...)              // nothing
#define DBG_PARSE_RESULTS(results)  // nothing
#define DBG_IR(code)                // nothing
#define DBG_CHECK_PHASE_FLAG(flags) // nothing
#define SET_DBGFILE(outfile)        // nothing
#define DBG_FRAME_SUMMARY(frame)    // nothing

#endif // DEBUG

#endif // MESSAGES_H
