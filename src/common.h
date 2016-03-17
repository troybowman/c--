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

#endif // !NDEBUG

//-----------------------------------------------------------------------------
#define APPCHAR(ptr, end, chr, count) \
do                                    \
{                                     \
  int __count = count;                \
  while ( __count-- > 0 )             \
  {                                   \
    ASSERT(1001, (ptr) < (end));      \
    *(ptr)++ = chr;                   \
  }                                   \
} while ( false )

//-----------------------------------------------------------------------------
#define APPSTR(ptr, end, str, len)     \
do                                     \
{                                      \
  ASSERT(1002, ((ptr)+(len)) < (end)); \
  strncpy((ptr), (str), (len));        \
  (ptr) += len;                        \
} while ( false )

//-----------------------------------------------------------------------------
#define APPZERO(ptr, end)      \
do                             \
{                              \
  ASSERT(1005, (ptr) < (end)); \
  *(ptr) = '\0';               \
} while ( false );

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
typedef uint32_t offset_t;
typedef uint32_t offsize_t;

//-----------------------------------------------------------------------------
#define WORDSIZE 4
#define BADOFFSET offset_t(-1)
#define DWORDSIZE (WORDSIZE*2)
#define ALIGN(off, val) ((off + (val-1)) & ~(val-1))
#define MAXSTR 1024

//-----------------------------------------------------------------------------
struct area_t
{
  offset_t start;
  offset_t end;

  area_t() : start(0), end(0) {}
  area_t(offset_t o1, offset_t o2) : start(o1), end(o2) {}

  offsize_t size() const { return end - start; }
};

//-----------------------------------------------------------------------------
// names of the built-in functions
#define BI_PRINT_STRING "__print_string"
#define BI_PRINT_INT    "__print_int"
#define BI_PRINT_CHAR   "__print_char"
#define BI_PRINT_HEX    "__print_hex"
#define BI_EXIT         "__exit"

#endif // COMMON_H
