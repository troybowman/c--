#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 6
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
# size: 2
# sym: i
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: res
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: i
# child RHS for node 2
# node 4: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: res
# child RHS for node 6
# node 8: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 5
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_FOR
# child FOR_COND for node 10
# node 11: type: TNT_LT
# child LHS for node 11
# node 12: type: TNT_SYMBOL sym: i
# child RHS for node 11
# node 13: type: TNT_INTCON val: 10
# child FOR_INC for node 10
# node 14: type: TNT_ASSG
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: i
# child RHS for node 14
# node 16: type: TNT_PLUS
# child LHS for node 16
# node 17: type: TNT_SYMBOL sym: i
# child RHS for node 16
# node 18: type: TNT_INTCON val: 1
# child FOR_BODY for node 10
# node 19: type: TNT_ASSG
# child LHS for node 19
# node 20: type: TNT_SYMBOL sym: res
# child RHS for node 19
# node 21: type: TNT_PLUS
# child LHS for node 21
# node 22: type: TNT_SYMBOL sym: res
# child RHS for node 21
# node 23: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 9
# node 24: type: TNT_STMT
# child SEQ_CUR for node 24
# node 25: type: TNT_FOR
# child FOR_INIT for node 25
# node 26: type: TNT_ASSG
# child LHS for node 26
# node 27: type: TNT_SYMBOL sym: i
# child RHS for node 26
# node 28: type: TNT_INTCON val: 0
# child FOR_COND for node 25
# node 29: type: TNT_LT
# child LHS for node 29
# node 30: type: TNT_SYMBOL sym: i
# child RHS for node 29
# node 31: type: TNT_INTCON val: 10
# child FOR_BODY for node 25
# node 32: type: TNT_STMT
# child SEQ_CUR for node 32
# node 33: type: TNT_ASSG
# child LHS for node 33
# node 34: type: TNT_SYMBOL sym: res
# child RHS for node 33
# node 35: type: TNT_PLUS
# child LHS for node 35
# node 36: type: TNT_SYMBOL sym: res
# child RHS for node 35
# node 37: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 32
# node 38: type: TNT_STMT
# child SEQ_CUR for node 38
# node 39: type: TNT_ASSG
# child LHS for node 39
# node 40: type: TNT_SYMBOL sym: i
# child RHS for node 39
# node 41: type: TNT_PLUS
# child LHS for node 41
# node 42: type: TNT_SYMBOL sym: i
# child RHS for node 41
# node 43: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 24
# node 44: type: TNT_STMT
# child SEQ_CUR for node 44
# node 45: type: TNT_FOR
# child FOR_INIT for node 45
# node 46: type: TNT_ASSG
# child LHS for node 46
# node 47: type: TNT_SYMBOL sym: i
# child RHS for node 46
# node 48: type: TNT_INTCON val: 0
# child FOR_INC for node 45
# node 49: type: TNT_ASSG
# child LHS for node 49
# node 50: type: TNT_SYMBOL sym: i
# child RHS for node 49
# node 51: type: TNT_PLUS
# child LHS for node 51
# node 52: type: TNT_SYMBOL sym: i
# child RHS for node 51
# node 53: type: TNT_INTCON val: 1
# child FOR_BODY for node 45
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
# node 59: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 54
# node 60: type: TNT_STMT
# child SEQ_CUR for node 60
# node 61: type: TNT_IF
# child IF_COND for node 61
# node 62: type: TNT_GT
# child LHS for node 62
# node 63: type: TNT_SYMBOL sym: i
# child RHS for node 62
# node 64: type: TNT_INTCON val: 10
# child IF_BODY for node 61
# node 65: type: TNT_STMT
# child SEQ_CUR for node 65
# node 66: type: TNT_PRINTF
# child PRINTF_TREE for node 66
# node 67: type: TNT_STMT
# child SEQ_CUR for node 67
# node 68: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 68
# node 69: type: TNT_ARG
# child SEQ_CUR for node 69
# node 70: type: TNT_SYMBOL sym: res
# child SEQ_NEXT for node 67
# node 71: type: TNT_STMT
# child SEQ_CUR for node 71
# node 72: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 72
# node 73: type: TNT_ARG
# child SEQ_CUR for node 73
# node 74: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 65
# node 75: type: TNT_STMT
# child SEQ_CUR for node 75
# node 76: type: TNT_RET
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
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (10)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (res)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (i)
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
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
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
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (10)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (res)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (i)
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
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
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
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (2)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (4)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (6)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (res)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (i)
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
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (10)
# |
# >
# CNT_SGT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (5)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (res)
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
# CNT_RET
# -------
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (5)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
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
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (4)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (6)

.data

  _str0:
    .asciiz "\n"
    .align 2

.text

main:

  # |--------------------------------|
  # |      <saved value of $a0>      |
  # |--------------------------------| sp+32  <-- start of caller's stack
  # |              res               |
  # |--------------------------------| sp+28
  # |               i                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 16($sp)
  sw $a0, 32($sp)

  li $t0, 0
  sw $t0, 24($sp)
  li $t0, 0
  sw $t0, 28($sp)
_L0:
  lw $t0, 24($sp)
  li $t1, 10
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 28($sp)
  lw $t1, 24($sp)
  addu $t2, $t0, $t1
  sw $t2, 28($sp)
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L0
_L1:
  li $t0, 0
  sw $t0, 24($sp)
_L2:
  lw $t0, 24($sp)
  li $t1, 10
  slt $t2, $t0, $t1
  beq $t2, $zero, _L3
  lw $t0, 28($sp)
  lw $t1, 24($sp)
  addu $t2, $t0, $t1
  sw $t2, 28($sp)
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L2
_L3:
  li $t0, 0
  sw $t0, 24($sp)
_L4:
  li $t0, 1
  beq $t0, $zero, _L6
  lw $t0, 28($sp)
  lw $t1, 24($sp)
  addu $t2, $t0, $t1
  sw $t2, 28($sp)
  lw $t0, 24($sp)
  li $t1, 10
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L5
  lw $t0, 28($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  j __leavemain
_L5:
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L4
_L6:

__leavemain:
  lw $a0, 32($sp)
  lw $ra, 16($sp)
  la $sp, 32($sp)
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
