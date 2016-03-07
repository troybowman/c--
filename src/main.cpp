#include <errno.h>
#include <unistd.h>

#include <common.h>
#include <parser.h>
#include <symbol.h>
#include <treenode.h>
#include <ir.h>
#include <asm.h>
#include <logger.h>

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
  const char *const in_end = inpath + len;

  const char *ptr1 = in_end;
  for ( ; ptr1 != inpath; ptr1-- )
    if ( is_path_sep(*(ptr1-1)) )
      break;

  const char *ptr2 = in_end;
  for ( ; ptr2 != ptr1; ptr2-- )
    if ( *ptr2 == '.' )
      break;

  if ( ptr2 == ptr1 )
    ptr2 = in_end;

  int baselen = ptr2-ptr1;
  int buflen = baselen+5;

  char *buf = (char *)malloc(buflen);
  char *ptr = buf;
  const char *const end = buf + buflen;

  APPSTR (ptr, end, ptr1, baselen);
  APPCHAR(ptr, end, '.', 1);
  APPSTR (ptr, end, "asm", 3);
  APPZERO(ptr, end);

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
  uint32_t flags;
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

  args_t(FILE *i, char *op, FILE *of, uint32_t f)
    : code(ARGS_OK), infile(i), outpath(op), outfile(of), flags(f) {}

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
  uint32_t flags = 0;

  int c, prev_ind;
  while ( prev_ind = optind, (c = getopt(argc, argv, ":v:o:")) != -1 )
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
      case 'v':
        flags |= strtoul(optarg, NULL, 0);
        break;
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

  return args_t(infile, outpath, outfile, flags);
}

//-----------------------------------------------------------------------------
static int process_args_err(args_t args, const char *prog)
{
  fprintf(stderr, "usage: %s [-v dbg_flags] [-o outfile] filename\n", prog);

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
static int process_parse_err(const parse_results_t &res, args_t &args)
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

  ir_t ir;
  {
    parse_results_t res;
    if ( !parse(res, args.infile) )
      return process_parse_err(res, args);

    LOG_INIT(args.outfile);
    LOG_PARSE_RESULTS(res);
    LOG_CHECK_PHASE_FLAG(dbg_no_ir);

    generate_ir(ir, res);

    LOG_IR(ir);
    LOG_CHECK_PHASE_FLAG(dbg_no_code);
  }

  asm_ctx_t ctx(args.outfile);
  generate_mips_asm(ctx, ir);

  return 0;
}
