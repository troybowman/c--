#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <string.h>

#include <parse.h>
#include <symbol.h>
#include <codenode.h>
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
static char *gen_outpath(const char *path)
{
  int len = strlen(path);
  const char *const end = path + len;

  const char *ptr1 = end;
  for ( ; ptr1 != path; ptr1-- )
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

#define APPSTR(ptr, str, len) \
do                            \
{                             \
  strncpy(ptr, str, len);     \
  ptr += len;                 \
} while ( false )

  APPSTR(ptr, ptr1, baselen);
  APPSTR(ptr, ".", 1);
  APPSTR(ptr, OUTFILE_EXT, extlen);
  *ptr = '\0';

#undef APPSTR

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
#define ARGS_NOINPUT 4
  FILE *infile;
  union
  {
    char c;
    const char *str;
  };
  args_t(int _code) : code(_code) {}
  args_t(int _code, char _c) : code(_code), c(_c) {}
  args_t(int _code, const char *_str) : code(_code), str(_str) {}
  args_t(FILE *_infile, const char *_str)
    : code(ARGS_OK), infile(_infile), str(_str) {}
};

//-----------------------------------------------------------------------------
static void process_args_error(args_t res, const char *prog)
{
  switch ( res.code )
  {
    case ARGS_BADOPT:
      fprintf(stderr, "error: unknown option '-%c'\n", res.c);
      break;
    case ARGS_MISSING:
      fprintf(stderr, "error: option '-%c' requires an argument\n", res.c);
      break;
    case ARGS_INFILE:
      fprintf(stderr, "error: could not open input file: %s\n", res.str);
      break;
    case ARGS_NOINPUT:
      fprintf(stderr, "error: no input source file specified\n");
      break;
    default:
      INTERR(0);
  }
  fprintf(stderr, usagestr, prog);
  exit(FATAL_USAGE);
}

//-----------------------------------------------------------------------------
static args_t parseargs(int argc, char **argv)
{
  char *outpath = NULL;

  int c, prev_ind;
  while ( prev_ind = optind, (c = getopt(argc, argv, argdesc)) != -1 )
  {
    if ( optind == prev_ind + 2 && *optarg == '-' )
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
        INTERR(0);
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

  return args_t(infile, outpath);
}

//-----------------------------------------------------------------------------
void open_outfile(FILE **outfile, const char *outpath)
{
  *outfile = fopen(outpath, "w");
  if ( *outfile == NULL )
  {
    fprintf(stderr, "error: could not open output file for writing: %s\n", strerror(errno));
    exit(FATAL_OUTFILE);
  }
  SET_DBGFILE(*outfile);
}

//-----------------------------------------------------------------------------
int main(int argc, char **argv)
{
  args_t args = parseargs(argc, argv);
  if ( args.code != ARGS_OK )
    process_args_error(args, argv[0]);

  //---------------------------------------------------------------------------
  // parse, generate syntax tree
  symtab_t gsyms;
  symlist_t functions;
  parse(gsyms, functions, args.infile);
  fclose(args.infile);

  //---------------------------------------------------------------------------
  FILE *outfile;
  open_outfile(&outfile, args.str);

  DBG_PARSE_RESULTS(gsyms, functions);
  CHECK_PHASE_FLAG(dbg_no_ir);

  //---------------------------------------------------------------------------
  // generate intermediate representation
  ir_t ir(gsyms);
  generate(ir, functions);

  DBG_IR(ir);
  CHECK_PHASE_FLAG(dbg_no_code);

  //---------------------------------------------------------------------------
  // generate code

  return 0;
}