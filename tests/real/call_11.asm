#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 9
# sym: x
#   line: 3
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xa
# sym: init
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_ARRAY
#           base: PRIM_INT
#       1: n
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: count
#   line: 14
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_ARRAY
#           base: PRIM_INT
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
#   line: 27
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 29
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: init
#-----------------------------------------------------------------------------
# size: 3
# sym: x
#   line: 5
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
# sym: n
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: i
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: init
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_FOR
# child FOR_INIT for node 2
# node 3: type: TNT_ASSG
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: i
# child RHS for node 3
# node 5: type: TNT_INTCON val: 0
# child FOR_COND for node 2
# node 6: type: TNT_LT
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: i
# child RHS for node 6
# node 8: type: TNT_SYMBOL sym: n
# child FOR_INC for node 2
# node 9: type: TNT_ASSG
# child LHS for node 9
# node 10: type: TNT_SYMBOL sym: i
# child RHS for node 9
# node 11: type: TNT_PLUS
# child LHS for node 11
# node 12: type: TNT_SYMBOL sym: i
# child RHS for node 11
# node 13: type: TNT_INTCON val: 1
# child FOR_BODY for node 2
# node 14: type: TNT_ASSG
# child LHS for node 14
# node 15: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 15
# node 16: type: TNT_SYMBOL sym: i
# child RHS for node 14
# node 17: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 1
# node 18: type: TNT_STMT
# child SEQ_CUR for node 18
# node 19: type: TNT_RET
# child RET_EXPR for node 19
# node 20: type: TNT_SYMBOL sym: n
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: count
#-----------------------------------------------------------------------------
# size: 3
# sym: x
#   line: 14
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
# sym: n
#   line: 14
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: c
#   line: 16
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: count
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: c
# child RHS for node 2
# node 4: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: n
# child RHS for node 6
# node 8: type: TNT_MINUS
# child LHS for node 8
# node 9: type: TNT_SYMBOL sym: n
# child RHS for node 8
# node 10: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 5
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_WHILE
# child WHILE_COND for node 12
# node 13: type: TNT_GEQ
# child LHS for node 13
# node 14: type: TNT_SYMBOL sym: n
# child RHS for node 13
# node 15: type: TNT_INTCON val: 0
# child WHILE_BODY for node 12
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_ASSG
# child LHS for node 17
# node 18: type: TNT_SYMBOL sym: c
# child RHS for node 17
# node 19: type: TNT_PLUS
# child LHS for node 19
# node 20: type: TNT_SYMBOL sym: c
# child RHS for node 19
# node 21: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 21
# node 22: type: TNT_SYMBOL sym: n
# child SEQ_NEXT for node 16
# node 23: type: TNT_STMT
# child SEQ_CUR for node 23
# node 24: type: TNT_ASSG
# child LHS for node 24
# node 25: type: TNT_SYMBOL sym: n
# child RHS for node 24
# node 26: type: TNT_MINUS
# child LHS for node 26
# node 27: type: TNT_SYMBOL sym: n
# child RHS for node 26
# node 28: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 11
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_RET
# child RET_EXPR for node 30
# node 31: type: TNT_SYMBOL sym: c
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 1
# sym: z
#   line: 31
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: z
# child RHS for node 2
# node 4: type: TNT_CALL sym: init
# child CALL_ARGS for node 4
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 5
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_INTCON val: 10
# child SEQ_NEXT for node 1
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_ASSG
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: z
# child RHS for node 10
# node 12: type: TNT_PLUS
# child LHS for node 12
# node 13: type: TNT_SYMBOL sym: z
# child RHS for node 12
# node 14: type: TNT_CALL sym: count
# child CALL_ARGS for node 14
# node 15: type: TNT_ARG
# child SEQ_CUR for node 15
# node 16: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 15
# node 17: type: TNT_ARG
# child SEQ_CUR for node 17
# node 18: type: TNT_INTCON val: 10
# child SEQ_NEXT for node 9
# node 19: type: TNT_STMT
# child SEQ_CUR for node 19
# node 20: type: TNT_PRINTF
# child PRINTF_TREE for node 20
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 22
# node 23: type: TNT_ARG
# child SEQ_CUR for node 23
# node 24: type: TNT_SYMBOL sym: z
# child SEQ_NEXT for node 21
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 26
# node 27: type: TNT_ARG
# child SEQ_CUR for node 27
# node 28: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: init
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  0
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
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (n)
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
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
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
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
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
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (n)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: count
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (c)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (n)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (n)
# src1 -> ST_TEMP (2)
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
# src1 -> ST_PRIMITIVE (n)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SGE
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
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (n)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
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
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (3)
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
# dest -> ST_PRIMITIVE (c)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (n)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (n)
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
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    2
# svregs used:   1
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (10)
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
# src1 -> ST_FUNCTION (init)
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
# dest -> ST_PRIMITIVE (z)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_SVTEMP (0)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (10)
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
# src1 -> ST_FUNCTION (count)
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
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (z)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (z)
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

  _x:
    .space 40

  _str0:
    .asciiz "\n"
    .align 2

.text

_init:

  # |--------------------------------|
  # |         <n is in $a1>          |
  # |--------------------------------| sp+12
  # |         <x is in $a0>          |
  # |--------------------------------| sp+8  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+4
  # |               i                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  li $t0, 0
  sw $t0, 0($sp)
_L0:
  lw $t0, 0($sp)
  move $t1, $a1
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 0($sp)
  lw $t1, 0($sp)
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  lw $t0, 0($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 0($sp)
  j _L0
_L1:
  move $t0, $a1
  move $v0, $t0
  j __leave_init

__leave_init:
  la $sp, 8($sp)
  jr $ra

_count:

  # |--------------------------------|
  # |         <n is in $a1>          |
  # |--------------------------------| sp+12
  # |         <x is in $a0>          |
  # |--------------------------------| sp+8  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+4
  # |               c                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  li $t0, 0
  sw $t0, 0($sp)
  move $t0, $a1
  li $t1, 1
  sub $t2, $t0, $t1
  move $a1, $t2
_L2:
  move $t0, $a1
  li $t1, 0
  sge $t2, $t0, $t1
  beq $t2, $zero, _L3
  lw $t0, 0($sp)
  move $t1, $a1
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  lw $t1, ($t3)
  addu $t2, $t0, $t1
  sw $t2, 0($sp)
  move $t0, $a1
  li $t1, 1
  sub $t2, $t0, $t1
  move $a1, $t2
  j _L2
_L3:
  lw $t0, 0($sp)
  move $v0, $t0
  j __leave_count

__leave_count:
  la $sp, 8($sp)
  jr $ra

main:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |               z                |
  # |--------------------------------| sp+24
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $s0, 16($sp)
  sw $ra, 20($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)

  la $t0, _x
  li $t1, 10
  move $a1, $t1
  move $a0, $t0
  jal _init
  move $t0, $v0
  sw $t0, 24($sp)
  lw $s0, 24($sp)
  la $t0, _x
  li $t1, 10
  move $a1, $t1
  move $a0, $t0
  jal _count
  move $t0, $v0
  addu $t1, $s0, $t0
  sw $t1, 24($sp)
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 20($sp)
  lw $s0, 16($sp)
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
