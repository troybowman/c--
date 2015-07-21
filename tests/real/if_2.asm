#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 14
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
# sym: f
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: g
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: res
#   line: 4
#   type: ST_PRIMITIVE
#     base: PRIM_INT
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
#   line: 6
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 8
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
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
# node 3: type: TNT_SYMBOL sym: a
# child RHS for node 2
# node 4: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: b
# child RHS for node 6
# node 8: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 5
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_ASSG
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: c
# child RHS for node 10
# node 12: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 9
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_ASSG
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: d
# child RHS for node 14
# node 16: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 13
# node 17: type: TNT_STMT
# child SEQ_CUR for node 17
# node 18: type: TNT_ASSG
# child LHS for node 18
# node 19: type: TNT_SYMBOL sym: e
# child RHS for node 18
# node 20: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 17
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_ASSG
# child LHS for node 22
# node 23: type: TNT_SYMBOL sym: f
# child RHS for node 22
# node 24: type: TNT_INTCON val: 6
# child SEQ_NEXT for node 21
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_IF
# child IF_COND for node 26
# node 27: type: TNT_LT
# child LHS for node 27
# node 28: type: TNT_SYMBOL sym: a
# child RHS for node 27
# node 29: type: TNT_SYMBOL sym: b
# child IF_BODY for node 26
# node 30: type: TNT_IF
# child IF_COND for node 30
# node 31: type: TNT_GEQ
# child LHS for node 31
# node 32: type: TNT_SYMBOL sym: b
# child RHS for node 31
# node 33: type: TNT_SYMBOL sym: c
# child IF_BODY for node 30
# node 34: type: TNT_IF
# child IF_COND for node 34
# node 35: type: TNT_LT
# child LHS for node 35
# node 36: type: TNT_SYMBOL sym: c
# child RHS for node 35
# node 37: type: TNT_SYMBOL sym: d
# child IF_BODY for node 34
# node 38: type: TNT_IF
# child IF_COND for node 38
# node 39: type: TNT_NEQ
# child LHS for node 39
# node 40: type: TNT_SYMBOL sym: d
# child RHS for node 39
# node 41: type: TNT_SYMBOL sym: e
# child IF_BODY for node 38
# node 42: type: TNT_IF
# child IF_COND for node 42
# node 43: type: TNT_LT
# child LHS for node 43
# node 44: type: TNT_SYMBOL sym: e
# child RHS for node 43
# node 45: type: TNT_SYMBOL sym: f
# child IF_BODY for node 42
# node 46: type: TNT_IF
# child IF_COND for node 46
# node 47: type: TNT_LT
# child LHS for node 47
# node 48: type: TNT_SYMBOL sym: g
# child RHS for node 47
# node 49: type: TNT_SYMBOL sym: f
# child IF_BODY for node 46
# node 50: type: TNT_IF
# child IF_COND for node 50
# node 51: type: TNT_LT
# child LHS for node 51
# node 52: type: TNT_SYMBOL sym: g
# child RHS for node 51
# node 53: type: TNT_SYMBOL sym: a
# child IF_BODY for node 50
# node 54: type: TNT_ASSG
# child LHS for node 54
# node 55: type: TNT_SYMBOL sym: res
# child RHS for node 54
# node 56: type: TNT_INTCON val: 1111
# child IF_ELSE for node 50
# node 57: type: TNT_ASSG
# child LHS for node 57
# node 58: type: TNT_SYMBOL sym: res
# child RHS for node 57
# node 59: type: TNT_INTCON val: 2222
# child IF_ELSE for node 46
# node 60: type: TNT_ASSG
# child LHS for node 60
# node 61: type: TNT_SYMBOL sym: res
# child RHS for node 60
# node 62: type: TNT_INTCON val: 3333
# child IF_ELSE for node 42
# node 63: type: TNT_ASSG
# child LHS for node 63
# node 64: type: TNT_SYMBOL sym: res
# child RHS for node 63
# node 65: type: TNT_INTCON val: 4444
# child IF_ELSE for node 38
# node 66: type: TNT_ASSG
# child LHS for node 66
# node 67: type: TNT_SYMBOL sym: res
# child RHS for node 66
# node 68: type: TNT_INTCON val: 5555
# child IF_ELSE for node 34
# node 69: type: TNT_ASSG
# child LHS for node 69
# node 70: type: TNT_SYMBOL sym: res
# child RHS for node 69
# node 71: type: TNT_INTCON val: 6666
# child IF_ELSE for node 30
# node 72: type: TNT_ASSG
# child LHS for node 72
# node 73: type: TNT_SYMBOL sym: res
# child RHS for node 72
# node 74: type: TNT_INTCON val: 7777
# child IF_ELSE for node 26
# node 75: type: TNT_ASSG
# child LHS for node 75
# node 76: type: TNT_SYMBOL sym: res
# child RHS for node 75
# node 77: type: TNT_INTCON val: 8888
# child SEQ_NEXT for node 25
# node 78: type: TNT_STMT
# child SEQ_CUR for node 78
# node 79: type: TNT_PRINTF
# child PRINTF_TREE for node 79
# node 80: type: TNT_STMT
# child SEQ_CUR for node 80
# node 81: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 81
# node 82: type: TNT_ARG
# child SEQ_CUR for node 82
# node 83: type: TNT_SYMBOL sym: res
# child SEQ_NEXT for node 80
# node 84: type: TNT_STMT
# child SEQ_CUR for node 84
# node 85: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 85
# node 86: type: TNT_ARG
# child SEQ_CUR for node 86
# node 87: type: TNT_STRCON str: "\n"
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
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (a)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (b)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (c)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (d)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (e)
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
# dest -> ST_PRIMITIVE (f)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (b)
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
# dest -> ST_LABEL (6)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (c)
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
# dest -> ST_LABEL (5)
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
# src1 -> ST_PRIMITIVE (d)
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
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (d)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (e)
# |
# >
# CNT_SNE
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
# src1 -> ST_PRIMITIVE (e)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (f)
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
# dest -> ST_LABEL (2)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (g)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (f)
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
# src1 -> ST_PRIMITIVE (g)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (a)
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
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (7)
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
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (7)
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
# src1 -> ST_INTCON (3333)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (7)
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
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (7)
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
# src1 -> ST_INTCON (5555)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (7)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (4)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (6666)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (7)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (5)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (7777)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (7)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (6)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (8888)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (7)
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

  _a:
    .space 4

  _b:
    .space 4

  _c:
    .space 4

  _d:
    .space 4

  _e:
    .space 4

  _f:
    .space 4

  _g:
    .space 4

  _res:
    .space 4

  _str0:
    .asciiz "\n"
    .align 2

.text

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
  sw $a0, 24($sp)

  li $t0, 1
  sw $t0, _a
  li $t0, 2
  sw $t0, _b
  li $t0, 3
  sw $t0, _c
  li $t0, 4
  sw $t0, _d
  li $t0, 5
  sw $t0, _e
  li $t0, 6
  sw $t0, _f
  lw $t0, _a
  lw $t1, _b
  slt $t2, $t0, $t1
  beq $t2, $zero, _L6
  lw $t0, _b
  lw $t1, _c
  sge $t2, $t0, $t1
  beq $t2, $zero, _L5
  lw $t0, _c
  lw $t1, _d
  slt $t2, $t0, $t1
  beq $t2, $zero, _L4
  lw $t0, _d
  lw $t1, _e
  sne $t2, $t0, $t1
  beq $t2, $zero, _L3
  lw $t0, _e
  lw $t1, _f
  slt $t2, $t0, $t1
  beq $t2, $zero, _L2
  lw $t0, _g
  lw $t1, _f
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, _g
  lw $t1, _a
  slt $t2, $t0, $t1
  beq $t2, $zero, _L0
  li $t0, 1111
  sw $t0, _res
  j _L7
_L0:
  li $t0, 2222
  sw $t0, _res
  j _L7
_L1:
  li $t0, 3333
  sw $t0, _res
  j _L7
_L2:
  li $t0, 4444
  sw $t0, _res
  j _L7
_L3:
  li $t0, 5555
  sw $t0, _res
  j _L7
_L4:
  li $t0, 6666
  sw $t0, _res
  j _L7
_L5:
  li $t0, 7777
  sw $t0, _res
  j _L7
_L6:
  li $t0, 8888
  sw $t0, _res
_L7:
  lw $t0, _res
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
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
