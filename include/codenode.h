#ifndef CODENODE_H
#define CODENODE_H

#include <symbol.h>

// intermediate code summary
struct ir_summary_t
{
  symtab_t  *gsyms;
  symlist_t *labels;
  symlist_t *strings;
  symlist_t *functions;
};

enum codenode_type_t
{
  CNT_PROLOGUE,
  CNT_EPILOGUE,
  CNT_PLUS,
  CNT_MINUS,
  CNT_MULT,
  CNT_DIV,
  CNT_BRANCH,
  CNT_CALL,
  CNT_ARG
};

struct codenode_t
{
  codenode_type_t type;
  symbol_t *dest;
  symbol_t *src1;
  symbol_t *src2;
  codenode_t *next;
};

#endif // CODENODE_H
