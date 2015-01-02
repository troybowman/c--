#ifndef MIPS_ASM_H
#define MIPS_ASM_H

#include <stdio.h>
#include <symbol.h>
#include <codenode.h>

void mips_asm_generate(ir_t &ir, FILE *outfile);

#endif // MIPS_ASM_H
