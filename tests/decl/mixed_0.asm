#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 13
# sym: buf
#   line: 1
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x14
# sym: bufsize
#   line: 2
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: x
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: z
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: func1
#   line: 10
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: buf
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: bufsize
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: func2
#   line: 16
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: buf
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: bufsize
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: func3
#   line: 24
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: buf
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: bufsize
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: a
#   line: 21
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x5
# sym: b
#   line: 21
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xa
# sym: c
#   line: 21
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xf
# sym: func4
#   line: 33
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: y
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       2: z
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       3: func1
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#       4: func2
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#       5: func3
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#       6: a
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       7: b
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       8: c
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
# sym: end
#   line: 38
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func1
#-----------------------------------------------------------------------------
# size: 5
# sym: buf
#   line: 10
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: bufsize
#   line: 10
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: x
#   line: 12
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 12
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: z
#   line: 12
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func2
#-----------------------------------------------------------------------------
# size: 5
# sym: buf
#   line: 16
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: bufsize
#   line: 16
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: x
#   line: 18
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 18
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: z
#   line: 18
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func3
#-----------------------------------------------------------------------------
# size: 8
# sym: buf
#   line: 24
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: bufsize
#   line: 24
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: x
#   line: 26
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 26
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: z
#   line: 26
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: a
#   line: 27
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x5
# sym: b
#   line: 27
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xa
# sym: c
#   line: 27
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xf
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func4
#-----------------------------------------------------------------------------
# size: 9
# sym: x
#   line: 31
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 31
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: z
#   line: 31
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: func1
#   line: 32
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: func2
#   line: 32
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: func3
#   line: 32
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: a
#   line: 33
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: b
#   line: 33
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: c
#   line: 33
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff

.data

  _buf:
    .space 20
    .align 2

  _bufsize:
    .space 4

  _x:
    .space 4

  _y:
    .space 4

  _z:
    .space 4

  _a:
    .space 5
    .align 2

  _b:
    .space 10
    .align 2

  _c:
    .space 15
    .align 2

  _end:
    .space 4

.text

_func1:

  # |--------------------------------|
  # |      <bufsize is in $a1>       |
  # |--------------------------------| sp+20
  # |        <buf is in $a0>         |
  # |--------------------------------| sp+16  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+12
  # |               z                |
  # |--------------------------------| sp+8
  # |               y                |
  # |--------------------------------| sp+4
  # |               x                |
  # |--------------------------------| sp+0
  la $sp, -16($sp)


__leave_func1:
  la $sp, 16($sp)
  jr $ra

_func2:

  # |--------------------------------|
  # |      <bufsize is in $a1>       |
  # |--------------------------------| sp+20
  # |        <buf is in $a0>         |
  # |--------------------------------| sp+16  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+12
  # |               z                |
  # |--------------------------------| sp+8
  # |               y                |
  # |--------------------------------| sp+4
  # |               x                |
  # |--------------------------------| sp+0
  la $sp, -16($sp)


__leave_func2:
  la $sp, 16($sp)
  jr $ra

_func3:

  # |--------------------------------|
  # |      <bufsize is in $a1>       |
  # |--------------------------------| sp+52
  # |        <buf is in $a0>         |
  # |--------------------------------| sp+48  <-- start of caller's frame
  # |               c                |
  # |--------------------------------| sp+32
  # |               b                |
  # |--------------------------------| sp+20
  # |               a                |
  # |--------------------------------| sp+12
  # |               z                |
  # |--------------------------------| sp+8
  # |               y                |
  # |--------------------------------| sp+4
  # |               x                |
  # |--------------------------------| sp+0
  la $sp, -48($sp)


__leave_func3:
  la $sp, 48($sp)
  jr $ra

_func4:

  # |--------------------------------|
  # |               c                |
  # |--------------------------------| sp+32
  # |               b                |
  # |--------------------------------| sp+28
  # |               a                |
  # |--------------------------------| sp+24
  # |             func3              |
  # |--------------------------------| sp+20
  # |             func2              |
  # |--------------------------------| sp+16
  # |       <func1 is in $a3>        |
  # |--------------------------------| sp+12
  # |         <z is in $a2>          |
  # |--------------------------------| sp+8
  # |         <y is in $a1>          |
  # |--------------------------------| sp+4
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_func4:
  jr $ra

__print_string:
  li $v0, 4
  syscall
  jr $ra

__print_int:
  li $v0, 1
  syscall
  jr $ra

__print_char:
  li $v0, 11
  syscall
  jr $ra

__print_hex:
  li $v0, 34
  syscall
  jr $ra

__exit:
  li $v0, 10
  syscall
  jr $ra
