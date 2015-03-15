#ifndef PRO_H
#define PRO_H

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

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
  int l = len;               \
  while ( l-- > 0)           \
    { *ptr = c; ptr++; }     \
} while ( false ) ;

#define APPSTR(ptr, str, len) \
do                            \
{                             \
  strncpy(ptr, str, len);     \
  ptr += len;                 \
} while ( false )

//-----------------------------------------------------------------------------
#define cmin(a,b) ((a) < (b)? (a) : (b))
#define cmax(a,b) ((a) > (b)? (a) : (b))

//-----------------------------------------------------------------------------
class refcnt_obj_t
{
public:
  int refcnt;

  refcnt_obj_t() : refcnt(1) {}

  virtual void release() = 0;
};

//-----------------------------------------------------------------------------
template <class T>
class refcnt_t
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

  bool operator==(refcnt_t r) const
  {
    return ptr == r.ptr;
  }
  bool operator!=(refcnt_t r) const
  {
    return !(*this == r);
  }
};

//-----------------------------------------------------------------------------
// used to stuff smart pointers into union members. because I said so.
template <class T> inline void unionize(uint8_t const addr[], T &obj)
{
  new ((T *)addr) T(obj);
}
template <class T> inline T &deunionize(uint8_t const addr[])
{
  return *(T *)addr;
}

//-----------------------------------------------------------------------------
#ifndef __EA64__
typedef uint32_t offset_t;
typedef uint32_t offsize_t;
#define WORDSIZE 4
#else
typedef uint64_t offset_t;
typedef uint64_t offsize_t;
#define WORDSIZE 8
#endif

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

  offsize_t size() const { return end - start; }
};

#endif // PRO_H
