# c--

This is a compiler.

It translates a subset of c (called 'c minus minus') into mips asm.

See spec/ for language specification and calling convention.


todo:

- char arguments passed in argument registers are not truncated
- short circuit evaluation
- don't let real/release phase get out of sync
- tester: lint, valgrind, fuzz, profile
