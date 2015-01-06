#ifndef MIPS_ASM_H
#define MIPS_ASM_H

#include <stdio.h>
struct ir_t;

void generate_mips_asm(FILE *outfile, ir_t &ir);

#endif // MIPS_ASM_H
