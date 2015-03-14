#ifndef PARSE_H
#define PARSE_H

#include <stdio.h>
#include <treenode.h>

class symtab_t;

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
seq_t &seq_append(seq_t &seq, const treenode_t *cur, treenode_type_t type);

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
struct vdecl_res_t
{
  int code;
#define VDECL_OK       0
#define VDECL_BAD_VOID 1
#define VDECL_REDECL   2
  int info;
  vdecl_res_t(int c, int i = -1) : code(c), info(i) {}
};

#endif // PARSE_H
