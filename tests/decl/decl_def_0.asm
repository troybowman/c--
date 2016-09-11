#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 9
# sym: func1
#   line: 18
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
# sym: func2
#   line: 19
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: one
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: two
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#       2: three
#         type: ST_ARRAY
#           base: PRIM_INT
#       3: four
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
# sym: ignoreme
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
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
#     is_extern: yes
# sym: func3
#   line: 20
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: y
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
# sym: func4
#   line: 14
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: aa
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: bb
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       2: cc
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       3: dd
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#     is_extern: no
# sym: func5
#   line: 13
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: aa
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: bb
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#     is_extern: no
# sym: func6
#   line: 12
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
# sym: func7
#   line: 11
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: aa
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
# sym: emp
#   line: 16
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func7
#-----------------------------------------------------------------------------
# size: 1
# sym: aa
#   line: 11
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func6
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func5
#-----------------------------------------------------------------------------
# size: 2
# sym: aa
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: bb
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func4
#-----------------------------------------------------------------------------
# size: 4
# sym: aa
#   line: 14
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: bb
#   line: 14
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: cc
#   line: 14
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: dd
#   line: 14
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: emp
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func1
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func2
#-----------------------------------------------------------------------------
# size: 4
# sym: one
#   line: 19
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: two
#   line: 19
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: three
#   line: 19
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
# sym: four
#   line: 19
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func3
#-----------------------------------------------------------------------------
# size: 1
# sym: y
#   line: 20
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff

.data

.text

_func7:

  # |--------------------------------|
  # |         <aa is in $a0>         |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_func7:
  jr $ra

_func6:

  # |--------------------------------|


__leave_func6:
  jr $ra

_func5:

  # |--------------------------------|
  # |         <bb is in $a1>         |
  # |--------------------------------| sp+4
  # |         <aa is in $a0>         |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_func5:
  jr $ra

_func4:

  # |--------------------------------|
  # |         <dd is in $a3>         |
  # |--------------------------------| sp+12
  # |         <cc is in $a2>         |
  # |--------------------------------| sp+8
  # |         <bb is in $a1>         |
  # |--------------------------------| sp+4
  # |         <aa is in $a0>         |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_func4:
  jr $ra

_emp:

  # |--------------------------------|


__leave_emp:
  jr $ra

_func1:

  # |--------------------------------|


__leave_func1:
  jr $ra

_func2:

  # |--------------------------------|
  # |        <four is in $a3>        |
  # |--------------------------------| sp+12
  # |       <three is in $a2>        |
  # |--------------------------------| sp+8
  # |        <two is in $a1>         |
  # |--------------------------------| sp+4
  # |        <one is in $a0>         |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_func2:
  jr $ra

_func3:

  # |--------------------------------|
  # |         <y is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_func3:
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
