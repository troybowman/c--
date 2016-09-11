#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 24
# sym: a
#   line: 1
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: b
#   line: 2
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: c
#   line: 4
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x3
# sym: d
#   line: 5
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x5
# sym: X_1
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: X__2
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: bunch_of_under_scores
#   line: 10
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: even_more_under_scores
#   line: 11
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xfa0
# sym: one
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: two
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: three
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: four
#   line: 14
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: five
#   line: 14
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: six
#   line: 14
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: seven
#   line: 14
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: eight
#   line: 14
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: nine
#   line: 15
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: ten
#   line: 15
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xa
# sym: eleven
#   line: 15
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xb
# sym: twelve
#   line: 15
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: str1
#   line: 17
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x1
# sym: str2
#   line: 17
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x2
# sym: str3
#   line: 17
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x3
# sym: ch
#   line: 17
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR

.data

  _a:
    .space 4

  _b:
    .space 1
    .align 2

  _c:
    .space 12

  _d:
    .space 5
    .align 2

  _X_1:
    .space 4

  _X__2:
    .space 4

  _bunch_of_under_scores:
    .space 1
    .align 2

  _even_more_under_scores:
    .space 16000

  _one:
    .space 4

  _two:
    .space 4

  _three:
    .space 4

  _four:
    .space 1
    .align 2

  _five:
    .space 1
    .align 2

  _six:
    .space 1
    .align 2

  _seven:
    .space 1
    .align 2

  _eight:
    .space 1
    .align 2

  _nine:
    .space 4

  _ten:
    .space 40

  _eleven:
    .space 44

  _twelve:
    .space 4

  _str1:
    .space 1
    .align 2

  _str2:
    .space 2
    .align 2

  _str3:
    .space 3
    .align 2

  _ch:
    .space 1
    .align 2

.text

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
