#ifndef SYMBOL_H
#define SYMBOL_H

#include <vector>
#include <string>
#include <list>
#include <map>

#include <messages.h>

struct symbol_t;
struct function_t;
struct array_t;
struct treenode_t;
class symtab_t;

typedef std::list<symbol_t *> symlist_t;

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
  bool defined;
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

//-----------------------------------------------------------------------------
class symtab_t // symbol table
{
  typedef std::map<std::string, symbol_t *> smap_t;

  smap_t map;

public:
  symbol_t *get(const std::string &key)
  {
    try { return map.at(key); }
    catch ( const std::out_of_range & ) { return NULL; }
  }

  void insert(symbol_t *value)
  {
    ASSERT(1013, value != NULL);
    map[value->name] = value;
  }

  typedef smap_t::iterator iterator;
  typedef smap_t::const_iterator const_iterator;

  iterator begin() { return map.begin(); }
  iterator end() { return map.end(); }
  const_iterator begin() const { return map.begin(); }
  const_iterator end() const { return map.end(); }

  size_t size() const { return map.size(); }
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

#endif // SYMBOL_H
