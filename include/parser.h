#ifndef PARSER_H
#define PARSER_H

#include <symbol.h>
#include <treenode.h>

struct parse_results_t;

//-----------------------------------------------------------------------------
bool parse(parse_results_t &res, FILE *infile);

//-----------------------------------------------------------------------------
typedef std::vector<std::string> errvec_t;

//-----------------------------------------------------------------------------
struct parse_results_t
{
  symtab_t gsyms;
  structab_t structs;
  stx_trees_t trees;
  errvec_t errmsgs;

  void swap(parse_results_t &res);
};

//-----------------------------------------------------------------------------
enum type_error_t
{
  TERR_OK,          // full type consistency
  TERR_OK2,         // full type consistency, with details
  TERR_NO_RET,      // non-void function is missing a return statement
  TERR_BAD_RET,     // void function returns a value
  TERR_RET_EXPR,    // return expression does not match return type
  TERR_PARAMS,      // parameter mismatch between func def/decl
  TERR_REDECLARED,  // variable or function redeclared
  TERR_REDEFINED,   // function redefined
  TERR_EXTERN,      // definition of function declared extern
  TERR_RTN_TYPES,   // return type mismatch between func def/decl
  TERR_BADARG,      // incompatible function argument
  TERR_NUMARGS,     // invalid number of args passed to function
  TERR_NOFUNC,      // () used on a symbol that is not a function
  TERR_VOID_EXPR,   // void function called inside expression
  TERR_PROCEDURE,   // non-void function called as a statement
  TERR_BASE,        // [] used on a symbol that is not an array
  TERR_INDEX,       // invalid expression for array index
  TERR_BAD_VOID,    // variable declared void
  TERR_ASFX,        // invalid array size
  TERR_PRINTF_DECL, // printf incorrectly declared
  TERR_PRINTF_DEF1, // printf defined as standalone function
  TERR_PRINTF_DEF2, // printf declared and defined later
  TERR_NUM_FMT,     // # of fmt args != # of format specifiers
  TERR_NO_FMT,      // no arguments passed to printf
  TERR_BAD_FMT,     // format arg does not match format specifier
  TERR_FMTSTR,      // format string not a string constant
  TERR_NO_STRUCT,   // '.' or '->' used on a variable that is not a structure
  TERR_NO_MEM,      // request for nonexistent udt member
  TERR_INCOMPLETE,  // invalid use of incomplete type
  TERR_ADDROF,      // invalid use of '&'
  TERR_RET_STRUCT,  // functions cant return struct types. TODO: fix that
  TERR_ASSG_LVAL,   // lhs of assignment does not resolve to a memory location
  TERR_ASSG_ARRAY,  // assignment to an array is not valid
  TERR_ASSG_COMPAT, // assignment operands have incompatible types
  TERR_ASGG_STRUCT  // structs are not assignable. TODO: fix that
};

//-----------------------------------------------------------------------------
struct terr_info_t
{
  type_error_t code;
  int data;
  terr_info_t(type_error_t _code, int _data = 0)
    : code(_code), data(_data) {}
};

//---------------------------------------------------------------------------
struct name_info_t
{
  char *str;
  uint32_t flags;
};

#endif // !PARSER_H
