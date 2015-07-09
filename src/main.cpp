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
#include <logger.h>

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
  args_t(char *_outpath, const char *_str)
    : code(ARGS_OUTFILE), outpath(_outpath), str(_str) {}

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

  return args_t(infile, outpath, outfile);
}

//-----------------------------------------------------------------------------
static int process_args_err(args_t args, const char *prog)
{
  fprintf(stderr, usagestr, prog);
  switch ( args.code )
  {
    case ARGS_BADOPT:
      fprintf(stderr, "error: unknown option '-%c'\n", args.c);
      return 3;
    case ARGS_MISSING:
      fprintf(stderr, "error: option '-%c' requiargs an argument\n", args.c);
      return 4;
    case ARGS_INFILE:
      fprintf(stderr, "error: could not open input file: %s\n", args.str);
      return 5;
    case ARGS_OUTFILE:
      fprintf(stderr, "error: could not open output file for writing: %s\n", args.str);
      return 6;
    case ARGS_NOINPUT:
      fprintf(stderr, "error: no input source file specified\n");
      return 7;
    default:
      INTERR(1083);
  }
}

//-----------------------------------------------------------------------------
static int process_parse_err(const parse_results_t &res, const args_t &args)
{
  int count = 0;
  errvec_t::const_iterator i;
  for ( i = res.errmsgs.begin(); i != res.errmsgs.end(); i++, count++ )
  {
    fprintf(stderr, i->c_str());
    if ( count >= 25 )
    {
      fprintf(stderr, "warning: too many errors - results truncated.\n");
      break;
    }
  }
  remove(args.outpath);
  return 8;
}

//-----------------------------------------------------------------------------
int main(int argc, char **argv)
{
  args_t args = parseargs(argc, argv);
  if ( args.code != ARGS_OK )
    return process_args_err(args, argv[0]);

  // parse input source -------------------------------------------------------
  parse_results_t res;
  if ( !parse(res, args.infile) )
    return process_parse_err(res, args);

  LOG_INIT(args.outfile);
  LOG_PARSE_RESULTS(res);
  LOG_CHECK_IR_PHASE();

  // intermediate representation ----------------------------------------------
  ir_t ir(res.gsyms);
  generate_ir(ir, res.trees);

  LOG_IR(ir);
  LOG_CHECK_CODE_PHASE();

  // backend ------------------------------------------------------------------
  asm_ctx_t ctx(args.outfile);
  generate_mips_asm(ctx, ir);

  return 0;
}
