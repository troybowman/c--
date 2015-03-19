#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 7
# sym: y
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: add
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: x
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
#   line: 11
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 13
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: add
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: add
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: y
# child RHS for node 2
# node 4: type: TNT_PLUS
# child LHS for node 4
# node 5: type: TNT_SYMBOL sym: x
# child RHS for node 4
# node 6: type: TNT_SYMBOL sym: y
# child SEQ_NEXT for node 1
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_RET
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 2
# sym: i
#   line: 15
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: f
#   line: 15
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: f
# child RHS for node 2
# node 4: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_FOR
# child FOR_INIT for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_SYMBOL sym: i
# child RHS for node 7
# node 9: type: TNT_INTCON val: 7
# child FOR_COND for node 6
# node 10: type: TNT_GT
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: i
# child RHS for node 10
# node 12: type: TNT_INTCON val: 0
# child FOR_INC for node 6
# node 13: type: TNT_ASSG
# child LHS for node 13
# node 14: type: TNT_SYMBOL sym: i
# child RHS for node 13
# node 15: type: TNT_MINUS
# child LHS for node 15
# node 16: type: TNT_SYMBOL sym: i
# child RHS for node 15
# node 17: type: TNT_INTCON val: 1
# child FOR_BODY for node 6
# node 18: type: TNT_STMT
# child SEQ_CUR for node 18
# node 19: type: TNT_ASSG
# child LHS for node 19
# node 20: type: TNT_SYMBOL sym: y
# child RHS for node 19
# node 21: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 18
# node 22: type: TNT_STMT
# child SEQ_CUR for node 22
# node 23: type: TNT_CALL sym: add
# child CALL_ARGS for node 23
# node 24: type: TNT_ARG
# child SEQ_CUR for node 24
# node 25: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 22
# node 26: type: TNT_STMT
# child SEQ_CUR for node 26
# node 27: type: TNT_CALL sym: add
# child CALL_ARGS for node 27
# node 28: type: TNT_ARG
# child SEQ_CUR for node 28
# node 29: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 26
# node 30: type: TNT_STMT
# child SEQ_CUR for node 30
# node 31: type: TNT_CALL sym: add
# child CALL_ARGS for node 31
# node 32: type: TNT_ARG
# child SEQ_CUR for node 32
# node 33: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 30
# node 34: type: TNT_STMT
# child SEQ_CUR for node 34
# node 35: type: TNT_CALL sym: add
# child CALL_ARGS for node 35
# node 36: type: TNT_ARG
# child SEQ_CUR for node 36
# node 37: type: TNT_NEG
# child RHS for node 37
# node 38: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 34
# node 39: type: TNT_STMT
# child SEQ_CUR for node 39
# node 40: type: TNT_CALL sym: add
# child CALL_ARGS for node 40
# node 41: type: TNT_ARG
# child SEQ_CUR for node 41
# node 42: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 39
# node 43: type: TNT_STMT
# child SEQ_CUR for node 43
# node 44: type: TNT_ASSG
# child LHS for node 44
# node 45: type: TNT_SYMBOL sym: f
# child RHS for node 44
# node 46: type: TNT_MULT
# child LHS for node 46
# node 47: type: TNT_SYMBOL sym: f
# child RHS for node 46
# node 48: type: TNT_SYMBOL sym: y
# child SEQ_NEXT for node 5
# node 49: type: TNT_STMT
# child SEQ_CUR for node 49
# node 50: type: TNT_PRINTF
# child PRINTF_TREE for node 50
# node 51: type: TNT_STMT
# child SEQ_CUR for node 51
# node 52: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 52
# node 53: type: TNT_ARG
# child SEQ_CUR for node 53
# node 54: type: TNT_SYMBOL sym: f
# child SEQ_NEXT for node 51
# node 55: type: TNT_STMT
# child SEQ_CUR for node 55
# node 56: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 56
# node 57: type: TNT_ARG
# child SEQ_CUR for node 57
# node 58: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: add
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (y)
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
# dest -> ST_PRIMITIVE (y)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_RET
# -------
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
# dest -> ST_PRIMITIVE (f)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (7)
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
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (y)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (0)
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
# src1 -> ST_FUNCTION (add)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
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
# src1 -> ST_FUNCTION (add)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (2)
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
# src1 -> ST_FUNCTION (add)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_ZERO
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (add)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (2)
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
# src1 -> ST_FUNCTION (add)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (f)
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
# dest -> ST_PRIMITIVE (f)
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
# src1 -> ST_PRIMITIVE (f)
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

  _y:
    .space 4

  _str0:
    .asciiz "\n"
    .align 2

.text

_add:

  # |--------------------------------|
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack
  la $sp, -0($sp)

  move $t0, $a0
  lw $t1, _y
  add $t2, $t0, $t1
  sw $t2, _y
  j __leave_add

__leave_add:
  la $sp, 0($sp)
  jr $ra

main:

  # |--------------------------------|
  # |               f                |
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

  li $t0, 1
  sw $t0, 28($sp)
  li $t0, 7
  sw $t0, 24($sp)
_L0:
  lw $t0, 24($sp)
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 24($sp)
  sw $t0, _y
  li $t0, 0
  move $a0, $t0
  jal _add
  li $t0, 1
  move $a0, $t0
  jal _add
  li $t0, 2
  move $a0, $t0
  jal _add
  li $t0, 5
  sub $t1, $zero, $t0
  move $a0, $t1
  jal _add
  li $t0, 2
  move $a0, $t0
  jal _add
  lw $t0, 28($sp)
  lw $t1, _y
  mul $t2, $t0, $t1
  sw $t2, 28($sp)
  lw $t0, 24($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L0
_L1:
  lw $t0, 28($sp)
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
