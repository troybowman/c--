# c--

This is a compiler.

It translates a subset of c (called 'c minus minus') into mips asm.

See spec/ for language specification and calling convention.


todo:

1. char arguments passed in argument registers are not truncated

2. short circuit evaluation

3. don't let real/release phase get out of sync

4. more precise reporting for test failures

5. assg test in temp/

6. fuzz
