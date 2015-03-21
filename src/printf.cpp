#include <printf.h>
#include <parse.h>
#include <treenode.h>
#include <messages.h>

static symref_t _print_string;
static symref_t _print_int;
static symref_t _print_char;

//-----------------------------------------------------------------------------
bool validate_printf_decl(const symbol_t &func, primitive_t rt, bool is_extern)
{
  const symvec_t *params = func.params();

  return func.name() == "printf"
      && rt == PRIM_VOID
      && is_extern
      && params->size() == 2
      && params->front()->is_array()
      && params->front()->base() == PRIM_CHAR
      && params->back()->type() == ST_ELLIPSIS;
}

//-----------------------------------------------------------------------------
static symref_t build_print_function(
    const char *name,
    const char *pname,
    symbol_type_t ptype,
    primitive_t pbase,
    symtab_t &gsyms)
{
  symvec_t *params = new symvec_t;
  symref_t  param  = ptype == ST_PRIMITIVE
                   ? symref_t(new symbol_t(SF_PARAMETER, pname, -1))
                   : symref_t(new symbol_t(SF_PARAMETER, pname, -1, BADOFFSET));

  param->set_base(pbase);
  params->push_back(param);

  symref_t bfunc(new symbol_t(SF_EXTERN, name, -1, params));
  bfunc->set_base(PRIM_VOID);

  ASSERT(0, gsyms.get(bfunc->name()) == NULL);
  gsyms.insert(bfunc);
  return bfunc;
}

//-----------------------------------------------------------------------------
void build_print_functions(symref_t printf, symtab_t &gsyms)
{
  ASSERT(0, printf != NULL);
  printf->set_builtin_printf();

  _print_int    = build_print_function(BI_PRINT_INT,    "val",  ST_PRIMITIVE, PRIM_INT,  gsyms);
  _print_string = build_print_function(BI_PRINT_STRING, "str",  ST_ARRAY,     PRIM_CHAR, gsyms);
  _print_char   = build_print_function(BI_PRINT_CHAR,   "c",    ST_PRIMITIVE, PRIM_CHAR, gsyms);
}

//-----------------------------------------------------------------------------
static treenode_t *build_printf_tree(symref_t printf, const format_args_t &fmtargs)
{
  seq_t seq = { NULL, NULL };

  // build sequence of calls to print_(string|int|char)
  for ( size_t i = 0; i < fmtargs.size(); i++ )
  {
    const format_arg_t &fmtarg = fmtargs[i];

    treenode_t *argtree =
        new treenode_t(TNT_ARG, const_cast<treenode_t *>(fmtarg.expr), NULL);

    treenode_t *call = new treenode_t(fmtarg.func, TNT_CALL, argtree);
    seq_append(seq, call, TNT_STMT);
  }

  return seq.head == NULL ? ERRNODE : new treenode_t(printf, TNT_PRINTF, seq.head);
}

//-----------------------------------------------------------------------------
static void prepare_substring_arg(
      format_args_t &fmtargs,
      const char *const start,
      const char *const end)
{
  int len = end - start;
  if ( len <= 0 )
    return;

  char *str = (char *)malloc(len+3);
  char *ptr = str;
  APPCHAR(ptr, '"', 1);
  APPSTR (ptr, start, len);
  APPCHAR(ptr, '"', 1);
  *ptr = '\0';

  treenode_t *node = new treenode_t(TNT_STRCON, str);
  fmtargs.push_back(format_arg_t(_print_string, node));
}

//-----------------------------------------------------------------------------
static printf_res_t handle_empty_fmt(format_args_t &fmtargs, const treenode_t *argtree)
{
  if ( count_args(argtree) > 0 )
    return PRINTF_NUMARGS;

  treenode_t *node = new treenode_t(TNT_STRCON, strdup(EMPTYSTRING));
  fmtargs.push_back(format_arg_t(_print_string, node));

  return PRINTF_OK;
}

//-----------------------------------------------------------------------------
static printf_res_t validate_printf_call(format_args_t &fmtargs, const treenode_t *allargs)
{
  if ( allargs == NULL )
    return PRINTF_NOARGS;

  if ( allargs->children[SEQ_CUR]->type() != TNT_STRCON )
    return PRINTF_STRCON;

  const char *fmt = allargs->children[SEQ_CUR]->str();
  if ( strcmp(fmt, EMPTYSTRING) == 0 ) // special case
    return handle_empty_fmt(fmtargs, allargs->children[SEQ_NEXT]);

  // ignore leading, trailing "
  fmt += 1;
  const char *ptr = fmt;
  const char *const end = fmt + strlen(fmt) - 1;
  const char *cursub = ptr;

  tree_iterator_t ti(allargs->children[SEQ_NEXT]);

  for ( ; ptr != end; ptr++ )
  {
    if ( *ptr == '%' && ptr+1 < end )
    {
      char c = *(ptr+1);

      if ( c == FMTS || c == FMTD || c == FMTC )
      {
        prepare_substring_arg(fmtargs, cursub, ptr);
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
              symref_t func = c == FMTD ? _print_int : _print_char;
              fmtargs.push_back(format_arg_t(func, arg));
            }
            break;
          case FMTS:
            {
              if ( !arg->is_string_compat() )
                return PRINTF_BADARG;
              fmtargs.push_back(format_arg_t(_print_string, arg));
            }
            break;
        }
      }
    }
  }

  prepare_substring_arg(fmtargs, cursub, ptr);

  if ( *ti != NULL ) // extra format arguments
    return PRINTF_NUMARGS;

  return PRINTF_OK;
}

//-----------------------------------------------------------------------------
static void cleanup_fmtarg_list(treenode_t *root)
{
  treenode_t *fmt = root->children[SEQ_CUR];
  free(fmt->str()); // original fmt string has been split up; it's no longer needed
  delete fmt;

  // trash the original linked list that contained the fmt args.
  // the args are now maintained by the TNT_PRINTF tree
  for ( treenode_t *ptr = root; ptr != NULL; ptr = ptr->children[SEQ_NEXT] )
    ptr->children[SEQ_CUR] = NULL;

  delete root;
}

//-----------------------------------------------------------------------------
treenode_t *process_printf_call(symref_t printf, treenode_t *allargs, int line)
{
  format_args_t fmtargs;

  printf_res_t res = validate_printf_call(fmtargs, allargs);

  if ( res != PRINTF_OK )
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
    delete allargs;
    return ERRNODE;
  }

  cleanup_fmtarg_list(allargs); // original TNT_ARG sequence longer needed

  return build_printf_tree(printf, fmtargs);
}
