#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 6
# sym: __print_int
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: val
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: __print_hex
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: hex
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: __print_char
#   line: -1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: c
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#     is_extern: yes
# sym: __print_string
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
#     rt_type: PRIM_INT
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 2
# sym: x
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
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
# node 3: type: TNT_SYMBOL sym: x
# child RHS for node 2
# node 4: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: y
# child RHS for node 6
# node 8: type: TNT_INTCON val: 6
# child SEQ_NEXT for node 5
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_IF
# child IF_COND for node 10
# node 11: type: TNT_NOT
# child RHS for node 11
# node 12: type: TNT_EQ
# child LHS for node 12
# node 13: type: TNT_SYMBOL sym: x
# child RHS for node 12
# node 14: type: TNT_SYMBOL sym: y
# child IF_BODY for node 10
# node 15: type: TNT_PRINTF
# child PRINTF_TREE for node 15
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 17
# node 18: type: TNT_ARG
# child SEQ_CUR for node 18
# node 19: type: TNT_STRCON str: "this should print\n"
# child SEQ_NEXT for node 9
# node 20: type: TNT_STMT
# child SEQ_CUR for node 20
# node 21: type: TNT_IF
# child IF_COND for node 21
# node 22: type: TNT_AND
# child LHS for node 22
# node 23: type: TNT_LT
# child LHS for node 23
# node 24: type: TNT_SYMBOL sym: x
# child RHS for node 23
# node 25: type: TNT_SYMBOL sym: y
# child RHS for node 22
# node 26: type: TNT_NOT
# child RHS for node 26
# node 27: type: TNT_NEQ
# child LHS for node 27
# node 28: type: TNT_SYMBOL sym: x
# child RHS for node 27
# node 29: type: TNT_SYMBOL sym: x
# child IF_BODY for node 21
# node 30: type: TNT_PRINTF
# child PRINTF_TREE for node 30
# node 31: type: TNT_STMT
# child SEQ_CUR for node 31
# node 32: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 32
# node 33: type: TNT_ARG
# child SEQ_CUR for node 33
# node 34: type: TNT_STRCON str: "this should also print\n"
# child SEQ_NEXT for node 20
# node 35: type: TNT_STMT
# child SEQ_CUR for node 35
# node 36: type: TNT_IF
# child IF_COND for node 36
# node 37: type: TNT_NOT
# child RHS for node 37
# node 38: type: TNT_AND
# child LHS for node 38
# node 39: type: TNT_NEQ
# child LHS for node 39
# node 40: type: TNT_SYMBOL sym: x
# child RHS for node 39
# node 41: type: TNT_SYMBOL sym: y
# child RHS for node 38
# node 42: type: TNT_EQ
# child LHS for node 42
# node 43: type: TNT_SYMBOL sym: y
# child RHS for node 42
# node 44: type: TNT_SYMBOL sym: y
# child IF_BODY for node 36
# node 45: type: TNT_PRINTF
# child PRINTF_TREE for node 45
# node 46: type: TNT_STMT
# child SEQ_CUR for node 46
# node 47: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 47
# node 48: type: TNT_ARG
# child SEQ_CUR for node 48
# node 49: type: TNT_STRCON str: "this shouldn't print\n"
# child SEQ_NEXT for node 35
# node 50: type: TNT_STMT
# child SEQ_CUR for node 50
# node 51: type: TNT_IF
# child IF_COND for node 51
# node 52: type: TNT_NOT
# child RHS for node 52
# node 53: type: TNT_NOT
# child RHS for node 53
# node 54: type: TNT_NOT
# child RHS for node 54
# node 55: type: TNT_NOT
# child RHS for node 55
# node 56: type: TNT_EQ
# child LHS for node 56
# node 57: type: TNT_SYMBOL sym: x
# child RHS for node 56
# node 58: type: TNT_INTCON val: 5
# child IF_BODY for node 51
# node 59: type: TNT_PRINTF
# child PRINTF_TREE for node 59
# node 60: type: TNT_STMT
# child SEQ_CUR for node 60
# node 61: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 61
# node 62: type: TNT_ARG
# child SEQ_CUR for node 62
# node 63: type: TNT_STRCON str: "finally, this should print\n"
# child SEQ_NEXT for node 50
# node 64: type: TNT_STMT
# child SEQ_CUR for node 64
# node 65: type: TNT_RET
# child RET_EXPR for node 65
# node 66: type: TNT_INTCON val: 0
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
# src1 -> ST_INTCON (5)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (6)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (y)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_SEQ
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_INTCON (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("this should print\n
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
# src1 -> ST_FUNCTION (__print_string)
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
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_SNE
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (3)
# src2 -> ST_INTCON (1)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("this should also pr
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
# src1 -> ST_FUNCTION (__print_string)
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
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_SNE
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_SEQ
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (2)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("this shouldn't prin
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
# src1 -> ST_FUNCTION (__print_string)
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
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_SEQ
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_INTCON (1)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (1)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (1)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (3)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("finally, this shoul
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
# src1 -> ST_FUNCTION (__print_string)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (3)
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

.data

  _str0:
    .asciiz "this should print\n"
    .align 2

  _str1:
    .asciiz "this should also print\n"
    .align 2

  _str2:
    .asciiz "this shouldn't print\n"
    .align 2

  _str3:
    .asciiz "finally, this should print\n"
    .align 2

.text

main:

  # |--------------------------------|
  # |               y                |
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
  sw $a0, 32($sp)

  li $t0, 5
  sw $t0, 24($sp)
  li $t0, 6
  sw $t0, 28($sp)
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  seq $t2, $t0, $t1
  xor $t0, $t2, 1
  beq $t0, $zero, _L0
  la $t0, _str0
  move $a0, $t0
  jal __print_string
_L0:
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  slt $t2, $t0, $t1
  lw $t0, 24($sp)
  lw $t1, 24($sp)
  sne $t3, $t0, $t1
  xor $t0, $t3, 1
  and $t1, $t2, $t0
  beq $t1, $zero, _L1
  la $t0, _str1
  move $a0, $t0
  jal __print_string
_L1:
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  sne $t2, $t0, $t1
  lw $t0, 28($sp)
  lw $t1, 28($sp)
  seq $t3, $t0, $t1
  and $t0, $t2, $t3
  xor $t1, $t0, 1
  beq $t1, $zero, _L2
  la $t0, _str2
  move $a0, $t0
  jal __print_string
_L2:
  lw $t0, 24($sp)
  li $t1, 5
  seq $t2, $t0, $t1
  xor $t0, $t2, 1
  xor $t1, $t0, 1
  xor $t0, $t1, 1
  xor $t1, $t0, 1
  beq $t1, $zero, _L3
  la $t0, _str3
  move $a0, $t0
  jal __print_string
_L3:
  li $t0, 0
  move $v0, $t0
  j __leavemain

__leavemain:
  lw $a0, 32($sp)
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
