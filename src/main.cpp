#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>

#include <parser.h>
#include <symbol.h>
#include <treenode.h>
#include <ir.h>
#include <asm.h>
#include <messages.h>

#define OUTFILE_EXT "asm"

#ifndef NDEBUG
dbg_flags_t dbg_flags = 0;
static const char *argdesc  = ":v:o:";
static const char *usagestr =
    "usage: %s [-v dbg_flags] [-o outfile] filename\n";
#else
static const char *argdesc  = ":o:";
static const char *usagestr =
    "usage: %s [-o outfile] filename\n";
#endif

//-----------------------------------------------------------------------------
inline bool is_path_sep(char c)
{
#ifdef __NT__
  return c == '\\' || c == '/';
#else
  return c == '/';
#endif
}

//-----------------------------------------------------------------------------
static char *gen_outpath(const char *inpath)
{
  int len = strlen(inpath);
  const char *const end = inpath + len;

  const char *ptr1 = end;
  for ( ; ptr1 != inpath; ptr1-- )
    if ( is_path_sep(*(ptr1-1)) )
      break;

  const char *ptr2 = end;
  for ( ; ptr2 != ptr1; ptr2-- )
    if ( *ptr2 == '.' )
      break;

  if ( ptr2 == ptr1 )
    ptr2 = end;

  int baselen = ptr2-ptr1;
  int extlen  = strlen(OUTFILE_EXT);

  char *buf = (char *)malloc(baselen+extlen+2);
  char *ptr = buf;

  APPSTR(ptr, ptr1, baselen);
  APPSTR(ptr, ".", 1);
  APPSTR(ptr, OUTFILE_EXT, extlen);
  *ptr = '\0';

  return buf;
}

//-----------------------------------------------------------------------------
struct args_t
{
  int code;
#define ARGS_OK      0
#define ARGS_BADOPT  1
#define ARGS_MISSING 2
#define ARGS_INFILE  3
#define ARGS_OUTFILE 4
#define ARGS_NOINPUT 5

  FILE *infile;
  char *outpath;
  union
  {
    char c;
    const char *str;
    FILE *outfile;
  };

  args_t(int _code) : code(_code) {}
  args_t(int _code, char _c) : code(_code), c(_c) {}
  args_t(int _code, const char *_str) : code(_code), str(_str) {}
  args_t(char *_outpath, const char *_str) : code(ARGS_OUTFILE), outpath(_outpath), str(_str) {}

  args_t(FILE *_infile, char *_outpath, FILE *_outfile)
    : code(ARGS_OK), infile(_infile), outpath(_outpath), outfile(_outfile) {}

  ~args_t()
  {
    switch ( code )
    {
      case ARGS_OK:
        fclose(outfile);
      case ARGS_OUTFILE:
        fclose(infile);
        free(outpath);
      default:
        break;
    }
  }
};

//-----------------------------------------------------------------------------
static args_t parseargs(int argc, char **argv)
{
  char *outpath = NULL;

  int c, prev_ind;
  while ( prev_ind = optind, (c = getopt(argc, argv, argdesc)) != -1 )
  {
    if ( optind == prev_ind + 2
     &&  optarg != NULL
     && *optarg == '-' )
    {
      c = ':';
      optind--;
    }
    switch ( c )
    {
#ifndef NDEBUG
      case 'v':
        dbg_flags |= dbg_flags_t(strtoul(optarg, NULL, 0));
        break;
#endif
      case 'o':
        outpath = optarg;
        break;
      case '?':
        return args_t(ARGS_BADOPT, optopt);
      case ':':
        return args_t(ARGS_MISSING, optopt);
      default:
        INTERR(1084);
    }
  }

  if ( optind >= argc )
    return args_t(ARGS_NOINPUT);

  const char *inpath = argv[optind];

  FILE *infile = fopen(inpath, "r");
  if ( infile == NULL )
    return args_t(ARGS_INFILE, strerror(errno));

  if ( outpath == NULL )
    outpath = gen_outpath(inpath);

  FILE *outfile = fopen(outpath, "w");
  if ( outfile == NULL )
    return args_t(outpath, strerror(errno));

  SET_DBGFILE(outfile);

  return args_t(infile, outpath, outfile);
}

//-----------------------------------------------------------------------------
static int process_args_err(args_t args, const char *prog)
{
  switch ( args.code )
  {
    case ARGS_BADOPT:
      fprintf(stderr, "error: unknown option '-%c'\n", args.c);
      break;
    case ARGS_MISSING:
      fprintf(stderr, "error: option '-%c' requiargs an argument\n", args.c);
      break;
    case ARGS_INFILE:
      fprintf(stderr, "error: could not open input file: %s\n", args.str);
      break;
    case ARGS_OUTFILE:
      fprintf(stderr, "error: could not open output file for writing: %s\n", args.str);
      break;
    case ARGS_NOINPUT:
      fprintf(stderr, "error: no input source file specified\n");
      break;
    default:
      INTERR(1083);
  }
  fprintf(stderr, usagestr, prog);
  return 1;
}

//-----------------------------------------------------------------------------
static int process_parse_err(const errvec_t &errmsgs, char *outpath)
{
  errvec_t::const_iterator i;
  for ( i = errmsgs.begin(); i != errmsgs.end(); i++ )
    fprintf(stderr, i->c_str());
  remove(outpath);
  return 2;
}

//-----------------------------------------------------------------------------
int main(int argc, char **argv)
{
  args_t args = parseargs(argc, argv);

  if ( args.code != ARGS_OK )
    return process_args_err(args, argv[0]);

  symtab_t gsyms;
  treefuncs_t funcs;
  errvec_t errmsgs;

  if ( !parse(gsyms, funcs, errmsgs, args.infile) )
    return process_parse_err(errmsgs, args.outpath);

  DBG_PARSE_RESULTS(gsyms, funcs);
  DBG_CHECK_PHASE_FLAG(dbg_no_ir);

  ir_t ir(gsyms);
  generate_ir(ir, funcs);

  DBG_IR(ir);
  DBG_CHECK_PHASE_FLAG(dbg_no_code);

  generate_mips_asm(args.outfile, ir);

  return 0;
}
