#ifndef PARSE_H
#define PARSE_H

#include <stdio.h>
#include <symbol.h>

void parse(FILE &fp, symtab_t &_gsyms, symlist_t &_functions);

#endif // PARSE_H
