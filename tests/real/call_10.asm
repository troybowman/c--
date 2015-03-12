#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 7
# sym: x
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: f
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: i
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: _print_int
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: val
#         type: ST_PRIMITIVE
#           base: PRIM_INT
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
# sym: _print_char
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: c
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#     is_extern: yes
# sym: printf
#   line: 18
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 20
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f
#-----------------------------------------------------------------------------
# size: 2
# sym: i
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: y
# child RHS for node 2
# node 4: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_WHILE
# child WHILE_COND for node 6
# node 7: type: TNT_GT
# child LHS for node 7
# node 8: type: TNT_SYMBOL sym: i
# child RHS for node 7
# node 9: type: TNT_INTCON val: 0
# child WHILE_BODY for node 6
# node 10: type: TNT_STMT
# child SEQ_CUR for node 10
# node 11: type: TNT_ASSG
# child LHS for node 11
# node 12: type: TNT_SYMBOL sym: x
# child RHS for node 11
# node 13: type: TNT_MULT
# child LHS for node 13
# node 14: type: TNT_SYMBOL sym: x
# child RHS for node 13
# node 15: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 10
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_ASSG
# child LHS for node 17
# node 18: type: TNT_SYMBOL sym: y
# child RHS for node 17
# node 19: type: TNT_MULT
# child LHS for node 19
# node 20: type: TNT_INTCON val: 2
# child RHS for node 19
# node 21: type: TNT_SYMBOL sym: y
# child SEQ_NEXT for node 16
# node 22: type: TNT_STMT
# child SEQ_CUR for node 22
# node 23: type: TNT_ASSG
# child LHS for node 23
# node 24: type: TNT_SYMBOL sym: i
# child RHS for node 23
# node 25: type: TNT_MINUS
# child LHS for node 25
# node 26: type: TNT_SYMBOL sym: i
# child RHS for node 25
# node 27: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 5
# node 28: type: TNT_STMT
# child SEQ_CUR for node 28
# node 29: type: TNT_RET
# child RET_EXPR for node 29
# node 30: type: TNT_SYMBOL sym: y
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 1
# sym: a
#   line: 22
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: x
# child RHS for node 2
# node 4: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: a
# child RHS for node 6
# node 8: type: TNT_CALL sym: f
# child CALL_ARGS for node 8
# node 9: type: TNT_ARG
# child SEQ_CUR for node 9
# node 10: type: TNT_INTCON val: 6
# child SEQ_NEXT for node 5
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_ASSG
# child LHS for node 12
# node 13: type: TNT_SYMBOL sym: x
# child RHS for node 12
# node 14: type: TNT_PLUS
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: a
# child RHS for node 14
# node 16: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 11
# node 17: type: TNT_STMT
# child SEQ_CUR for node 17
# node 18: type: TNT_PRINTF
# child PRINTF_TREE for node 18
# node 19: type: TNT_STMT
# child SEQ_CUR for node 19
# node 20: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 20
# node 21: type: TNT_ARG
# child SEQ_CUR for node 21
# node 22: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 19
# node 23: type: TNT_STMT
# child SEQ_CUR for node 23
# node 24: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 24
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (y)
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
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (y)
# src1 -> ST_TEMPORARY (2)
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
# CNT_SUB
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
# src1 -> ST_LABEL (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (y)
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
# regargs used:  1
# stkargs used:  0
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
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (6)
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
# src1 -> ST_FUNCTION (f)
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
# dest -> ST_PRIMITIVE (a)
# src1 -> ST_TEMPORARY (0)
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
# src1 -> ST_PRIMITIVE (x)
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
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
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

  _x:
    .space 4

  _str0:
    .asciiz "\n"
    .align 2

.text

_f:

  # |--------------------------------|
  # |         <i is in $a0>          |
  # |--------------------------------| sp+8  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+4
  # |               y                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  li $t0, 1
  sw $t0, 0($sp)
_L0:
  move $t0, $a0
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, 0, _L1
  lw $t0, _x
  move $t1, $a0
  mul $t2, $t0, $t1
  sw $t2, _x
  li $t0, 2
  lw $t1, 0($sp)
  mul $t2, $t0, $t1
  sw $t2, 0($sp)
  move $t0, $a0
  li $t1, 1
  sub $t2, $t0, $t1
  move $a0, $t2
  j _L0
_L1:
  lw $t0, 0($sp)
  move $v0, $t0
  j __leave_f

__leave_f:
  la $sp, 8($sp)
  jr $ra

main:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |               a                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 16($sp)

  li $t0, 1
  sw $t0, _x
  li $t0, 6
  move $a0, $t0
  jal _f
  move $t0, $v0
  sw $t0, 24($sp)
  lw $t0, 24($sp)
  lw $t1, _x
  add $t2, $t0, $t1
  sw $t2, _x
  lw $t0, _x
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $ra, 16($sp)
  la $sp, 32($sp)
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
