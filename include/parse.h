#ifndef PARSE_H
#define PARSE_H

#include <stdio.h>
class symtab_t;
class symlist_t;

// this function initiates the bison parser - it called from main
void parse(symtab_t &_gsyms, symlist_t &_functions, FILE *infile);

#endif // PARSE_H
