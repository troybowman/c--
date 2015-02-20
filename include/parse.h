#ifndef PARSE_H
#define PARSE_H

#include <stdio.h>
#include <vector>

//-----------------------------------------------------------------------------
// builtin function names
#define BI_PRINT_INT    "_print_int"
#define BI_PRINT_STRING "_print_string"
#define BI_PRINT_CHAR   "_print_char"

#define FMTS 's'
#define FMTD 'd'
#define FMTC 'c'

class symtab_t;
class treefuncs_t;
struct treenode_t;

// this function initiates the bison parser - it is called from main
void parse(symtab_t &_gsyms, treefuncs_t &_functions, FILE *infile);

//-----------------------------------------------------------------------------
// helps build linear sequences of related treenodes
// (like statements, argument lists, etc)
struct seq_t
{
  treenode_t *head;
  treenode_t *tail;
};

//-----------------------------------------------------------------------------
struct array_sfx_t
{
  int code;
#define ASFX_OK     1
#define ASFX_NONE   0
#define ASFX_ERROR -1
  int size;
};

//-----------------------------------------------------------------------------
struct fdecl_res_t
{
  int code;
#define FDECL_REDECL     1
#define FDECL_BAD_PRINTF 2
#define FDECL_OK         3
#define FDECL_PRINTF_OK  4
  int info;
  fdecl_res_t(int _code, int _info = 0) : code(_code), info(_info) {}
};

//-----------------------------------------------------------------------------
enum col_res_t
{
  COL_OK,
  COL_PARAMS,
  COL_REDECL,
  COL_REDEF,
  COL_EXT,
  COL_RET
};

//-----------------------------------------------------------------------------
enum ret_res_t
{
  RET_EXTRA,
  RET_MISSING,
  RET_INCOMPAT,
  RET_OK,
  RET_OK_RESOLVED
};

//-----------------------------------------------------------------------------
struct call_res_t
{
  int code;
#define CALL_OK       0
#define CALL_BADARG   1
#define CALL_NUMARGS  2
#define CALL_NOFUNC   3
  int info;
  call_res_t(int c, int i = -1) : code(c), info(i) {}
};

//-----------------------------------------------------------------------------
enum cctx_res_t
{
  CCTX_OK,
  CCTX_EXPR,
  CCTX_STMT
};

//-----------------------------------------------------------------------------
enum lookup_res_t
{
  AL_OK,
  AL_ERR_BASE,
  AL_ERR_IDX
};

//-----------------------------------------------------------------------------
struct substring_t
{
  const char *s;
  const char *e;
  substring_t(const char *_s, const char *_e) : s(_s), e(_e) {}
};

//-----------------------------------------------------------------------------
struct printf_arg_t
{
  int type;
#define PF_ARG_STR    0
#define PF_ARG_INT    1
#define PF_ARG_CHAR   2
#define PF_ARG_SUBSTR 3
  union
  {
    const treenode_t *node;
    struct // substring
    {
      const char *s;
      const char *e;
    };
  };
  printf_arg_t(const char *_s, const char *_e)
    : type(PF_ARG_SUBSTR), s(_s), e(_e) {}
  printf_arg_t(int _type, const treenode_t *_node)
    : type(_type), node(_node) {}
};

typedef std::vector<printf_arg_t> printf_args_t;

//-----------------------------------------------------------------------------
enum printf_res_t
{
  PRINTF_OK,
  PRINTF_NOARGS,
  PRINTF_STRCON,
  PRINTF_NUMARGS,
  PRINTF_BADARG,
};

#endif // PARSE_H
