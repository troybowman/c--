#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 7
# sym: u
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: f
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: s
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: n
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
#   line: 15
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 17
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f
#-----------------------------------------------------------------------------
# size: 2
# sym: s
#   line: 5
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
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
# node 3: type: TNT_EQ
# child LHS for node 3
# node 4: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 4
# node 5: type: TNT_SYMBOL sym: n
# child RHS for node 3
# node 6: type: TNT_INTCON val: 0
# child IF_BODY for node 2
# node 7: type: TNT_RET
# child IF_ELSE for node 2
# node 8: type: TNT_STMT
# child SEQ_CUR for node 8
# node 9: type: TNT_ASSG
# child LHS for node 9
# node 10: type: TNT_SYMBOL sym: u
# child RHS for node 9
# node 11: type: TNT_PLUS
# child LHS for node 11
# node 12: type: TNT_SYMBOL sym: u
# child RHS for node 11
# node 13: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 13
# node 14: type: TNT_SYMBOL sym: n
# child SEQ_NEXT for node 8
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_CALL sym: f
# child CALL_ARGS for node 16
# node 17: type: TNT_ARG
# child SEQ_CUR for node 17
# node 18: type: TNT_SYMBOL sym: s
# child SEQ_NEXT for node 17
# node 19: type: TNT_ARG
# child SEQ_CUR for node 19
# node 20: type: TNT_PLUS
# child LHS for node 20
# node 21: type: TNT_SYMBOL sym: n
# child RHS for node 20
# node 22: type: TNT_INTCON val: 1
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: f
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_STRCON str: "hello world"
# child SEQ_NEXT for node 3
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 1
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_PRINTF
# child PRINTF_TREE for node 8
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_SYMBOL sym: u
# child SEQ_NEXT for node 9
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 14
# node 15: type: TNT_ARG
# child SEQ_CUR for node 15
# node 16: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (n)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_ARRAY (s)
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
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (0)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_RET
# -------
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
# src1 -> ST_PRIMITIVE (u)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (n)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_ARRAY (s)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (3)
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
# dest -> ST_PRIMITIVE (u)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_ARRAY (s)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (n)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (1)
# src1 -> ST_TEMPORARY (3)
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
# src1 -> ST_FUNCTION (f)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    2
# svregs used:   0
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON ("hello world")
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (0)
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
# src1 -> ST_FUNCTION (f)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (u)
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

  _u:
    .space 4

  _str0:
    .asciiz "hello world"
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

.text

_f:

  # |--------------------------------|
  # |               n                |
  # |--------------------------------| sp+28
  # |               s                |
  # |--------------------------------| sp+24  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)
  sw $a1, 28($sp)

  lw $t0, 28($sp)
  lw $t1, 24($sp)
  add $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 0
  seq $t2, $t0, $t1
  beq $t2, 0, _L0
  j __leave_f
  j _L1
_L0:
  lw $t0, _u
  lw $t1, 28($sp)
  lw $t2, 24($sp)
  add $t3, $t2, $t1
  lb $t1, ($t3)
  add $t2, $t0, $t1
  sw $t2, _u
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  li $t2, 1
  add $t3, $t1, $t2
  move $a1, $t3
  move $a0, $t0
  jal _f
_L1:

__leave_f:
  lw $ra, 16($sp)
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

  la $t0, _str0
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _f
  lw $t0, _u
  move $a0, $t0
  jal __print_int
  la $t0, _str1
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
