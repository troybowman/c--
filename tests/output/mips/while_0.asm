#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 1
# sym: main
#   line: 3
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_WHILE
# child WHILE_COND for node 2
# node 3: type: TNT_GT
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: x
# child RHS for node 3
# node 5: type: TNT_INTCON val: 0
# child WHILE_BODY for node 2
# node 6: type: TNT_CALL sym: main
# child SEQ_NEXT for node 1
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_WHILE
# child WHILE_COND for node 8
# node 9: type: TNT_OR
# child LHS for node 9
# node 10: type: TNT_EQ
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: x
# child RHS for node 10
# node 12: type: TNT_INTCON val: 0
# child RHS for node 9
# node 13: type: TNT_EQ
# child LHS for node 13
# node 14: type: TNT_SYMBOL sym: x
# child RHS for node 13
# node 15: type: TNT_INTCON val: 6
# child WHILE_BODY for node 8
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_IF
# child IF_COND for node 17
# node 18: type: TNT_LT
# child LHS for node 18
# node 19: type: TNT_SYMBOL sym: x
# child RHS for node 18
# node 20: type: TNT_INTCON val: 1
# child IF_BODY for node 17
# node 21: type: TNT_WHILE
# child WHILE_COND for node 21
# node 22: type: TNT_EQ
# child LHS for node 22
# node 23: type: TNT_INTCON val: 4
# child RHS for node 22
# node 24: type: TNT_INTCON val: 5
# child WHILE_BODY for node 21
# node 25: type: TNT_RET
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
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
# src1 -> ST_INTCON (0)
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
# dest -> ST_LABEL (1)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (main)
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
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SEQ
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
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
# src1 -> ST_INTCON (6)
# |
# >
# CNT_SEQ
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (3)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (6)
# src1 -> ST_TEMPORARY (0)
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
# src1 -> ST_INTCON (1)
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
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_SEQ
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (4)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_RET
# -------
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (3)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (4)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (5)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (2)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (6)

.data

.text

_main:

  # STACK FRAME SUMMARY:
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
  lw $t0, 24($sp)
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, 0, _L1
  jal _main
  j _L0
_L1:
_L2:
  lw $t0, 24($sp)
  li $t1, 0
  seq $t2, $t0, $t1
  lw $t0, 24($sp)
  li $t1, 6
  seq $t3, $t0, $t1
  or $t0, $t2, $t3
  beq $t0, 0, _L6
  lw $t0, 24($sp)
  li $t1, 1
  slt $t2, $t0, $t1
  beq $t2, 0, _L5
_L3:
  li $t0, 4
  li $t1, 5
  seq $t2, $t0, $t1
  beq $t2, 0, _L4
  j __leave_main
  j _L3
_L4:
_L5:
  j _L2
_L6:

__leave_main:
  lw $ra, 16($sp)
  la $sp, 32($sp)
  jr $ra
