#ifndef MIPS_ASM_H
#define MIPS_ASM_H

#include <stdio.h>
struct ir_t;

void generate_mips_asm(FILE *outfile, ir_t &ir);

//-----------------------------------------------------------------------------
#ifndef NDEBUG
struct frame_summary_t;
void print_frame_summary(frame_summary_t &frame, bool is_call_frame);
#define DBG_FRAME_SUMMARY(frame, has_call) print_frame_summary(frame, has_call);
#else
#define DBG_FRAME_SUMMARY(frame, has_call) // nothing
#endif // NDEBUG

#endif // MIPS_ASM_H
