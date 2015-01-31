#include <stdint.h>

#ifndef __EA64__
typedef uint32_t ea_t;
typedef uint32_t asize_t;
#define WORDSIZE 4
#else
typedef uint64_t ea_t;
typedef uint64_t asize_t;
#define WORDSIZE 8
#endif

#define BADADDR ea_t(-1)

struct area_t
{
  ea_t startEA;
  ea_t endEA;
  area_t() : startEA(0), endEA(0) {}
  area_t(ea_t ea1, ea_t ea2) : startEA(ea1), endEA(ea2) {}
  asize_t size() { return endEA - startEA; }
};
