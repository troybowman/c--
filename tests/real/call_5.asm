#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 7
# sym: g
#   line: 13
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: n
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: f
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: n
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
#   line: 21
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 23
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f
#-----------------------------------------------------------------------------
# size: 1
# sym: n
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_IF
# child IF_COND for node 2
# node 3: type: TNT_LEQ
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: n
# child RHS for node 3
# node 5: type: TNT_INTCON val: 1
# child IF_BODY for node 2
# node 6: type: TNT_RET
# child RET_EXPR for node 6
# node 7: type: TNT_INTCON val: 1
# child IF_ELSE for node 2
# node 8: type: TNT_RET
# child RET_EXPR for node 8
# node 9: type: TNT_PLUS
# child LHS for node 9
# node 10: type: TNT_CALL sym: g
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_MINUS
# child LHS for node 12
# node 13: type: TNT_SYMBOL sym: n
# child RHS for node 12
# node 14: type: TNT_INTCON val: 1
# child RHS for node 9
# node 15: type: TNT_CALL sym: f
# child CALL_ARGS for node 15
# node 16: type: TNT_ARG
# child SEQ_CUR for node 16
# node 17: type: TNT_MINUS
# child LHS for node 17
# node 18: type: TNT_SYMBOL sym: n
# child RHS for node 17
# node 19: type: TNT_INTCON val: 2
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: g
#-----------------------------------------------------------------------------
# size: 1
# sym: n
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: g
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_IF
# child IF_COND for node 2
# node 3: type: TNT_LEQ
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: n
# child RHS for node 3
# node 5: type: TNT_INTCON val: 1
# child IF_BODY for node 2
# node 6: type: TNT_RET
# child RET_EXPR for node 6
# node 7: type: TNT_INTCON val: 1
# child IF_ELSE for node 2
# node 8: type: TNT_RET
# child RET_EXPR for node 8
# node 9: type: TNT_PLUS
# child LHS for node 9
# node 10: type: TNT_CALL sym: f
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_MINUS
# child LHS for node 12
# node 13: type: TNT_SYMBOL sym: n
# child RHS for node 12
# node 14: type: TNT_INTCON val: 1
# child RHS for node 9
# node 15: type: TNT_CALL sym: g
# child CALL_ARGS for node 15
# node 16: type: TNT_ARG
# child SEQ_CUR for node 16
# node 17: type: TNT_MINUS
# child LHS for node 17
# node 18: type: TNT_SYMBOL sym: n
# child RHS for node 17
# node 19: type: TNT_INTCON val: 2
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_PRINTF
# child PRINTF_TREE for node 2
# node 3: type: TNT_STMT
# child SEQ_CUR for node 3
# node 4: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 4
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_CALL sym: f
# child CALL_ARGS for node 6
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 3
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   1
# stktemps used: 0
# regargs used:  1
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (n)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLE
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (0)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (1)
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
# src1 -> ST_PRIMITIVE (n)
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
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (g)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (n)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (2)
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
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_SAVED_TEMPORARY (0)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: g
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   1
# stktemps used: 0
# regargs used:  1
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (n)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLE
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (0)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (1)
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
# src1 -> ST_PRIMITIVE (n)
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
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (2)
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
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (n)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (g)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_SAVED_TEMPORARY (0)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    1
# svregs used:   0
# stktemps used: 0
# regargs used:  1
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (5)
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

_f:

  # |--------------------------------|
  # |               n                |
  # |--------------------------------| sp+24  <-- start of caller's stack
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $s0, 16($sp)

  lw $t0, 24($sp)
  li $t1, 1
  sle $t2, $t0, $t1
  beq $t2, $zero, _L0
  li $t0, 1
  move $v0, $t0
  j __leave_f
  j _L1
_L0:
  lw $t0, 24($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  move $a0, $t2
  jal _g
  move $s0, $v0
  lw $t0, 24($sp)
  li $t1, 2
  sub $t2, $t0, $t1
  move $a0, $t2
  jal _f
  move $t0, $v0
  add $t1, $s0, $t0
  move $v0, $t1
  j __leave_f
_L1:

__leave_f:
  lw $s0, 16($sp)
  lw $ra, 20($sp)
  la $sp, 24($sp)
  jr $ra

_g:

  # |--------------------------------|
  # |               n                |
  # |--------------------------------| sp+24  <-- start of caller's stack
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $s0, 16($sp)

  lw $t0, 24($sp)
  li $t1, 1
  sle $t2, $t0, $t1
  beq $t2, $zero, _L2
  li $t0, 1
  move $v0, $t0
  j __leave_g
  j _L3
_L2:
  lw $t0, 24($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  move $a0, $t2
  jal _f
  move $s0, $v0
  lw $t0, 24($sp)
  li $t1, 2
  sub $t2, $t0, $t1
  move $a0, $t2
  jal _g
  move $t0, $v0
  add $t1, $s0, $t0
  move $v0, $t1
  j __leave_g
_L3:

__leave_g:
  lw $s0, 16($sp)
  lw $ra, 20($sp)
  la $sp, 24($sp)
  jr $ra

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

  li $t0, 5
  move $a0, $t0
  jal _f
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $ra, 16($sp)
  la $sp, 24($sp)
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
