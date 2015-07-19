#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 17
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
# sym: h
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: i
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: j
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
# node 26: type: TNT_ASSG
# child LHS for node 26
# node 27: type: TNT_SYMBOL sym: g
# child RHS for node 26
# node 28: type: TNT_INTCON val: 7
# child SEQ_NEXT for node 25
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_ASSG
# child LHS for node 30
# node 31: type: TNT_SYMBOL sym: h
# child RHS for node 30
# node 32: type: TNT_INTCON val: 8
# child SEQ_NEXT for node 29
# node 33: type: TNT_STMT
# child SEQ_CUR for node 33
# node 34: type: TNT_ASSG
# child LHS for node 34
# node 35: type: TNT_SYMBOL sym: i
# child RHS for node 34
# node 36: type: TNT_INTCON val: 9
# child SEQ_NEXT for node 33
# node 37: type: TNT_STMT
# child SEQ_CUR for node 37
# node 38: type: TNT_ASSG
# child LHS for node 38
# node 39: type: TNT_SYMBOL sym: j
# child RHS for node 38
# node 40: type: TNT_INTCON val: 10
# child SEQ_NEXT for node 37
# node 41: type: TNT_STMT
# child SEQ_CUR for node 41
# node 42: type: TNT_IF
# child IF_COND for node 42
# node 43: type: TNT_AND
# child LHS for node 43
# node 44: type: TNT_AND
# child LHS for node 44
# node 45: type: TNT_AND
# child LHS for node 45
# node 46: type: TNT_AND
# child LHS for node 46
# node 47: type: TNT_LEQ
# child LHS for node 47
# node 48: type: TNT_SYMBOL sym: a
# child RHS for node 47
# node 49: type: TNT_SYMBOL sym: b
# child RHS for node 46
# node 50: type: TNT_LEQ
# child LHS for node 50
# node 51: type: TNT_SYMBOL sym: b
# child RHS for node 50
# node 52: type: TNT_SYMBOL sym: c
# child RHS for node 45
# node 53: type: TNT_LEQ
# child LHS for node 53
# node 54: type: TNT_SYMBOL sym: c
# child RHS for node 53
# node 55: type: TNT_SYMBOL sym: d
# child RHS for node 44
# node 56: type: TNT_LEQ
# child LHS for node 56
# node 57: type: TNT_SYMBOL sym: d
# child RHS for node 56
# node 58: type: TNT_SYMBOL sym: e
# child RHS for node 43
# node 59: type: TNT_NOT
# child RHS for node 59
# node 60: type: TNT_NOT
# child RHS for node 60
# node 61: type: TNT_NOT
# child RHS for node 61
# node 62: type: TNT_OR
# child LHS for node 62
# node 63: type: TNT_OR
# child LHS for node 63
# node 64: type: TNT_OR
# child LHS for node 64
# node 65: type: TNT_OR
# child LHS for node 65
# node 66: type: TNT_GT
# child LHS for node 66
# node 67: type: TNT_SYMBOL sym: e
# child RHS for node 66
# node 68: type: TNT_SYMBOL sym: f
# child RHS for node 65
# node 69: type: TNT_GT
# child LHS for node 69
# node 70: type: TNT_SYMBOL sym: f
# child RHS for node 69
# node 71: type: TNT_SYMBOL sym: g
# child RHS for node 64
# node 72: type: TNT_GT
# child LHS for node 72
# node 73: type: TNT_SYMBOL sym: g
# child RHS for node 72
# node 74: type: TNT_SYMBOL sym: h
# child RHS for node 63
# node 75: type: TNT_GT
# child LHS for node 75
# node 76: type: TNT_SYMBOL sym: h
# child RHS for node 75
# node 77: type: TNT_SYMBOL sym: i
# child RHS for node 62
# node 78: type: TNT_GT
# child LHS for node 78
# node 79: type: TNT_SYMBOL sym: i
# child RHS for node 78
# node 80: type: TNT_SYMBOL sym: j
# child IF_BODY for node 42
# node 81: type: TNT_ASSG
# child LHS for node 81
# node 82: type: TNT_SYMBOL sym: res
# child RHS for node 81
# node 83: type: TNT_INTCON val: 1111
# child IF_ELSE for node 42
# node 84: type: TNT_ASSG
# child LHS for node 84
# node 85: type: TNT_SYMBOL sym: res
# child RHS for node 84
# node 86: type: TNT_INTCON val: 2222
# child SEQ_NEXT for node 41
# node 87: type: TNT_STMT
# child SEQ_CUR for node 87
# node 88: type: TNT_PRINTF
# child PRINTF_TREE for node 88
# node 89: type: TNT_STMT
# child SEQ_CUR for node 89
# node 90: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 90
# node 91: type: TNT_ARG
# child SEQ_CUR for node 91
# node 92: type: TNT_SYMBOL sym: res
# child SEQ_NEXT for node 89
# node 93: type: TNT_STMT
# child SEQ_CUR for node 93
# node 94: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 94
# node 95: type: TNT_ARG
# child SEQ_CUR for node 95
# node 96: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    5
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (7)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (g)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (h)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (9)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (10)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (j)
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
# CNT_SLE
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
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
# CNT_SLE
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
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (d)
# |
# >
# CNT_SLE
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
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
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (e)
# |
# >
# CNT_SLE
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (e)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (f)
# |
# >
# CNT_SGT
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (f)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (g)
# |
# >
# CNT_SGT
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (3)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (g)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_PRIMITIVE (h)
# |
# >
# CNT_SGT
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (h)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_SGT
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_PRIMITIVE (j)
# |
# >
# CNT_SGT
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_INTCON (1)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (1)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_INTCON (1)
# |
# >
# CNT_AND
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
# dest -> ST_PRIMITIVE (res)
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

  _h:
    .space 4

  _i:
    .space 4

  _j:
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
  li $t0, 7
  sw $t0, _g
  li $t0, 8
  sw $t0, _h
  li $t0, 9
  sw $t0, _i
  li $t0, 10
  sw $t0, _j
  lw $t0, _a
  lw $t1, _b
  sle $t2, $t0, $t1
  lw $t0, _b
  lw $t1, _c
  sle $t3, $t0, $t1
  and $t0, $t2, $t3
  lw $t1, _c
  lw $t2, _d
  sle $t3, $t1, $t2
  and $t1, $t0, $t3
  lw $t0, _d
  lw $t2, _e
  sle $t3, $t0, $t2
  and $t0, $t1, $t3
  lw $t1, _e
  lw $t2, _f
  sgt $t3, $t1, $t2
  lw $t1, _f
  lw $t2, _g
  sgt $t4, $t1, $t2
  or $t1, $t3, $t4
  lw $t2, _g
  lw $t3, _h
  sgt $t4, $t2, $t3
  or $t2, $t1, $t4
  lw $t1, _h
  lw $t3, _i
  sgt $t4, $t1, $t3
  or $t1, $t2, $t4
  lw $t2, _i
  lw $t3, _j
  sgt $t4, $t2, $t3
  or $t2, $t1, $t4
  xor $t1, $t2, 1
  xor $t2, $t1, 1
  xor $t1, $t2, 1
  and $t2, $t0, $t1
  beq $t2, $zero, _L0
  li $t0, 1111
  sw $t0, _res
  j _L1
_L0:
  li $t0, 2222
  sw $t0, _res
_L1:
  lw $t0, _res
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
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
