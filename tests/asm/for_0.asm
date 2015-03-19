#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 2
# sym: char_at
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: string
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: idx
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: main
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: char_at
#-----------------------------------------------------------------------------
# size: 2
# sym: string
#   line: 3
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: idx
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: char_at
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: string
# child AL_OFFSET for node 3
# node 4: type: TNT_SYMBOL sym: idx
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_FOR
# child FOR_BODY for node 2
# node 3: type: TNT_ASSG
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: x
# child RHS for node 3
# node 5: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_FOR
# child FOR_INIT for node 7
# node 8: type: TNT_ASSG
# child LHS for node 8
# node 9: type: TNT_SYMBOL sym: x
# child RHS for node 8
# node 10: type: TNT_INTCON val: 0
# child FOR_COND for node 7
# node 11: type: TNT_LT
# child LHS for node 11
# node 12: type: TNT_SYMBOL sym: x
# child RHS for node 11
# node 13: type: TNT_INTCON val: 10
# child FOR_INC for node 7
# node 14: type: TNT_ASSG
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: x
# child RHS for node 14
# node 16: type: TNT_INTCON val: 5
# child FOR_BODY for node 7
# node 17: type: TNT_ASSG
# child LHS for node 17
# node 18: type: TNT_SYMBOL sym: x
# child RHS for node 17
# node 19: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 19
# node 20: type: TNT_ARG
# child SEQ_CUR for node 20
# node 21: type: TNT_STRCON str: "test"
# child SEQ_NEXT for node 20
# node 22: type: TNT_ARG
# child SEQ_CUR for node 22
# node 23: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 6
# node 24: type: TNT_STMT
# child SEQ_CUR for node 24
# node 25: type: TNT_FOR
# child FOR_COND for node 25
# node 26: type: TNT_LT
# child LHS for node 26
# node 27: type: TNT_SYMBOL sym: x
# child RHS for node 26
# node 28: type: TNT_INTCON val: 10
# child FOR_BODY for node 25
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_ASSG
# child LHS for node 30
# node 31: type: TNT_SYMBOL sym: x
# child RHS for node 30
# node 32: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 32
# node 33: type: TNT_ARG
# child SEQ_CUR for node 33
# node 34: type: TNT_STRCON str: "test"
# child SEQ_NEXT for node 33
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 29
# node 37: type: TNT_STMT
# child SEQ_CUR for node 37
# node 38: type: TNT_RET
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: char_at
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (idx)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_ARRAY (string)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (1)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (0)
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
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
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
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (10)
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
# dest -> ST_LABEL (3)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON ("test")
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (1)
# src1 -> ST_TEMPORARY (1)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (char_at)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (0)
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
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (4)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (10)
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
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON ("test")
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (1)
# src1 -> ST_TEMPORARY (1)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (char_at)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_RET
# -------
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

.data

  _str0:
    .asciiz "test"
    .align 2

.text

_char_at:

  # |--------------------------------|
  # |        <idx is in $a1>         |
  # |--------------------------------| sp+4
  # |       <string is in $a0>       |
  # |--------------------------------| sp+0  <-- start of caller's stack
  la $sp, -0($sp)

  move $t0, $a1
  move $t1, $a0
  add $t2, $t1, $t0
  lb $t0, ($t2)
  move $v0, $t0
  j __leave_char_at

__leave_char_at:
  la $sp, 0($sp)
  jr $ra

main:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |               x                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 16($sp)

_L0:
  li $t0, 1
  beq $t0, $zero, _L1
  li $t0, 1
  sw $t0, 24($sp)
  j _L0
_L1:
  li $t0, 0
  sw $t0, 24($sp)
_L2:
  lw $t0, 24($sp)
  li $t1, 10
  slt $t2, $t0, $t1
  beq $t2, $zero, _L3
  la $t0, _str0
  lw $t1, 24($sp)
  move $a1, $t1
  move $a0, $t0
  jal _char_at
  move $t0, $v0
  sw $t0, 24($sp)
  li $t0, 5
  sw $t0, 24($sp)
  j _L2
_L3:
_L4:
  lw $t0, 24($sp)
  li $t1, 10
  slt $t2, $t0, $t1
  beq $t2, $zero, _L5
  la $t0, _str0
  lw $t1, 24($sp)
  move $a1, $t1
  move $a0, $t0
  jal _char_at
  move $t0, $v0
  sw $t0, 24($sp)
  j __leavemain
  j _L4
_L5:

__leavemain:
  lw $ra, 16($sp)
  la $sp, 32($sp)
  jr $ra
