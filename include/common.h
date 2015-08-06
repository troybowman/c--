#ifndef COMMON_H
#define COMMON_H

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <vector>
#include <string>
#include <map>

//-----------------------------------------------------------------------------
#define INTERR(code)                            \
do                                              \
{                                               \
  /* TODO: if ( debugged ) __asm__("int $3") */ \
  fprintf(stderr, "interr: %d\n", code);        \
  exit(code);                                   \
} while ( false );

//-----------------------------------------------------------------------------
#ifndef NDEBUG

#define ASSERT(code, cond) \
do                         \
{                          \
  if ( !(cond) )           \
    INTERR(code);          \
} while ( false );

#else

#define ASSERT(code, cond) // nothing

#endif

//-----------------------------------------------------------------------------
#define APPCHAR(ptr, c, len) \
do                           \
{                            \
  int _l = len;              \
  while ( _l-- > 0)          \
    { *ptr = c; ptr++; }     \
} while ( false )

#define APPSTR(ptr, str, len) \
do                            \
{                             \
  strncpy(ptr, str, len);     \
  ptr += len;                 \
} while ( false )

//-----------------------------------------------------------------------------
#define cmin(a,b) ((a) < (b) ? (a) : (b))
#define cmax(a,b) ((a) > (b) ? (a) : (b))

//-----------------------------------------------------------------------------
class refcnt_obj_t
{
public:
  int refcnt;

  refcnt_obj_t() : refcnt(1) {}

  virtual void release() = 0;
};

//-----------------------------------------------------------------------------
template <class T> class refcnt_t
{
  T *ptr;

  void delref()
  {
    if ( ptr != NULL && --ptr->refcnt == 0 )
      ptr->release();
  }

public:
  refcnt_t() : ptr(NULL) {}

  explicit refcnt_t(T *p) : ptr(p) {}

  refcnt_t(const refcnt_t &r) : ptr(r.ptr)
  {
    if ( ptr != NULL )
      ptr->refcnt++;
  }

  refcnt_t &operator=(const refcnt_t &r)
  {
    delref();
    ptr = r.ptr;
    if ( ptr != NULL )
      ptr->refcnt++;
    return *this;
  }

  ~refcnt_t() { delref(); }

  void reset()
  {
    delref();
    ptr = NULL;
  }

  operator T *()   const { return ptr; }
  T *operator ->() const { return ptr; }
  T &operator *()  const { return *ptr; }

  bool operator==(const refcnt_t &r) const
  {
    return ptr == r.ptr;
  }
  bool operator!=(const refcnt_t &r) const
  {
    return !(*this == r);
  }
};

//-----------------------------------------------------------------------------
// used to stuff smart pointers into union members
template <class T> inline void emplace(uint8_t const addr[], T &obj)
{
  new ((T *)addr) T(obj);
}

//-----------------------------------------------------------------------------
template <class T> inline T &deplace(uint8_t const addr[])
{
  return *(T *)addr;
}

//-----------------------------------------------------------------------------
template <class T> class reftab_t // table: strings -> smart pointers
{
  typedef std::map<std::string, T> map_t;
  typedef std::vector<T> vec_t;

  map_t map; // fast lookups
  vec_t vec; // maintain insertion order

public:
  T get(const std::string &key) const
  {
    map_t::const_iterator i = map.find(key);
    return i != map.end() ? i->second : T();
  }
  bool insert(const std::string &key, T val)
  {
    if ( val == NULL || get(key) != NULL )
      return false;
    map[key] = val;
    vec.push_back(val);
    return true;
  }
  virtual bool insert(T val)
  {
    return false;
  }

#define DEFINE_TABLE_ITERATOR(iterator, begin, end)      \
  typedef vec_t::iterator iterator;                      \
  typedef vec_t::const_##iterator const_##iterator;      \
  iterator begin() { return vec.begin(); }               \
  iterator end()   { return vec.end(); }                 \
  const_##iterator begin() const { return vec.begin(); } \
  const_##iterator end()   const { return vec.end(); }

  DEFINE_TABLE_ITERATOR(iterator, begin, end)
  DEFINE_TABLE_ITERATOR(reverse_iterator, rbegin, rend)

#undef DEFINE_TABLE_ITERATOR

  size_t size()    const { return vec.size(); }
  T back()         const { return vec.back(); }
  void swap(symtab_t &r) { map.swap(r.map); vec.swap(r.vec); }
  void clear()           { map.clear(); vec.clear(); }

  void assign_to(vec_t &out)
  {
    out.assign(vec.begin(), vec.end());
  }
};

//-----------------------------------------------------------------------------
#ifndef __EA64__
typedef uint32_t offset_t;
#else
typedef uint64_t offset_t;
#endif

#define WORDSIZE  sizeof(offset_t)
#define BADOFFSET offset_t(-1)
#define DWORDSIZE (WORDSIZE*2)
#define ALIGN(off, val) ((off + (val-1)) & ~(val-1))

//-----------------------------------------------------------------------------
struct area_t
{
  offset_t start;
  offset_t end;

  area_t() : start(0), end(0) {}
  area_t(offset_t o1, offset_t o2) : start(o1), end(o2) {}

  offset_t size() const { return end - start; }
};

// names of the built-in print functions
#define BI_PRINT_STRING "_print_string"
#define BI_PRINT_INT    "_print_int"
#define BI_PRINT_CHAR   "_print_char"
#define BI_PRINT_HEX    "_print_hex"

#endif // COMMON_H
