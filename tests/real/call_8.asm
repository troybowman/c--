#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 8
# sym: x
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 4
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: f
#   line: 6
#   type: ST_FUNCTION
#     rt_type: RT_CHAR
#     params:
#       0: x
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
#   line: 11
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 13
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 6
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
# node 4: type: TNT_SYMBOL sym: x
# child RHS for node 3
# node 5: type: TNT_INTCON val: 1
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
# node 3: type: TNT_SYMBOL sym: y
# child RHS for node 2
# node 4: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: x
# child RHS for node 6
# node 8: type: TNT_CALL sym: f
# child CALL_ARGS for node 8
# node 9: type: TNT_ARG
# child SEQ_CUR for node 9
# node 10: type: TNT_SYMBOL sym: y
# child SEQ_NEXT for node 5
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_ASSG
# child LHS for node 12
# node 13: type: TNT_SYMBOL sym: y
# child RHS for node 12
# node 14: type: TNT_PLUS
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: x
# child RHS for node 14
# node 16: type: TNT_CALL sym: f
# child CALL_ARGS for node 16
# node 17: type: TNT_ARG
# child SEQ_CUR for node 17
# node 18: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 11
# node 19: type: TNT_STMT
# child SEQ_CUR for node 19
# node 20: type: TNT_ASSG
# child LHS for node 20
# node 21: type: TNT_SYMBOL sym: x
# child RHS for node 20
# node 22: type: TNT_PLUS
# child LHS for node 22
# node 23: type: TNT_SYMBOL sym: y
# child RHS for node 22
# node 24: type: TNT_CALL sym: f
# child CALL_ARGS for node 24
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_CHARCON str: 'Q'
# child SEQ_NEXT for node 19
# node 27: type: TNT_STMT
# child SEQ_CUR for node 27
# node 28: type: TNT_PRINTF
# child PRINTF_TREE for node 28
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 30
# node 31: type: TNT_ARG
# child SEQ_CUR for node 31
# node 32: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 29
# node 33: type: TNT_STMT
# child SEQ_CUR for node 33
# node 34: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 34
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f
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
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (2)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    2
# svregs used:   1
# stktemps used: 0
# regargs used:  1
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (y)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (y)
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
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
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
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (y)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_LB
# ------
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_CHARCON ('Q')
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
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_SAVED_TEMPORARY (0)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (1)
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

  _y:
    .space 1
    .align 2

  _str0:
    .asciiz "\n"
    .align 2

.text

_f:

  # |--------------------------------|
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack
  la $sp, -0($sp)

  move $t0, $a0
  li $t1, 1
  add $t2, $t0, $t1
  move $v0, $t2
  j __leave_f

__leave_f:
  la $sp, 0($sp)
  jr $ra

main:

  # |--------------------------------|
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 20($sp)
  sw $s0, 16($sp)

  li $t0, 1
  sb $t0, _y
  lb $t0, _y
  move $a0, $t0
  jal _f
  move $t0, $v0
  sw $t0, _x
  lw $s0, _x
  lw $t0, _x
  move $a0, $t0
  jal _f
  move $t0, $v0
  add $t1, $s0, $t0
  sb $t1, _y
  lb $s0, _y
  li $t0, 'Q'
  move $a0, $t0
  jal _f
  move $t0, $v0
  add $t1, $s0, $t0
  sw $t1, _x
  lw $t0, _x
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $s0, 16($sp)
  lw $ra, 20($sp)
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