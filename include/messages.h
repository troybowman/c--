#ifndef MESSAGES_H
#define MESSAGES_H

#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

//-----------------------------------------------------------------------------
// Error messages
//-----------------------------------------------------------------------------

// exit codes
#define FATAL_NORMAL  0
#define FATAL_USAGE   1
#define FATAL_FUNCDEF 2
#define FATAL_MAXERR  3
#define FATAL_OUTFILE 4

void checkerr();
void purge_and_exit(int code);
void usererr(const char *format, ...);

//-----------------------------------------------------------------------------
#define INTERR(code)                            \
do                                              \
{                                               \
  /* TODO: if ( debugged ) __asm__("int $3") */ \
  fprintf(stderr, "interr: %d\n", code);        \
  exit(code);                                   \
} while ( false );

//-----------------------------------------------------------------------------
// Debug/Logging messages
//-----------------------------------------------------------------------------

#ifndef NDEBUG

//-----------------------------------------------------------------------------
#define ASSERT(code, cond) \
do                         \
{                          \
  if ( !(cond) )           \
    INTERR(code);          \
} while ( false );

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
class symlist_t;
struct ir_t;
struct treefunc_t;
#include <list>
typedef std::list<treefunc_t> treefuncs_t;

void print_syms(const symtab_t &syms, const char *title, const char *extra);
void walk_funcs(const treefuncs_t &functions, dbg_flags_t flags);
void print_ir(const ir_t &ir);
void set_dbgfile(FILE *dbgfile);

//-----------------------------------------------------------------------------
#define DBG_INIT_OUTFILE(outpath) FILE *outfile = init_outfile(args.str);
#define OPT_INIT_OUTFILE(outpath) // nothing
#define SET_DBGFILE(dbgfile)      do { set_dbgfile(dbgfile); } while ( false );

//-----------------------------------------------------------------------------
#define DBG_PARSE_RESULTS(gsyms, functions)       \
do                                                \
{                                                 \
  if ( (dbg_flags & dbg_dump_gsyms) != 0 )        \
    print_syms(gsyms, "GLOBAL SYMBOL TABLE", ""); \
  if ( (dbg_flags & dbg_dump_lsyms) != 0          \
    || (dbg_flags & dbg_dump_tree)  != 0 )        \
  {                                               \
    walk_funcs(functions, dbg_flags & 0xC);       \
  }                                               \
} while ( false );

//-----------------------------------------------------------------------------
#define DBG_CHECK_PHASE_FLAG(flag) \
do                                 \
{                                  \
  if ( (dbg_flags & flag) != 0 )   \
    exit(0);                       \
} while ( false );

//-----------------------------------------------------------------------------
#define DBG_IR(ir)                      \
do                                      \
{                                       \
  if ( (dbg_flags & dbg_dump_ir) != 0 ) \
    print_ir(ir);                       \
} while ( false );

#else

//-----------------------------------------------------------------------------
#define DBG(flag, ...)              // nothing
#define ASSERT(code, cond)          // nothing
#define DBG_PARSE_RESULTS()         // nothing
#define DBG_IR(code)                // nothing
#define DBG_CHECK_PHASE_FLAG(flags) // nothing
#define DBG_INIT_OUTFILE(outpath)   // nothing
#define OPT_INIT_OUTFILE(outpath) FILE *outfile = init_outfile(args.str);
#define DBG_FRAME_SUMMARY(func)     // nothing

#endif // DEBUG

#endif // MESSAGES_H
