#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#include <parse.h>
#include <symbol.h>
#include <codenode.h>
#include <messages.h>

//-----------------------------------------------------------------------------
static void usage(const char *prog)
{
  const char *msg =
#ifndef NDEBUG
    "usage: %s [-v dbg_flags] filename\n";
#else
    "usage: %s filename\n";
#endif
  fprintf(stderr, msg, prog);
  exit(FATAL_USAGE);
}

//-----------------------------------------------------------------------------
static bool parseargs(FILE **fp, int argc, char **argv)
{
  const char *infile = NULL;

  if ( argc == 2 )
  {
    infile = argv[1];
  }
  else
  {
#ifndef NDEBUG
    if ( argc != 4 || strcmp("-v", argv[1]) != 0 )
      return false;
    dbg_flags |= dbg_flags_t(strtoul(argv[2], NULL, 0));
    infile = argv[3];
#else
    return false;
#endif
  }
  *fp = fopen(infile, "r");
  if ( *fp == NULL )
  {
    fprintf(stderr, "cannot open file %s: %s\n" , infile, strerror(errno));
    return false;
  }
  return true;
}

//-----------------------------------------------------------------------------
int main(int argc, char **argv)
{
  FILE *infile;
  if ( !parseargs(&infile, argc, argv) )
    usage(argv[0]);

  CHECK_PHASE_FLAG(dbg_no_parse);

  //---------------------------------------------------------------------------
  // parse, generate syntax trees
  symtab_t gsyms;
  symlist_t functions;

  parse(gsyms, functions, *infile);

  DBG_PARSE_RESULTS(gsyms, functions);
  CHECK_PHASE_FLAG(dbg_no_ir);

  //---------------------------------------------------------------------------
  // generate intermediate representation
  ir_t ir(gsyms);
  generate(ir, functions);

  DBG_IR(ir);
  CHECK_PHASE_FLAG(dbg_no_code)

  //---------------------------------------------------------------------------
  // generate code

  return 0;
}
