#ifndef MESSAGES_H
#define MESSAGES_H

#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

#define INTERR(code)                   \
do                                     \
{                                      \
  fprintf(stderr, "interr: %d", code); \
  exit(code);                          \
} while ( false );

//-----------------------------------------------------------------------------
// Debug/Logging messages

#ifndef NDEBUG

//-----------------------------------------------------------------------------
typedef uint32_t dbg_flags_t;

//-----------------------------------------------------------------------------
extern dbg_flags_t dbg_flags;

//-----------------------------------------------------------------------------
enum dbg_flag_t
{
  dbg_gsyms     = 1 << 0,
  dbg_lsyms     = 1 << 1,
  dbg_gvars     = 1 << 2,
  dbg_insert    = 1 << 3,
  dbg_decl_list = 1 << 4,
};

#define DBG(flag, ...)             \
do                                 \
{                                  \
  if ( (dbg_flags & flag) != 0 )   \
    fprintf(stdout, __VA_ARGS__);  \
} while ( false );

void print_gsyms();
void print_lsyms();

#define DBG_SUMMARY(flags)         \
do                                 \
{                                  \
  if ( (flags & dbg_gsyms) != 0 )  \
    print_gsyms();                 \
  if ( (flags & dbg_lsyms) != 0 )  \
    print_lsyms();                 \
} while ( false );

#else

#define DBG(flag, ...) // nothing
#define DBG_SUMMARY(flags) // nothing

#endif // DEBUG

#endif // MESSAGES_H
