#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 3
# sym: print_string
#   line: 1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: str
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: yes
# sym: print_int
#   line: 2
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: printf
#   line: 6
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: str
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: printf
#-----------------------------------------------------------------------------
# size: 2
# sym: format
#   line: 6
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: str
#   line: 6
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff

.data

.text

_printf:

  # |--------------------------------|
  # |        <str is in $a1>         |
  # |--------------------------------| sp+4
  # |       <format is in $a0>       |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_printf:
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
