#ifndef PARSE_H
#define PARSE_H

#include <stdio.h>

class symtab_t;
class treefuncs_t;

//-----------------------------------------------------------------------------
// this function initiates the bison parser - it is called from main
void parse(symtab_t &_gsyms, treefuncs_t &_functions, FILE *infile);

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
  TERR_BAD_PRINTF,  // printf incorrectly declared
  TERR_BADARG,      // incompatible function argument
  TERR_NUMARGS,     // invalid number of args passed to function
  TERR_NOFUNC,      // () used on a symbol that is not a function
  TERR_VOID_EXPR,   // void function called inside expression
  TERR_PROCEDURE,   // non-void function called as a statement
  TERR_BASE,        // [] used on a symbol that is not an array
  TERR_INDEX,       // invalid expression for array index
  TERR_BAD_VOID,    // variable declared void
  TERR_ASFX,        // invalid array size
};

//-----------------------------------------------------------------------------
struct terr_info_t
{
  type_error_t code;
  int data;
  terr_info_t(type_error_t _code, int _data = 0)
    : code(_code), data(_data) {}
};

#endif // PARSE_H
