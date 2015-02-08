#ifndef PARSE_H
#define PARSE_H

#include <stdio.h>

class symtab_t;
class treefuncs_t;
struct treenode_t;

// this function initiates the bison parser - it is called from main
void parse(symtab_t &_gsyms, treefuncs_t &_functions, FILE *infile);

//-----------------------------------------------------------------------------
// helps build linear sequences of related treenodes
// (like statements, argument lists, etc)
struct seq_t
{
  treenode_t *head;
  treenode_t *tail;
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

#endif // PARSE_H
