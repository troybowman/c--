# c--

This is a compiler.

It translates a subset of c (called 'c minus minus') into mips asm.

See spec/ for language specification and calling convention.


todo:

1. compiler does not exit gracefully after finding an error,
   and we leak memory at exit time.

   purge\_and\_exit() should do some cleanup.

2. char arguments passed in argument registers are not truncated

3. short circuit evaluation still needs to be implemented

4. must define something like const\_tree\_iterator\_t (same for codenode too)
