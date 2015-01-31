#include <stdint.h>

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

struct area_t
{
  offset_t start;
  offset_t end;
  area_t() : start(0), end(0) {}
  area_t(offset_t o1, offset_t o2) : start(o1), end(o2) {}
  offsize_t size() { return end - start; }
};
