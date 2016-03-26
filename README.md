# c--

This is a compiler.

It translates a subset of c (called 'c minus minus') into mips asm.

See spec/ for language specification and calling convention.


todo:

- refactor symbol table printing
- improve printf code
- char arguments passed in argument registers are not truncated
- short circuit evaluation
- tester: lint, valgrind, fuzz, profile
- why signed ints work with binary operators (sometimes), symplace_t raison d'etre
