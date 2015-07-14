#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 6
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
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 6
# sym: i
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: j
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: k
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: a
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: b
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: res
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: res
# child RHS for node 2
# node 4: type: TNT_INTCON val: 123
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_FOR
# child FOR_INIT for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_SYMBOL sym: i
# child RHS for node 7
# node 9: type: TNT_INTCON val: 0
# child FOR_COND for node 6
# node 10: type: TNT_LT
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: i
# child RHS for node 10
# node 12: type: TNT_INTCON val: 5
# child FOR_INC for node 6
# node 13: type: TNT_ASSG
# child LHS for node 13
# node 14: type: TNT_SYMBOL sym: i
# child RHS for node 13
# node 15: type: TNT_PLUS
# child LHS for node 15
# node 16: type: TNT_SYMBOL sym: i
# child RHS for node 15
# node 17: type: TNT_INTCON val: 1
# child FOR_BODY for node 6
# node 18: type: TNT_STMT
# child SEQ_CUR for node 18
# node 19: type: TNT_FOR
# child FOR_INIT for node 19
# node 20: type: TNT_ASSG
# child LHS for node 20
# node 21: type: TNT_SYMBOL sym: j
# child RHS for node 20
# node 22: type: TNT_INTCON val: 0
# child FOR_COND for node 19
# node 23: type: TNT_LT
# child LHS for node 23
# node 24: type: TNT_SYMBOL sym: j
# child RHS for node 23
# node 25: type: TNT_INTCON val: 5
# child FOR_INC for node 19
# node 26: type: TNT_ASSG
# child LHS for node 26
# node 27: type: TNT_SYMBOL sym: j
# child RHS for node 26
# node 28: type: TNT_PLUS
# child LHS for node 28
# node 29: type: TNT_SYMBOL sym: j
# child RHS for node 28
# node 30: type: TNT_INTCON val: 1
# child FOR_BODY for node 19
# node 31: type: TNT_STMT
# child SEQ_CUR for node 31
# node 32: type: TNT_ASSG
# child LHS for node 32
# node 33: type: TNT_SYMBOL sym: k
# child RHS for node 32
# node 34: type: TNT_DIV
# child LHS for node 34
# node 35: type: TNT_PLUS
# child LHS for node 35
# node 36: type: TNT_SYMBOL sym: i
# child RHS for node 35
# node 37: type: TNT_SYMBOL sym: j
# child RHS for node 34
# node 38: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 31
# node 39: type: TNT_STMT
# child SEQ_CUR for node 39
# node 40: type: TNT_IF
# child IF_COND for node 40
# node 41: type: TNT_GT
# child LHS for node 41
# node 42: type: TNT_SYMBOL sym: k
# child RHS for node 41
# node 43: type: TNT_SYMBOL sym: i
# child IF_BODY for node 40
# node 44: type: TNT_STMT
# child SEQ_CUR for node 44
# node 45: type: TNT_FOR
# child FOR_INIT for node 45
# node 46: type: TNT_ASSG
# child LHS for node 46
# node 47: type: TNT_SYMBOL sym: a
# child RHS for node 46
# node 48: type: TNT_INTCON val: 0
# child FOR_COND for node 45
# node 49: type: TNT_LT
# child LHS for node 49
# node 50: type: TNT_SYMBOL sym: a
# child RHS for node 49
# node 51: type: TNT_INTCON val: 5
# child FOR_INC for node 45
# node 52: type: TNT_ASSG
# child LHS for node 52
# node 53: type: TNT_SYMBOL sym: a
# child RHS for node 52
# node 54: type: TNT_PLUS
# child LHS for node 54
# node 55: type: TNT_SYMBOL sym: a
# child RHS for node 54
# node 56: type: TNT_INTCON val: 1
# child FOR_BODY for node 45
# node 57: type: TNT_STMT
# child SEQ_CUR for node 57
# node 58: type: TNT_ASSG
# child LHS for node 58
# node 59: type: TNT_SYMBOL sym: b
# child RHS for node 58
# node 60: type: TNT_DIV
# child LHS for node 60
# node 61: type: TNT_PLUS
# child LHS for node 61
# node 62: type: TNT_SYMBOL sym: a
# child RHS for node 61
# node 63: type: TNT_SYMBOL sym: k
# child RHS for node 60
# node 64: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 57
# node 65: type: TNT_STMT
# child SEQ_CUR for node 65
# node 66: type: TNT_IF
# child IF_COND for node 66
# node 67: type: TNT_GT
# child LHS for node 67
# node 68: type: TNT_SYMBOL sym: b
# child RHS for node 67
# node 69: type: TNT_SYMBOL sym: j
# child IF_BODY for node 66
# node 70: type: TNT_ASSG
# child LHS for node 70
# node 71: type: TNT_SYMBOL sym: res
# child RHS for node 70
# node 72: type: TNT_PLUS
# child LHS for node 72
# node 73: type: TNT_SYMBOL sym: res
# child RHS for node 72
# node 74: type: TNT_SYMBOL sym: b
# child IF_ELSE for node 66
# node 75: type: TNT_ASSG
# child LHS for node 75
# node 76: type: TNT_SYMBOL sym: res
# child RHS for node 75
# node 77: type: TNT_PLUS
# child LHS for node 77
# node 78: type: TNT_SYMBOL sym: res
# child RHS for node 77
# node 79: type: TNT_SYMBOL sym: k
# child SEQ_NEXT for node 5
# node 80: type: TNT_STMT
# child SEQ_CUR for node 80
# node 81: type: TNT_PRINTF
# child PRINTF_TREE for node 81
# node 82: type: TNT_STMT
# child SEQ_CUR for node 82
# node 83: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 83
# node 84: type: TNT_ARG
# child SEQ_CUR for node 84
# node 85: type: TNT_SYMBOL sym: res
# child SEQ_NEXT for node 82
# node 86: type: TNT_STMT
# child SEQ_CUR for node 86
# node 87: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 87
# node 88: type: TNT_ARG
# child SEQ_CUR for node 88
# node 89: type: TNT_STRCON str: "\n"
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
# src1 -> ST_INTCON (123)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res)
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
# dest -> ST_PRIMITIVE (i)
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
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (5)
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
# dest -> ST_PRIMITIVE (j)
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
# src1 -> ST_PRIMITIVE (j)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (5)
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
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (j)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (k)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (k)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_SGT
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
# dest -> ST_PRIMITIVE (a)
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
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (5)
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
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (b)
# src1 -> ST_TEMPORARY (1)
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
# src1 -> ST_PRIMITIVE (j)
# |
# >
# CNT_SGT
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (3)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (res)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (b)
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
# CNT_JUMP
# --------
# dest -> ST_LABEL (4)
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
# src1 -> ST_PRIMITIVE (res)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (k)
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
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (4)
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
# dest -> ST_LABEL (2)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (5)
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
# src1 -> ST_PRIMITIVE (j)
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
# dest -> ST_PRIMITIVE (j)
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
# src1 -> ST_LABEL (7)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (i)
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
# dest -> ST_PRIMITIVE (i)
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
# src1 -> ST_LABEL (8)
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

  _str0:
    .asciiz "\n"
    .align 2

.text

main:

  # |--------------------------------|
  # |              res               |
  # |--------------------------------| sp+44
  # |               b                |
  # |--------------------------------| sp+40
  # |               a                |
  # |--------------------------------| sp+36
  # |               k                |
  # |--------------------------------| sp+32
  # |               j                |
  # |--------------------------------| sp+28
  # |               i                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -48($sp)
  sw $ra, 16($sp)

  li $t0, 123
  sw $t0, 44($sp)
  li $t0, 0
  sw $t0, 24($sp)
_L0:
  lw $t0, 24($sp)
  li $t1, 5
  slt $t2, $t0, $t1
  beq $t2, $zero, _L8
  li $t0, 0
  sw $t0, 28($sp)
_L1:
  lw $t0, 28($sp)
  li $t1, 5
  slt $t2, $t0, $t1
  beq $t2, $zero, _L7
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  add $t2, $t0, $t1
  li $t0, 2
  div $t1, $t2, $t0
  sw $t1, 32($sp)
  lw $t0, 32($sp)
  lw $t1, 24($sp)
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L6
  li $t0, 0
  sw $t0, 36($sp)
_L2:
  lw $t0, 36($sp)
  li $t1, 5
  slt $t2, $t0, $t1
  beq $t2, $zero, _L5
  lw $t0, 36($sp)
  lw $t1, 32($sp)
  add $t2, $t0, $t1
  li $t0, 2
  div $t1, $t2, $t0
  sw $t1, 40($sp)
  lw $t0, 40($sp)
  lw $t1, 28($sp)
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L3
  lw $t0, 44($sp)
  lw $t1, 40($sp)
  add $t2, $t0, $t1
  sw $t2, 44($sp)
  j _L4
_L3:
  lw $t0, 44($sp)
  lw $t1, 32($sp)
  add $t2, $t0, $t1
  sw $t2, 44($sp)
_L4:
  lw $t0, 36($sp)
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, 36($sp)
  j _L2
_L5:
_L6:
  lw $t0, 28($sp)
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, 28($sp)
  j _L1
_L7:
  lw $t0, 24($sp)
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L0
_L8:
  lw $t0, 44($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $ra, 16($sp)
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
