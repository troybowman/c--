#ifndef MESSAGES_H
#define MESSAGES_H

#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

//-----------------------------------------------------------------------------
// Error messages
//-----------------------------------------------------------------------------

// exit codes
#define FATAL_USAGE   1
#define FATAL_FUNCDEF 2
#define FATAL_MAXERR  3
#define FATAL_NORMAL  4

void checkerr();
void purge_and_exit(int code);
void usererr(const char *format, ...);

//-----------------------------------------------------------------------------
#define INTERR(code)                   \
do                                     \
{                                      \
  fprintf(stderr, "interr: %d", code); \
  exit(code);                          \
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
  dbg_gsyms     = 1 << 0,
  dbg_lsyms     = 1 << 1,
  dbg_tree      = 1 << 2,
  dbg_nocode    = 1 << 3,
  dbg_gvars     = 1 << 4,
  dbg_insert    = 1 << 5,
  dbg_decl_list = 1 << 6,
};

//-----------------------------------------------------------------------------
#define DBG(flag, ...)             \
do                                 \
{                                  \
  if ( (dbg_flags & flag) != 0 )   \
    fprintf(stdout, __VA_ARGS__);  \
} while ( false );

void print_gsyms();
void walk_funcs(dbg_flags_t flags);

//-----------------------------------------------------------------------------
#define DBG_SUMMARY(flags)         \
do                                 \
{                                  \
  if ( (flags & dbg_gsyms) != 0 )  \
    print_gsyms();                 \
  if ( (flags & dbg_lsyms) != 0    \
    || (flags & dbg_tree)  != 0 )  \
  {                                \
    walk_funcs(flags);             \
  }                                \
} while ( false );

//-----------------------------------------------------------------------------
#define CHECK_CODEGEN_FLAGS(flags) \
do                                 \
{                                  \
  if ( (flags & dbg_nocode) != 0 ) \
    exit(0);                       \
} while ( false );

#else

//-----------------------------------------------------------------------------
#define DBG(flag, ...)             // nothing
#define DBG_SUMMARY(flags)         // nothing
#define ASSERT(code, cond)         // nothing
#define CHECK_CODEGEN_FLAGS(flags) // nothing

#endif // DEBUG

#endif // MESSAGES_H
