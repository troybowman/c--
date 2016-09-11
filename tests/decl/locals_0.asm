#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 1
# sym: func
#   line: 1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func
#-----------------------------------------------------------------------------
# size: 5
# sym: x
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 4
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: z
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: string
#   line: 6
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xa
# sym: vec
#   line: 7
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x5

.data

.text

_func:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+44
  # |              vec               |
  # |--------------------------------| sp+24
  # |             string             |
  # |--------------------------------| sp+12
  # |               z                |
  # |--------------------------------| sp+8
  # |               y                |
  # |--------------------------------| sp+4
  # |               x                |
  # |--------------------------------| sp+0
  la $sp, -48($sp)


__leave_func:
  la $sp, 48($sp)
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
