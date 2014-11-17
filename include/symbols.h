#ifndef SYMBOL_H
#define SYMBOL_H

#include <vector>
#include <string>
#include <list>
#include <map>

#include <treenode.h>

struct symbol_t;
struct function_t;
struct array_t;

//-----------------------------------------------------------------------------
class symtab_t : public std::map<std::string, symbol_t *>
{
public:
  ~symtab_t();
};

typedef std::list<symbol_t *> symlist_t; // for things like: int x, y, z;

extern symtab_t gsyms;
extern symlist_t functions;

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

  symbol_t(const char *, int, symbol_type_t, ...);
  ~symbol_t();
};

#endif // SYMBOL_H
