#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 7
# sym: sum
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: i
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
# LOCAL SYMBOLS FOR FUNCTION: sum
#-----------------------------------------------------------------------------
# size: 2
# sym: x
#   line: 3
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: i
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: sum
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_IF
# child IF_COND for node 2
# node 3: type: TNT_EQ
# child LHS for node 3
# node 4: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 4
# node 5: type: TNT_SYMBOL sym: i
# child RHS for node 3
# node 6: type: TNT_INTCON val: 0
# child IF_BODY for node 2
# node 7: type: TNT_RET
# child RET_EXPR for node 7
# node 8: type: TNT_INTCON val: 0
# child IF_ELSE for node 2
# node 9: type: TNT_RET
# child RET_EXPR for node 9
# node 10: type: TNT_PLUS
# child LHS for node 10
# node 11: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 11
# node 12: type: TNT_SYMBOL sym: i
# child RHS for node 10
# node 13: type: TNT_CALL sym: sum
# child CALL_ARGS for node 13
# node 14: type: TNT_ARG
# child SEQ_CUR for node 14
# node 15: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 14
# node 16: type: TNT_ARG
# child SEQ_CUR for node 16
# node 17: type: TNT_PLUS
# child LHS for node 17
# node 18: type: TNT_SYMBOL sym: i
# child RHS for node 17
# node 19: type: TNT_INTCON val: 1
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 1
# sym: x
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
# node 3: type: TNT_SYMBOL sym: x
# child RHS for node 2
# node 4: type: TNT_CALL sym: sum
# child CALL_ARGS for node 4
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_STRCON str: "hello world"
# child SEQ_NEXT for node 5
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 1
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_PRINTF
# child PRINTF_TREE for node 10
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 12
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 11
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 16
# node 17: type: TNT_ARG
# child SEQ_CUR for node 17
# node 18: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: sum
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   1
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SEQ
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
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
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_SVTEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (3)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sum)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (1)
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
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("hello world")
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sum)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (_print_string)

.data

  _str0:
    .asciiz "hello world"
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

.text

_sum:

  # |--------------------------------|
  # |               i                |
  # |--------------------------------| sp+28
  # |               x                |
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
  sw $a1, 28($sp)
  sw $s0, 16($sp)

  lw $t0, 28($sp)
  lw $t1, 24($sp)
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 0
  seq $t2, $t0, $t1
  beq $t2, $zero, _L0
  li $t0, 0
  move $v0, $t0
  j __leave_sum
  j _L1
_L0:
  lw $t0, 28($sp)
  lw $t1, 24($sp)
  addu $t2, $t1, $t0
  lb $s0, ($t2)
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  li $t2, 1
  addu $t3, $t1, $t2
  move $a1, $t3
  move $a0, $t0
  jal _sum
  move $t0, $v0
  addu $t1, $s0, $t0
  move $v0, $t1
  j __leave_sum
_L1:

__leave_sum:
  lw $s0, 16($sp)
  lw $ra, 20($sp)
  la $sp, 24($sp)
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

  la $t0, _str0
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _sum
  move $t0, $v0
  sw $t0, 24($sp)
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

__leavemain:
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
