#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 13
# sym: a
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: b
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: c
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: d
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: e
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: LIM
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: res
#   line: 4
#   type: ST_PRIMITIVE
#     base: PRIM_INT
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
#   line: 6
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 8
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
# node 3: type: TNT_SYMBOL sym: a
# child RHS for node 2
# node 4: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: LIM
# child RHS for node 6
# node 8: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 5
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_ASSG
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: res
# child RHS for node 10
# node 12: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 9
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_WHILE
# child WHILE_COND for node 14
# node 15: type: TNT_LT
# child LHS for node 15
# node 16: type: TNT_SYMBOL sym: a
# child RHS for node 15
# node 17: type: TNT_SYMBOL sym: LIM
# child WHILE_BODY for node 14
# node 18: type: TNT_STMT
# child SEQ_CUR for node 18
# node 19: type: TNT_ASSG
# child LHS for node 19
# node 20: type: TNT_SYMBOL sym: b
# child RHS for node 19
# node 21: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 18
# node 22: type: TNT_STMT
# child SEQ_CUR for node 22
# node 23: type: TNT_WHILE
# child WHILE_COND for node 23
# node 24: type: TNT_LT
# child LHS for node 24
# node 25: type: TNT_SYMBOL sym: b
# child RHS for node 24
# node 26: type: TNT_SYMBOL sym: LIM
# child WHILE_BODY for node 23
# node 27: type: TNT_STMT
# child SEQ_CUR for node 27
# node 28: type: TNT_ASSG
# child LHS for node 28
# node 29: type: TNT_SYMBOL sym: c
# child RHS for node 28
# node 30: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 27
# node 31: type: TNT_STMT
# child SEQ_CUR for node 31
# node 32: type: TNT_WHILE
# child WHILE_COND for node 32
# node 33: type: TNT_LT
# child LHS for node 33
# node 34: type: TNT_SYMBOL sym: c
# child RHS for node 33
# node 35: type: TNT_SYMBOL sym: LIM
# child WHILE_BODY for node 32
# node 36: type: TNT_STMT
# child SEQ_CUR for node 36
# node 37: type: TNT_ASSG
# child LHS for node 37
# node 38: type: TNT_SYMBOL sym: d
# child RHS for node 37
# node 39: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 36
# node 40: type: TNT_STMT
# child SEQ_CUR for node 40
# node 41: type: TNT_WHILE
# child WHILE_COND for node 41
# node 42: type: TNT_LT
# child LHS for node 42
# node 43: type: TNT_SYMBOL sym: d
# child RHS for node 42
# node 44: type: TNT_SYMBOL sym: LIM
# child WHILE_BODY for node 41
# node 45: type: TNT_STMT
# child SEQ_CUR for node 45
# node 46: type: TNT_ASSG
# child LHS for node 46
# node 47: type: TNT_SYMBOL sym: e
# child RHS for node 46
# node 48: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 45
# node 49: type: TNT_STMT
# child SEQ_CUR for node 49
# node 50: type: TNT_WHILE
# child WHILE_COND for node 50
# node 51: type: TNT_LT
# child LHS for node 51
# node 52: type: TNT_SYMBOL sym: e
# child RHS for node 51
# node 53: type: TNT_SYMBOL sym: LIM
# child WHILE_BODY for node 50
# node 54: type: TNT_STMT
# child SEQ_CUR for node 54
# node 55: type: TNT_ASSG
# child LHS for node 55
# node 56: type: TNT_SYMBOL sym: res
# child RHS for node 55
# node 57: type: TNT_PLUS
# child LHS for node 57
# node 58: type: TNT_SYMBOL sym: res
# child RHS for node 57
# node 59: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 54
# node 60: type: TNT_STMT
# child SEQ_CUR for node 60
# node 61: type: TNT_ASSG
# child LHS for node 61
# node 62: type: TNT_SYMBOL sym: e
# child RHS for node 61
# node 63: type: TNT_PLUS
# child LHS for node 63
# node 64: type: TNT_SYMBOL sym: e
# child RHS for node 63
# node 65: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 49
# node 66: type: TNT_STMT
# child SEQ_CUR for node 66
# node 67: type: TNT_ASSG
# child LHS for node 67
# node 68: type: TNT_SYMBOL sym: d
# child RHS for node 67
# node 69: type: TNT_PLUS
# child LHS for node 69
# node 70: type: TNT_SYMBOL sym: d
# child RHS for node 69
# node 71: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 40
# node 72: type: TNT_STMT
# child SEQ_CUR for node 72
# node 73: type: TNT_ASSG
# child LHS for node 73
# node 74: type: TNT_SYMBOL sym: c
# child RHS for node 73
# node 75: type: TNT_PLUS
# child LHS for node 75
# node 76: type: TNT_SYMBOL sym: c
# child RHS for node 75
# node 77: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 31
# node 78: type: TNT_STMT
# child SEQ_CUR for node 78
# node 79: type: TNT_ASSG
# child LHS for node 79
# node 80: type: TNT_SYMBOL sym: b
# child RHS for node 79
# node 81: type: TNT_PLUS
# child LHS for node 81
# node 82: type: TNT_SYMBOL sym: b
# child RHS for node 81
# node 83: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 22
# node 84: type: TNT_STMT
# child SEQ_CUR for node 84
# node 85: type: TNT_ASSG
# child LHS for node 85
# node 86: type: TNT_SYMBOL sym: a
# child RHS for node 85
# node 87: type: TNT_PLUS
# child LHS for node 87
# node 88: type: TNT_SYMBOL sym: a
# child RHS for node 87
# node 89: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 13
# node 90: type: TNT_STMT
# child SEQ_CUR for node 90
# node 91: type: TNT_PRINTF
# child PRINTF_TREE for node 91
# node 92: type: TNT_STMT
# child SEQ_CUR for node 92
# node 93: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 93
# node 94: type: TNT_ARG
# child SEQ_CUR for node 94
# node 95: type: TNT_SYMBOL sym: res
# child SEQ_NEXT for node 92
# node 96: type: TNT_STMT
# child SEQ_CUR for node 96
# node 97: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 97
# node 98: type: TNT_ARG
# child SEQ_CUR for node 98
# node 99: type: TNT_STRCON str: "\n"
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
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (a)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (LIM)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (LIM)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (9)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (b)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (LIM)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (8)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (c)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (LIM)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (7)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (d)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (3)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (d)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (LIM)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (6)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (e)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (4)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (e)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (LIM)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (5)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (res)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (e)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (e)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (4)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (5)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (d)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (d)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (3)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (6)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (c)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (2)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (7)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (b)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (1)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (8)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (a)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (9)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (res)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (_print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON ("\n")
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (_print_string)

.data

  _a:
    .space 4

  _b:
    .space 4

  _c:
    .space 4

  _d:
    .space 4

  _e:
    .space 4

  _LIM:
    .space 4

  _res:
    .space 4

  _str0:
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

  li $t0, 0
  sw $t0, _a
  li $t0, 3
  sw $t0, _LIM
  li $t0, 0
  sw $t0, _res
_L0:
  lw $t0, _a
  lw $t1, _LIM
  slt $t2, $t0, $t1
  beq $t2, $zero, _L9
  li $t0, 0
  sw $t0, _b
_L1:
  lw $t0, _b
  lw $t1, _LIM
  slt $t2, $t0, $t1
  beq $t2, $zero, _L8
  li $t0, 0
  sw $t0, _c
_L2:
  lw $t0, _c
  lw $t1, _LIM
  slt $t2, $t0, $t1
  beq $t2, $zero, _L7
  li $t0, 0
  sw $t0, _d
_L3:
  lw $t0, _d
  lw $t1, _LIM
  slt $t2, $t0, $t1
  beq $t2, $zero, _L6
  li $t0, 0
  sw $t0, _e
_L4:
  lw $t0, _e
  lw $t1, _LIM
  slt $t2, $t0, $t1
  beq $t2, $zero, _L5
  lw $t0, _res
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, _res
  lw $t0, _e
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, _e
  j _L4
_L5:
  lw $t0, _d
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, _d
  j _L3
_L6:
  lw $t0, _c
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, _c
  j _L2
_L7:
  lw $t0, _b
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, _b
  j _L1
_L8:
  lw $t0, _a
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, _a
  j _L0
_L9:
  lw $t0, _res
  move $a0, $t0
  jal __print_int
  la $t0, _str0
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
