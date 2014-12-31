#ifndef PARSE_H
#define PARSE_H

#include <stdio.h>
#include <symbol.h>

void parse(symtab_t &_gsyms, symlist_t &_functions, FILE &infile);

#endif // PARSE_H
