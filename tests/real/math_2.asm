#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 9
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
# sym: __print_int
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: val
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: __print_hex
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: hex
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: __print_char
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: c
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#     is_extern: yes
# sym: __print_string
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: str
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: yes
# sym: printf
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 7
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 3
# sym: a
#   line: 9
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: b
#   line: 9
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: c
#   line: 9
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: x
# child RHS for node 2
# node 4: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: y
# child RHS for node 6
# node 8: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 5
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_ASSG
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: z
# child RHS for node 10
# node 12: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 9
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_ASSG
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: a
# child RHS for node 14
# node 16: type: TNT_MULT
# child LHS for node 16
# node 17: type: TNT_CHARCON str: 'a'
# child RHS for node 16
# node 18: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 13
# node 19: type: TNT_STMT
# child SEQ_CUR for node 19
# node 20: type: TNT_PRINTF
# child PRINTF_TREE for node 20
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 22
# node 23: type: TNT_ARG
# child SEQ_CUR for node 23
# node 24: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 21
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 26
# node 27: type: TNT_ARG
# child SEQ_CUR for node 27
# node 28: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 19
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_ASSG
# child LHS for node 30
# node 31: type: TNT_SYMBOL sym: b
# child RHS for node 30
# node 32: type: TNT_DIV
# child LHS for node 32
# node 33: type: TNT_MULT
# child LHS for node 33
# node 34: type: TNT_SYMBOL sym: a
# child RHS for node 33
# node 35: type: TNT_PLUS
# child LHS for node 35
# node 36: type: TNT_SYMBOL sym: x
# child RHS for node 35
# node 37: type: TNT_SYMBOL sym: y
# child RHS for node 32
# node 38: type: TNT_SYMBOL sym: z
# child SEQ_NEXT for node 29
# node 39: type: TNT_STMT
# child SEQ_CUR for node 39
# node 40: type: TNT_PRINTF
# child PRINTF_TREE for node 40
# node 41: type: TNT_STMT
# child SEQ_CUR for node 41
# node 42: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 42
# node 43: type: TNT_ARG
# child SEQ_CUR for node 43
# node 44: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 41
# node 45: type: TNT_STMT
# child SEQ_CUR for node 45
# node 46: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 46
# node 47: type: TNT_ARG
# child SEQ_CUR for node 47
# node 48: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 39
# node 49: type: TNT_STMT
# child SEQ_CUR for node 49
# node 50: type: TNT_ASSG
# child LHS for node 50
# node 51: type: TNT_SYMBOL sym: b
# child RHS for node 50
# node 52: type: TNT_MULT
# child LHS for node 52
# node 53: type: TNT_DIV
# child LHS for node 53
# node 54: type: TNT_SYMBOL sym: a
# child RHS for node 53
# node 55: type: TNT_PLUS
# child LHS for node 55
# node 56: type: TNT_SYMBOL sym: x
# child RHS for node 55
# node 57: type: TNT_SYMBOL sym: y
# child RHS for node 52
# node 58: type: TNT_SYMBOL sym: z
# child SEQ_NEXT for node 49
# node 59: type: TNT_STMT
# child SEQ_CUR for node 59
# node 60: type: TNT_PRINTF
# child PRINTF_TREE for node 60
# node 61: type: TNT_STMT
# child SEQ_CUR for node 61
# node 62: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 62
# node 63: type: TNT_ARG
# child SEQ_CUR for node 63
# node 64: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 61
# node 65: type: TNT_STMT
# child SEQ_CUR for node 65
# node 66: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 66
# node 67: type: TNT_ARG
# child SEQ_CUR for node 67
# node 68: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 59
# node 69: type: TNT_STMT
# child SEQ_CUR for node 69
# node 70: type: TNT_ASSG
# child LHS for node 70
# node 71: type: TNT_SYMBOL sym: c
# child RHS for node 70
# node 72: type: TNT_PLUS
# child LHS for node 72
# node 73: type: TNT_MINUS
# child LHS for node 73
# node 74: type: TNT_MULT
# child LHS for node 74
# node 75: type: TNT_DIV
# child LHS for node 75
# node 76: type: TNT_SYMBOL sym: a
# child RHS for node 75
# node 77: type: TNT_PLUS
# child LHS for node 77
# node 78: type: TNT_SYMBOL sym: x
# child RHS for node 77
# node 79: type: TNT_SYMBOL sym: y
# child RHS for node 74
# node 80: type: TNT_SYMBOL sym: z
# child RHS for node 73
# node 81: type: TNT_SYMBOL sym: a
# child RHS for node 72
# node 82: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 69
# node 83: type: TNT_STMT
# child SEQ_CUR for node 83
# node 84: type: TNT_PRINTF
# child PRINTF_TREE for node 84
# node 85: type: TNT_STMT
# child SEQ_CUR for node 85
# node 86: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 86
# node 87: type: TNT_ARG
# child SEQ_CUR for node 87
# node 88: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 85
# node 89: type: TNT_STMT
# child SEQ_CUR for node 89
# node 90: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 90
# node 91: type: TNT_ARG
# child SEQ_CUR for node 91
# node 92: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  1
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (y)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (z)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('a')
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (a)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("\n")
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_string)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (b)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("\n")
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_string)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (b)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("\n")
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_string)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (c)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("\n")
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (__print_string)

.data

  _x:
    .space 4

  _y:
    .space 4

  _z:
    .space 4

  _str0:
    .asciiz "\n"
    .align 2

.text

main:

  # |--------------------------------|
  # |      <saved value of $a0>      |
  # |--------------------------------| sp+40  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+36
  # |               c                |
  # |--------------------------------| sp+32
  # |               b                |
  # |--------------------------------| sp+28
  # |               a                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -40($sp)
  sw $ra, 16($sp)
  sw $a0, 40($sp)

  li $t0, 2
  sw $t0, _x
  li $t0, 3
  sw $t0, _y
  li $t0, 4
  sw $t0, _z
  li $t0, 'a'
  lw $t1, _x
  mul $t2, $t0, $t1
  sb $t2, 24($sp)
  lb $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lb $t0, 24($sp)
  lw $t1, _x
  lw $t2, _y
  addu $t3, $t1, $t2
  mul $t1, $t0, $t3
  lw $t0, _z
  div $t2, $t1, $t0
  sb $t2, 28($sp)
  lb $t0, 28($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lb $t0, 24($sp)
  lw $t1, _x
  lw $t2, _y
  addu $t3, $t1, $t2
  div $t1, $t0, $t3
  lw $t0, _z
  mul $t2, $t1, $t0
  sb $t2, 28($sp)
  lb $t0, 28($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lb $t0, 24($sp)
  lw $t1, _x
  lw $t2, _y
  addu $t3, $t1, $t2
  div $t1, $t0, $t3
  lw $t0, _z
  mul $t2, $t1, $t0
  lb $t0, 24($sp)
  sub $t1, $t2, $t0
  lb $t0, 28($sp)
  addu $t2, $t1, $t0
  sb $t2, 32($sp)
  lb $t0, 32($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a0, 40($sp)
  lw $ra, 16($sp)
  la $sp, 40($sp)
  jal __exit

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
