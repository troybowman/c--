#ifndef SYMBOL_H
#define SYMBOL_H

#include <stdlib.h>

#include <vector>
#include <string>
#include <list>
#include <map>

#include <treenode.h>

struct symbol_t;
struct function_t;
struct array_t;

//-----------------------------------------------------------------------------
// symbol table
typedef std::map<std::string, symbol_t *> symtab_t;

// for things like: int x, y, z;
typedef std::list<symbol_t *> symlist_t;

// allow anyone who includes this file to have access to
// the global and local symbol tables
extern symtab_t gsyms;
extern symtab_t lsyms;

//-----------------------------------------------------------------------------
enum symbol_type_t
{
  ST_UNKNOWN = -1,
  ST_PRIMITIVE,
  ST_ARRAY,
  ST_FUNCTION
};

//-----------------------------------------------------------------------------
enum primitive_t
{
  PRIM_UNKNOWN = -1,
  PRIM_INT,
  PRIM_CHAR
};

//-----------------------------------------------------------------------------
typedef int asize_t; // array size

struct array_t
{
  asize_t size;
  primitive_t type;
};

//-----------------------------------------------------------------------------
enum return_type_t
{
  RT_UNKNOWN = PRIM_UNKNOWN,
  RT_INT     = PRIM_INT,
  RT_CHAR    = PRIM_CHAR,
  RT_VOID
};

typedef std::vector<symbol_t *> paramvec_t;

struct function_t
{
  return_type_t rt_type;
  paramvec_t *params;
  symtab_t *symbols;
  treenode_t *syntax_tree;
  bool is_extern;
};

//-----------------------------------------------------------------------------
struct symbol_t
{
  int off;   // offset from fp
  int line;  // src line
  std::string name;
  symbol_type_t type;
  union
  {
    primitive_t prim;
    array_t array;
    function_t func;
  };

  symbol_t(const char *_name, int _line, symbol_type_t _type, ...)
    : off(0), line(_line), type(_type)
  {
    name.assign(_name);

    va_list va;
    va_start(va, _type);
    switch ( _type )
    {
      case ST_PRIMITIVE:
        prim = va_arg(va, primitive_t);
        break;
      case ST_ARRAY:
        array.type = va_arg(va, primitive_t);
        array.size = va_arg(va, asize_t);
        break;
      case ST_FUNCTION:
        func.rt_type     = va_arg(va, return_type_t);
        func.params      = va_arg(va, paramvec_t *);
        func.symbols     = va_arg(va, symtab_t *);
        func.syntax_tree = va_arg(va, treenode_t *);
        func.is_extern   = va_arg(va, bool);
        break;
      default:
        type = ST_UNKNOWN;
        break;
    }
    va_end(va);
  }

  ~symbol_t()
  {
    if ( type == ST_FUNCTION && func.params != NULL )
      func.params->clear();
      // and symbol table
      // and syntax tree
  }
};

#endif // SYMBOL_H
