#include <printf.h>
#include <parse.h>
#include <messages.h>

static symbol_t *_print_string;
static symbol_t *_print_int;
static symbol_t *_print_char;

//-----------------------------------------------------------------------------
bool validate_printf_decl(const symbol_t &func, return_type_t rt, bool is_extern)
{
  const symvec_t *params = func.params();

  return func.name() == "printf"
      && rt == RT_VOID
      && is_extern
      && params->size() == 2
      && params->front()->is_array()
      && params->front()->base() == PRIM_CHAR;
}

//-----------------------------------------------------------------------------
static symbol_t *build_print_function(
    const char *name,
    const char *pname,
    symbol_type_t ptype,
    primitive_t pbase,
    symtab_t &gsyms)
{
  symvec_t *params = new symvec_t;
  symbol_t *param  = new symbol_t(SF_PARAMETER, pname, -1, ptype);

  param->set_base(pbase);
  params->push_back(param);

  symbol_t *bfunc = new symbol_t(SF_EXTERN, name, -1, ST_FUNCTION, params);
  bfunc->set_rt(RT_VOID);

  ASSERT(0, gsyms.get(bfunc->name()) == NULL);
  gsyms.insert(bfunc);
  return bfunc;
}

//-----------------------------------------------------------------------------
void build_print_functions(symbol_t *printf, symtab_t &gsyms)
{
  ASSERT(0, printf != NULL);
  printf->set_builtin_printf();

  _print_int    = build_print_function(BI_PRINT_INT,    "val",  ST_PRIMITIVE, PRIM_INT,  gsyms);
  _print_string = build_print_function(BI_PRINT_STRING, "str",  ST_ARRAY,     PRIM_CHAR, gsyms);
  _print_char   = build_print_function(BI_PRINT_CHAR,   "c",    ST_PRIMITIVE, PRIM_CHAR, gsyms);
}

//-----------------------------------------------------------------------------
static treenode_t *build_printf_tree(symbol_t *printf, const printf_args_t &allargs)
{
  seq_t seq = { NULL, NULL };

  // build sequence of calls to print_(string|int|char)
  for ( int i = 0; i < allargs.size(); i++ )
  {
    const printf_arg_t &arg = allargs[i];

    treenode_t *args =
        new treenode_t(TNT_ARG, const_cast<treenode_t *>(arg.node), NULL);

    symbol_t *func = arg.type == PF_ARG_STR ? _print_string
                   : arg.type == PF_ARG_INT ? _print_int
                   :                          _print_char;

    treenode_t *call = new treenode_t(TNT_CALL, func, args);
    seq_append(seq, call, TNT_STMT);
  }

  return seq.head == NULL ? ERRNODE : new treenode_t(TNT_PRINTF, printf, seq.head);
}

//-----------------------------------------------------------------------------
static treenode_t *process_printf_error(printf_res_t res, treenode_t *args, int line)
{
  switch ( res )
  {
    case PRINTF_NOARGS:
      usererr("error: printf() expects at least one string constant argument, line %d\n", line);
      break;
    case PRINTF_STRCON:
      usererr("error: first argument to printf() must be a string constant, line %d\n", line);
      break;
    case PRINTF_BADARG:
      usererr("error: incompatible argument for format specifier, line %d\n", line);
      break;
    case PRINTF_NUMARGS:
      usererr("error: invalid number of format arguments, line %d\n", line);
      break;
    default:
      INTERR(0);
  }
  delete args;
  return ERRNODE;
}

//-----------------------------------------------------------------------------
static void prepare_substring_arg(
      printf_args_t &allargs,
      const char *const start,
      const char *const end)
{
  int len = end - start;
  if ( len <= 0 )
    return;

  char *str = (char *)malloc(cmax(len,0)+3);
  char *ptr = str;
  APPCHAR(ptr, '"', 1);
  APPSTR (ptr, start, len);
  APPCHAR(ptr, '"', 1);
  *ptr = '\0';

  treenode_t *node = new treenode_t(TNT_STRCON, str);
  allargs.push_back(printf_arg_t(PF_ARG_STR, node));
}

//-----------------------------------------------------------------------------
static printf_res_t validate_printf_call(printf_args_t &allargs, const treenode_t *fmtargs)
{
  if ( fmtargs == NULL )
    return PRINTF_NOARGS;

  if ( fmtargs->children[SEQ_CUR]->type != TNT_STRCON )
    return PRINTF_STRCON;

  // ignore leading, trailing "
  const char *fmt = fmtargs->children[SEQ_CUR]->str + 1;
  const char *ptr = fmt;
  const char *const end = fmt + strlen(fmt) - 1;
  const char *cursub = ptr;

  tree_iterator_t ti(fmtargs->children[SEQ_NEXT]);

  for ( ; ptr != end; ptr++ )
  {
    if ( *ptr == '%' && ptr+1 < end )
    {
      char c = *(ptr+1);

      if ( c == FMTS || c == FMTD || c == FMTC )
      {
        prepare_substring_arg(allargs, cursub, ptr);
        cursub = ptr+2;

        const treenode_t *arg = *ti++;
        if ( arg == NULL )
          return PRINTF_NUMARGS;

        switch ( c )
        {
          case FMTD:
          case FMTC:
            {
              if ( !arg->is_int_compat() )
                return PRINTF_BADARG;
              int argtype = c == FMTD ? PF_ARG_INT : PF_ARG_CHAR;
              allargs.push_back(printf_arg_t(argtype, arg));
            }
            break;
          case FMTS:
            {
              if ( !arg->is_string_compat() )
                return PRINTF_BADARG;
              allargs.push_back(printf_arg_t(PF_ARG_STR, arg));
            }
            break;
        }
      }
    }
  }

  prepare_substring_arg(allargs, cursub, ptr);

  if ( *ti != NULL )
    return PRINTF_NUMARGS;

  return PRINTF_OK;
}

//-----------------------------------------------------------------------------
treenode_t *process_printf_call(symbol_t *printf, treenode_t *args, int line)
{
  printf_args_t allargs;

  printf_res_t res = validate_printf_call(allargs, args);

  if ( res != PRINTF_OK )
    return process_printf_error(res, args, line);

  return build_printf_tree(printf, allargs);
}
