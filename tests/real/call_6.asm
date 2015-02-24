#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 6
# sym: f
#   line: 3
#   type: ST_FUNCTION
#     rt_type: RT_INT
#     params:
#       0: a
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: b
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       2: c
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       3: d
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       4: e
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: _print_int
#   line: -1
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: val
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: _print_string
#   line: -1
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: str
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: yes
# sym: _print_char
#   line: -1
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: c
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#     is_extern: yes
# sym: printf
#   line: 8
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 10
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f
#-----------------------------------------------------------------------------
# size: 5
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
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_PLUS
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: a
# child RHS for node 3
# node 5: type: TNT_MULT
# child LHS for node 5
# node 6: type: TNT_SYMBOL sym: b
# child RHS for node 5
# node 7: type: TNT_PLUS
# child LHS for node 7
# node 8: type: TNT_SYMBOL sym: c
# child RHS for node 7
# node 9: type: TNT_MULT
# child LHS for node 9
# node 10: type: TNT_SYMBOL sym: d
# child RHS for node 9
# node 11: type: TNT_SYMBOL sym: e
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 12
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
# node 4: type: TNT_CALL sym: f
# child CALL_ARGS for node 4
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 5
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 7
# node 9: type: TNT_ARG
# child SEQ_CUR for node 9
# node 10: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 9
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 11
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 1
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_ASSG
# child LHS for node 16
# node 17: type: TNT_SYMBOL sym: x
# child RHS for node 16
# node 18: type: TNT_CALL sym: f
# child CALL_ARGS for node 18
# node 19: type: TNT_ARG
# child SEQ_CUR for node 19
# node 20: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 19
# node 21: type: TNT_ARG
# child SEQ_CUR for node 21
# node 22: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 21
# node 23: type: TNT_ARG
# child SEQ_CUR for node 23
# node 24: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 23
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 25
# node 27: type: TNT_ARG
# child SEQ_CUR for node 27
# node 28: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 15
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_PRINTF
# child PRINTF_TREE for node 30
# node 31: type: TNT_STMT
# child SEQ_CUR for node 31
# node 32: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 32
# node 33: type: TNT_ARG
# child SEQ_CUR for node 33
# node 34: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 31
# node 35: type: TNT_STMT
# child SEQ_CUR for node 35
# node 36: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 36
# node 37: type: TNT_ARG
# child SEQ_CUR for node 37
# node 38: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f
#-----------------------------------------------------------------------------
# temps used:    6
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_PRIMITIVE (d)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (4)
# src1 -> ST_PRIMITIVE (e)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMPORARY (5)
# src1 -> ST_TEMPORARY (3)
# src2 -> ST_TEMPORARY (4)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (5)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (2)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (1)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    5
# svregs used:   0
# stktemps used: 0
# regargs used:  4
# stkargs used:  1
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (4)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STACK_ARGUMENT (0)
# src1 -> ST_TEMPORARY (4)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (3)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (2)
# src1 -> ST_TEMPORARY (2)
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
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (0)
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
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (4)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STACK_ARGUMENT (0)
# src1 -> ST_TEMPORARY (4)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (3)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (2)
# src1 -> ST_TEMPORARY (2)
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
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (0)
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

  _str0:
    .asciiz "\n"
    .align 2

.text

_f:

  # |--------------------------------|
  # |               e                |
  # |--------------------------------| sp+16
  # |         <d is in $a3>          |
  # |--------------------------------| sp+12
  # |         <c is in $a2>          |
  # |--------------------------------| sp+8
  # |         <b is in $a1>          |
  # |--------------------------------| sp+4
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack
  la $sp, -0($sp)

  move $t0, $a0
  move $t1, $a1
  move $t2, $a2
  move $t3, $a3
  lw $t4, 16($sp)
  mul $t5, $t3, $t4
  add $t3, $t2, $t5
  mul $t2, $t1, $t3
  add $t1, $t0, $t2
  move $v0, $t1
  j __leave_f

__leave_f:
  la $sp, 0($sp)
  jr $ra

main:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |               x                |
  # |--------------------------------| sp+24
  # |              $ra               |
  # |--------------------------------| sp+20
  # |           <stkarg 0>           |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 20($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  li $t4, 5
  sw $t4, 16($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _f
  move $t0, $v0
  sw $t0, 24($sp)
  lw $t0, 24($sp)
  lw $t1, 24($sp)
  lw $t2, 24($sp)
  lw $t3, 24($sp)
  lw $t4, 24($sp)
  sw $t4, 16($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _f
  move $t0, $v0
  sw $t0, 24($sp)
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $ra, 20($sp)
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