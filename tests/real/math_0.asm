#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 10
# sym: x
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 4
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: z
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: u
#   line: 6
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: _print_int
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: val
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: _print_hex
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: hex
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: _print_char
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: c
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#     is_extern: yes
# sym: _print_string
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: str
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: yes
# sym: printf
#   line: 8
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 10
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: x
# child RHS for node 2
# node 4: type: TNT_INTCON val: 345
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: y
# child RHS for node 6
# node 8: type: TNT_INTCON val: 10
# child SEQ_NEXT for node 5
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_ASSG
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: x
# child RHS for node 10
# node 12: type: TNT_MINUS
# child LHS for node 12
# node 13: type: TNT_SYMBOL sym: x
# child RHS for node 12
# node 14: type: TNT_SYMBOL sym: y
# child SEQ_NEXT for node 9
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_ASSG
# child LHS for node 16
# node 17: type: TNT_SYMBOL sym: y
# child RHS for node 16
# node 18: type: TNT_NEG
# child RHS for node 18
# node 19: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 15
# node 20: type: TNT_STMT
# child SEQ_CUR for node 20
# node 21: type: TNT_ASSG
# child LHS for node 21
# node 22: type: TNT_SYMBOL sym: x
# child RHS for node 21
# node 23: type: TNT_PLUS
# child LHS for node 23
# node 24: type: TNT_SYMBOL sym: x
# child RHS for node 23
# node 25: type: TNT_SYMBOL sym: y
# child SEQ_NEXT for node 20
# node 26: type: TNT_STMT
# child SEQ_CUR for node 26
# node 27: type: TNT_ASSG
# child LHS for node 27
# node 28: type: TNT_SYMBOL sym: z
# child RHS for node 27
# node 29: type: TNT_DIV
# child LHS for node 29
# node 30: type: TNT_SYMBOL sym: x
# child RHS for node 29
# node 31: type: TNT_SYMBOL sym: y
# child SEQ_NEXT for node 26
# node 32: type: TNT_STMT
# child SEQ_CUR for node 32
# node 33: type: TNT_ASSG
# child LHS for node 33
# node 34: type: TNT_SYMBOL sym: u
# child RHS for node 33
# node 35: type: TNT_MULT
# child LHS for node 35
# node 36: type: TNT_SYMBOL sym: z
# child RHS for node 35
# node 37: type: TNT_SYMBOL sym: y
# child SEQ_NEXT for node 32
# node 38: type: TNT_STMT
# child SEQ_CUR for node 38
# node 39: type: TNT_PRINTF
# child PRINTF_TREE for node 39
# node 40: type: TNT_STMT
# child SEQ_CUR for node 40
# node 41: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 41
# node 42: type: TNT_ARG
# child SEQ_CUR for node 42
# node 43: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 40
# node 44: type: TNT_STMT
# child SEQ_CUR for node 44
# node 45: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 45
# node 46: type: TNT_ARG
# child SEQ_CUR for node 46
# node 47: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 44
# node 48: type: TNT_STMT
# child SEQ_CUR for node 48
# node 49: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 49
# node 50: type: TNT_ARG
# child SEQ_CUR for node 50
# node 51: type: TNT_SYMBOL sym: y
# child SEQ_NEXT for node 48
# node 52: type: TNT_STMT
# child SEQ_CUR for node 52
# node 53: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 53
# node 54: type: TNT_ARG
# child SEQ_CUR for node 54
# node 55: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 52
# node 56: type: TNT_STMT
# child SEQ_CUR for node 56
# node 57: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 57
# node 58: type: TNT_ARG
# child SEQ_CUR for node 58
# node 59: type: TNT_SYMBOL sym: z
# child SEQ_NEXT for node 56
# node 60: type: TNT_STMT
# child SEQ_CUR for node 60
# node 61: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 61
# node 62: type: TNT_ARG
# child SEQ_CUR for node 62
# node 63: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 60
# node 64: type: TNT_STMT
# child SEQ_CUR for node 64
# node 65: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 65
# node 66: type: TNT_ARG
# child SEQ_CUR for node 66
# node 67: type: TNT_SYMBOL sym: u
# child SEQ_NEXT for node 64
# node 68: type: TNT_STMT
# child SEQ_CUR for node 68
# node 69: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 69
# node 70: type: TNT_ARG
# child SEQ_CUR for node 70
# node 71: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  1
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (345)
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
# src1 -> ST_INTCON (10)
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (y)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ZERO
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (y)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (z)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
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
# dest -> ST_PRIMITIVE (u)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
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
# src1 -> ST_FUNCTION (_print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# src1 -> ST_FUNCTION (_print_string)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (y)
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
# src1 -> ST_FUNCTION (_print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# src1 -> ST_FUNCTION (_print_string)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (z)
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
# src1 -> ST_FUNCTION (_print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# src1 -> ST_FUNCTION (_print_string)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (u)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (_print_string)

.data

  _x:
    .space 4

  _y:
    .space 1
    .align 2

  _z:
    .space 4

  _u:
    .space 1
    .align 2

  _str0:
    .asciiz " "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

.text

main:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 16($sp)

  li $t0, 345
  sw $t0, _x
  li $t0, 10
  sb $t0, _y
  lw $t0, _x
  lb $t1, _y
  sub $t2, $t0, $t1
  sw $t2, _x
  li $t0, 2
  sub $t1, $zero, $t0
  sb $t1, _y
  lw $t0, _x
  lb $t1, _y
  addu $t2, $t0, $t1
  sw $t2, _x
  lw $t0, _x
  lb $t1, _y
  div $t2, $t0, $t1
  sw $t2, _z
  lw $t0, _z
  lb $t1, _y
  mul $t2, $t0, $t1
  sb $t2, _u
  lw $t0, _x
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lb $t0, _y
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, _z
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lb $t0, _u
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $ra, 16($sp)
  la $sp, 24($sp)
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
