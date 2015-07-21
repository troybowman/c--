#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 6
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
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 4
# sym: i
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: j
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: k
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: res
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: res
# child RHS for node 2
# node 4: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_FOR
# child FOR_INIT for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_SYMBOL sym: i
# child RHS for node 7
# node 9: type: TNT_INTCON val: 0
# child FOR_COND for node 6
# node 10: type: TNT_LT
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: i
# child RHS for node 10
# node 12: type: TNT_INTCON val: 5
# child FOR_INC for node 6
# node 13: type: TNT_ASSG
# child LHS for node 13
# node 14: type: TNT_SYMBOL sym: i
# child RHS for node 13
# node 15: type: TNT_PLUS
# child LHS for node 15
# node 16: type: TNT_SYMBOL sym: i
# child RHS for node 15
# node 17: type: TNT_INTCON val: 1
# child FOR_BODY for node 6
# node 18: type: TNT_FOR
# child FOR_INIT for node 18
# node 19: type: TNT_ASSG
# child LHS for node 19
# node 20: type: TNT_SYMBOL sym: j
# child RHS for node 19
# node 21: type: TNT_INTCON val: 0
# child FOR_COND for node 18
# node 22: type: TNT_LT
# child LHS for node 22
# node 23: type: TNT_SYMBOL sym: j
# child RHS for node 22
# node 24: type: TNT_INTCON val: 10
# child FOR_INC for node 18
# node 25: type: TNT_ASSG
# child LHS for node 25
# node 26: type: TNT_SYMBOL sym: j
# child RHS for node 25
# node 27: type: TNT_PLUS
# child LHS for node 27
# node 28: type: TNT_SYMBOL sym: j
# child RHS for node 27
# node 29: type: TNT_INTCON val: 2
# child FOR_BODY for node 18
# node 30: type: TNT_FOR
# child FOR_INIT for node 30
# node 31: type: TNT_ASSG
# child LHS for node 31
# node 32: type: TNT_SYMBOL sym: k
# child RHS for node 31
# node 33: type: TNT_INTCON val: 0
# child FOR_COND for node 30
# node 34: type: TNT_LT
# child LHS for node 34
# node 35: type: TNT_SYMBOL sym: k
# child RHS for node 34
# node 36: type: TNT_INTCON val: 15
# child FOR_INC for node 30
# node 37: type: TNT_ASSG
# child LHS for node 37
# node 38: type: TNT_SYMBOL sym: k
# child RHS for node 37
# node 39: type: TNT_PLUS
# child LHS for node 39
# node 40: type: TNT_SYMBOL sym: k
# child RHS for node 39
# node 41: type: TNT_INTCON val: 3
# child FOR_BODY for node 30
# node 42: type: TNT_ASSG
# child LHS for node 42
# node 43: type: TNT_SYMBOL sym: res
# child RHS for node 42
# node 44: type: TNT_PLUS
# child LHS for node 44
# node 45: type: TNT_SYMBOL sym: res
# child RHS for node 44
# node 46: type: TNT_DIV
# child LHS for node 46
# node 47: type: TNT_PLUS
# child LHS for node 47
# node 48: type: TNT_PLUS
# child LHS for node 48
# node 49: type: TNT_SYMBOL sym: i
# child RHS for node 48
# node 50: type: TNT_SYMBOL sym: j
# child RHS for node 47
# node 51: type: TNT_SYMBOL sym: k
# child RHS for node 46
# node 52: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 5
# node 53: type: TNT_STMT
# child SEQ_CUR for node 53
# node 54: type: TNT_PRINTF
# child PRINTF_TREE for node 54
# node 55: type: TNT_STMT
# child SEQ_CUR for node 55
# node 56: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 56
# node 57: type: TNT_ARG
# child SEQ_CUR for node 57
# node 58: type: TNT_SYMBOL sym: res
# child SEQ_NEXT for node 55
# node 59: type: TNT_STMT
# child SEQ_CUR for node 59
# node 60: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 60
# node 61: type: TNT_ARG
# child SEQ_CUR for node 61
# node 62: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  1
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMP (0)
# |
# >
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
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (5)
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
# dest -> ST_LABEL (5)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (j)
# src1 -> ST_TEMP (0)
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
# src1 -> ST_PRIMITIVE (j)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (10)
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
# dest -> ST_LABEL (4)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (k)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (k)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (15)
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
# dest -> ST_LABEL (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (res)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (j)
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
# src1 -> ST_PRIMITIVE (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (3)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (k)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (3)
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
# dest -> ST_PRIMITIVE (k)
# src1 -> ST_TEMP (2)
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
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (j)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
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
# dest -> ST_PRIMITIVE (j)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (1)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (4)
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
# src1 -> ST_LABEL (5)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (res)
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
    .asciiz "\n"
    .align 2

.text

main:

  # |--------------------------------|
  # |              res               |
  # |--------------------------------| sp+36
  # |               k                |
  # |--------------------------------| sp+32
  # |               j                |
  # |--------------------------------| sp+28
  # |               i                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -40($sp)
  sw $ra, 16($sp)
  sw $a0, 40($sp)

  li $t0, 0
  sw $t0, 36($sp)
  li $t0, 0
  sw $t0, 24($sp)
_L0:
  lw $t0, 24($sp)
  li $t1, 5
  slt $t2, $t0, $t1
  beq $t2, $zero, _L5
  li $t0, 0
  sw $t0, 28($sp)
_L1:
  lw $t0, 28($sp)
  li $t1, 10
  slt $t2, $t0, $t1
  beq $t2, $zero, _L4
  li $t0, 0
  sw $t0, 32($sp)
_L2:
  lw $t0, 32($sp)
  li $t1, 15
  slt $t2, $t0, $t1
  beq $t2, $zero, _L3
  lw $t0, 36($sp)
  lw $t1, 24($sp)
  lw $t2, 28($sp)
  addu $t3, $t1, $t2
  lw $t1, 32($sp)
  addu $t2, $t3, $t1
  li $t1, 3
  div $t3, $t2, $t1
  addu $t1, $t0, $t3
  sw $t1, 36($sp)
  lw $t0, 32($sp)
  li $t1, 3
  addu $t2, $t0, $t1
  sw $t2, 32($sp)
  j _L2
_L3:
  lw $t0, 28($sp)
  li $t1, 2
  addu $t2, $t0, $t1
  sw $t2, 28($sp)
  j _L1
_L4:
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L0
_L5:
  lw $t0, 36($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a0, 40($sp)
  lw $ra, 16($sp)
  la $sp, 40($sp)
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
