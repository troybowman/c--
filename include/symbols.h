#ifndef SYMBOL_H
#define SYMBOL_H

#include <stdlib.h>
#include <string>
#include <list>
#include <map>

struct symbol_t;
struct function_t;
struct array_t;

// symbol table
typedef std::map<std::string, symbol_t *> symtab_t;
// for things like: int x, y, z;
typedef std::list<symbol_t *> symlist_t;

extern symtab_t gsyms; // global symbol table
extern symtab_t lsyms; // local symbol table

enum primitive_t
{
  PRIM_UNKNOWN,
  PRIM_INT,
  PRIM_CHAR
};

enum symbol_type_t
{
  ST_UNKNOWN,
  ST_PRIMITIVE,
  ST_ARRAY,
  ST_FUNCTION
};

// array size
typedef int asize_t;

struct array_t
{
  asize_t size;
  primitive_t type;
};

struct symbol_t
{
  int line;
  std::string name;
  symbol_type_t type;
  union
  {
    primitive_t prim;
    array_t array;
    //function_t func;
  };

  symbol_t(char *_name,
           asize_t size,
           int _line) : line(_line), type(ST_ARRAY)
  {
    name.assign(_name);
    array.size = size;
    array.type = PRIM_UNKNOWN;
  }

  symbol_t(char *_name, int _line)
    : line(_line), type(ST_PRIMITIVE)
  {
    name.assign(_name);
    prim = PRIM_UNKNOWN;
  }

  //~symbol_t()
  //{
  //  if ( type == ST_FUNCTION )
  //    func.params.clear()
  //}
};

#endif // SYMBOL_H
