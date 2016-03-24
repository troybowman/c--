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
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 4
# sym: x
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: res1
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: res2
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_IF
# child IF_COND for node 2
# node 3: type: TNT_GT
# child LHS for node 3
# node 4: type: TNT_INTCON val: 1
# child RHS for node 3
# node 5: type: TNT_INTCON val: 0
# child IF_BODY for node 2
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: res1
# child RHS for node 6
# node 8: type: TNT_INTCON val: 1111
# child IF_ELSE for node 2
# node 9: type: TNT_ASSG
# child LHS for node 9
# node 10: type: TNT_SYMBOL sym: res1
# child RHS for node 9
# node 11: type: TNT_INTCON val: 2222
# child SEQ_NEXT for node 1
# node 12: type: TNT_STMT
# child SEQ_CUR for node 12
# node 13: type: TNT_ASSG
# child LHS for node 13
# node 14: type: TNT_SYMBOL sym: x
# child RHS for node 13
# node 15: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 12
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_ASSG
# child LHS for node 17
# node 18: type: TNT_SYMBOL sym: y
# child RHS for node 17
# node 19: type: TNT_NEG
# child RHS for node 19
# node 20: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 16
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_IF
# child IF_COND for node 22
# node 23: type: TNT_GT
# child LHS for node 23
# node 24: type: TNT_SYMBOL sym: x
# child RHS for node 23
# node 25: type: TNT_SYMBOL sym: y
# child IF_BODY for node 22
# node 26: type: TNT_ASSG
# child LHS for node 26
# node 27: type: TNT_SYMBOL sym: res2
# child RHS for node 26
# node 28: type: TNT_INTCON val: 3333
# child IF_ELSE for node 22
# node 29: type: TNT_ASSG
# child LHS for node 29
# node 30: type: TNT_SYMBOL sym: res2
# child RHS for node 29
# node 31: type: TNT_INTCON val: 4444
# child SEQ_NEXT for node 21
# node 32: type: TNT_STMT
# child SEQ_CUR for node 32
# node 33: type: TNT_PRINTF
# child PRINTF_TREE for node 33
# node 34: type: TNT_STMT
# child SEQ_CUR for node 34
# node 35: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 35
# node 36: type: TNT_ARG
# child SEQ_CUR for node 36
# node 37: type: TNT_SYMBOL sym: res1
# child SEQ_NEXT for node 34
# node 38: type: TNT_STMT
# child SEQ_CUR for node 38
# node 39: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 39
# node 40: type: TNT_ARG
# child SEQ_CUR for node 40
# node 41: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 38
# node 42: type: TNT_STMT
# child SEQ_CUR for node 42
# node 43: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 43
# node 44: type: TNT_ARG
# child SEQ_CUR for node 44
# node 45: type: TNT_SYMBOL sym: res2
# child SEQ_NEXT for node 42
# node 46: type: TNT_STMT
# child SEQ_CUR for node 46
# node 47: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 47
# node 48: type: TNT_ARG
# child SEQ_CUR for node 48
# node 49: type: TNT_STRCON str: "\n"
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
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SGT
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
# src1 -> ST_INTCON (1111)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res1)
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2222)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res1)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
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
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ZERO
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (y)
# src1 -> ST_TEMP (1)
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
# CNT_SGT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (2)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3333)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res2)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (3)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (4444)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res2)
# src1 -> ST_TEMP (0)
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
# src1 -> ST_PRIMITIVE (res1)
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
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (" ")
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
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (res2)
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
# src1 -> ST_FUNCTION (__print_int)
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
# src1 -> ST_FUNCTION (__print_string)

.data

  _str0:
    .asciiz " "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

.text

main:

  # |--------------------------------|
  # |              $a0               |
  # |--------------------------------| sp+40  <-- start of caller's frame
  # |              res2              |
  # |--------------------------------| sp+36
  # |              res1              |
  # |--------------------------------| sp+32
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
  la $sp, -40($sp)
  sw $ra, 16($sp)
  sw $a0, 40($sp)

  li $t0, 1
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L0
  li $t0, 1111
  sw $t0, 32($sp)
  j _L1
_L0:
  li $t0, 2222
  sw $t0, 32($sp)
_L1:
  li $t0, 1
  sw $t0, 24($sp)
  li $t0, 1
  sub $t1, $zero, $t0
  sw $t1, 28($sp)
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L2
  li $t0, 3333
  sw $t0, 36($sp)
  j _L3
_L2:
  li $t0, 4444
  sw $t0, 36($sp)
_L3:
  lw $t0, 32($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
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
