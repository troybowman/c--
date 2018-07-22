#include <errno.h>
#include <unistd.h>

#include "parser.h"
#include "asm.h"
#include "logger.h"

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
  uint32_t flags;
  char *outpath;
  FILE *infile;
  FILE *outfile;

  args_t() : flags(0), outpath(NULL), infile(NULL), outfile(NULL) {}
  ~args_t()
  {
    if ( outfile != NULL )
      fclose(outfile);
    if ( outpath != NULL )
      free(outpath);
  }

  bool parse(int argc, char **argv);
};

//-----------------------------------------------------------------------------
bool args_t::parse(int argc, char **argv)
{
  const char *_outpath = NULL;

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
        _outpath = optarg;
        break;
      case '?':
        fprintf(stderr, "error: unknown option '-%c'\n", optopt);
        return false;
      case ':':
        fprintf(stderr, "error: option '-%c' requires an argument\n", optopt);
        return false;
      default:
        INTERR(1084);
    }
  }

  if ( optind >= argc )
  {
    fprintf(stderr, "error: no input source file specified\n");
    return false;
  }

  const char *inpath = argv[optind];

  infile = fopen(inpath, "r");
  if ( infile == NULL )
  {
    fprintf(stderr, "error: could not open %s (%s)\n", inpath, strerror(errno));
    return false;
  }

  if ( _outpath == NULL )
  {
    outpath = gen_outpath(inpath);
    _outpath = outpath;
  }

  outfile = fopen(_outpath, "w");
  if ( outfile == NULL )
  {
    fprintf(stderr, "error: could not open %s (%s)\n", _outpath, strerror(errno));
    fclose(infile);
    return false;
  }

  return true;
}

//-----------------------------------------------------------------------------
static int parse_input_file(ir_t &ir, args_t &args)
{
  parse_results_t res;
  if ( !parse(res, args.infile) )
  {
    for ( size_t i = 0, size = res.errmsgs.size(); i < size; i++ )
    {
      fprintf(stderr, "%s", res.errmsgs[i].c_str());
      if ( i >= 25 )
      {
        fprintf(stderr, "too many errors - results truncated.\n");
        break;
      }
    }
    remove(args.outpath);
    return -1;
  }

  LOG_INIT(args.outfile);
  LOG_PARSE_RESULTS(res);
  LOG_CHECK_PHASE_FLAG(dbg_no_ir);

  generate_ir(ir, res);

  LOG_IR(ir);
  LOG_CHECK_PHASE_FLAG(dbg_no_code);

  return 1;
}

//-----------------------------------------------------------------------------
int main(int argc, char **argv)
{
  args_t args;
  if ( !args.parse(argc, argv) )
  {
    fprintf(stderr, "usage: %s [-v dbg_flags] [-o outfile] filename\n", argv[0]);
    return -1;
  }

  ir_t ir;
  int code = parse_input_file(ir, args);
  if ( code <= 0 )
    return code;

  asm_ctx_t ctx(args.outfile);
  generate_mips_asm(ctx, ir);

  return 0;
}
