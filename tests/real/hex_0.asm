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
#   line: 1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 3
# sym: a
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: b
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: c
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_PRINTF
# child PRINTF_TREE for node 2
# node 3: type: TNT_STMT
# child SEQ_CUR for node 3
# node 4: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 4
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 3
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 8
# node 9: type: TNT_ARG
# child SEQ_CUR for node 9
# node 10: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 1
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_PRINTF
# child PRINTF_TREE for node 12
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 14
# node 15: type: TNT_ARG
# child SEQ_CUR for node 15
# node 16: type: TNT_INTCON val: 10
# child SEQ_NEXT for node 13
# node 17: type: TNT_STMT
# child SEQ_CUR for node 17
# node 18: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 18
# node 19: type: TNT_ARG
# child SEQ_CUR for node 19
# node 20: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 11
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_PRINTF
# child PRINTF_TREE for node 22
# node 23: type: TNT_STMT
# child SEQ_CUR for node 23
# node 24: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 24
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_INTCON val: 22
# child SEQ_NEXT for node 23
# node 27: type: TNT_STMT
# child SEQ_CUR for node 27
# node 28: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 28
# node 29: type: TNT_ARG
# child SEQ_CUR for node 29
# node 30: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 21
# node 31: type: TNT_STMT
# child SEQ_CUR for node 31
# node 32: type: TNT_PRINTF
# child PRINTF_TREE for node 32
# node 33: type: TNT_STMT
# child SEQ_CUR for node 33
# node 34: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 34
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_INTCON val: 305419896
# child SEQ_NEXT for node 33
# node 37: type: TNT_STMT
# child SEQ_CUR for node 37
# node 38: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 38
# node 39: type: TNT_ARG
# child SEQ_CUR for node 39
# node 40: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 31
# node 41: type: TNT_STMT
# child SEQ_CUR for node 41
# node 42: type: TNT_PRINTF
# child PRINTF_TREE for node 42
# node 43: type: TNT_STMT
# child SEQ_CUR for node 43
# node 44: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 44
# node 45: type: TNT_ARG
# child SEQ_CUR for node 45
# node 46: type: TNT_INTCON val: 43981
# child SEQ_NEXT for node 43
# node 47: type: TNT_STMT
# child SEQ_CUR for node 47
# node 48: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 48
# node 49: type: TNT_ARG
# child SEQ_CUR for node 49
# node 50: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 41
# node 51: type: TNT_STMT
# child SEQ_CUR for node 51
# node 52: type: TNT_PRINTF
# child PRINTF_TREE for node 52
# node 53: type: TNT_STMT
# child SEQ_CUR for node 53
# node 54: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 54
# node 55: type: TNT_ARG
# child SEQ_CUR for node 55
# node 56: type: TNT_PLUS
# child LHS for node 56
# node 57: type: TNT_INTCON val: 4660
# child RHS for node 56
# node 58: type: TNT_INTCON val: 22136
# child SEQ_NEXT for node 53
# node 59: type: TNT_STMT
# child SEQ_CUR for node 59
# node 60: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 60
# node 61: type: TNT_ARG
# child SEQ_CUR for node 61
# node 62: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 51
# node 63: type: TNT_STMT
# child SEQ_CUR for node 63
# node 64: type: TNT_PRINTF
# child PRINTF_TREE for node 64
# node 65: type: TNT_STMT
# child SEQ_CUR for node 65
# node 66: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 66
# node 67: type: TNT_ARG
# child SEQ_CUR for node 67
# node 68: type: TNT_PLUS
# child LHS for node 68
# node 69: type: TNT_INTCON val: 37121
# child RHS for node 68
# node 70: type: TNT_INTCON val: 4385
# child SEQ_NEXT for node 65
# node 71: type: TNT_STMT
# child SEQ_CUR for node 71
# node 72: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 72
# node 73: type: TNT_ARG
# child SEQ_CUR for node 73
# node 74: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 63
# node 75: type: TNT_STMT
# child SEQ_CUR for node 75
# node 76: type: TNT_ASSG
# child LHS for node 76
# node 77: type: TNT_SYMBOL sym: a
# child RHS for node 76
# node 78: type: TNT_INTCON val: 4369
# child SEQ_NEXT for node 75
# node 79: type: TNT_STMT
# child SEQ_CUR for node 79
# node 80: type: TNT_ASSG
# child LHS for node 80
# node 81: type: TNT_SYMBOL sym: b
# child RHS for node 80
# node 82: type: TNT_INTCON val: 8738
# child SEQ_NEXT for node 79
# node 83: type: TNT_STMT
# child SEQ_CUR for node 83
# node 84: type: TNT_ASSG
# child LHS for node 84
# node 85: type: TNT_SYMBOL sym: c
# child RHS for node 84
# node 86: type: TNT_INTCON val: 13107
# child SEQ_NEXT for node 83
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
# node 92: type: TNT_MINUS
# child LHS for node 92
# node 93: type: TNT_MULT
# child LHS for node 93
# node 94: type: TNT_SYMBOL sym: a
# child RHS for node 93
# node 95: type: TNT_SYMBOL sym: b
# child RHS for node 92
# node 96: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 89
# node 97: type: TNT_STMT
# child SEQ_CUR for node 97
# node 98: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 98
# node 99: type: TNT_ARG
# child SEQ_CUR for node 99
# node 100: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 87
# node 101: type: TNT_STMT
# child SEQ_CUR for node 101
# node 102: type: TNT_PRINTF
# child PRINTF_TREE for node 102
# node 103: type: TNT_STMT
# child SEQ_CUR for node 103
# node 104: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 104
# node 105: type: TNT_ARG
# child SEQ_CUR for node 105
# node 106: type: TNT_NEG
# child RHS for node 106
# node 107: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 103
# node 108: type: TNT_STMT
# child SEQ_CUR for node 108
# node 109: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 109
# node 110: type: TNT_ARG
# child SEQ_CUR for node 110
# node 111: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 101
# node 112: type: TNT_STMT
# child SEQ_CUR for node 112
# node 113: type: TNT_PRINTF
# child PRINTF_TREE for node 113
# node 114: type: TNT_STMT
# child SEQ_CUR for node 114
# node 115: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 115
# node 116: type: TNT_ARG
# child SEQ_CUR for node 116
# node 117: type: TNT_NEG
# child RHS for node 117
# node 118: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 114
# node 119: type: TNT_STMT
# child SEQ_CUR for node 119
# node 120: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 120
# node 121: type: TNT_ARG
# child SEQ_CUR for node 121
# node 122: type: TNT_STRCON str: "\n"
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
# src1 -> ST_INTCON (0)
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
# src1 -> ST_FUNCTION (_print_string)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (10)
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
# src1 -> ST_FUNCTION (_print_string)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (22)
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
# src1 -> ST_FUNCTION (_print_string)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (305419896)
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
# src1 -> ST_FUNCTION (_print_string)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (43981)
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
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (4660)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (22136)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
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
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (37121)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4385)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
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
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (4369)
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
# src1 -> ST_INTCON (8738)
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
# src1 -> ST_INTCON (13107)
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
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (1)
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
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ZERO
# src2 -> ST_TEMP (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (1)
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
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ZERO
# src2 -> ST_TEMP (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (1)
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
    .asciiz " "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

.text

main:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+36
  # |               c                |
  # |--------------------------------| sp+32
  # |               b                |
  # |--------------------------------| sp+28
  # |               a                |
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
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 10
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 22
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 305419896
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 43981
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 4660
  li $t1, 22136
  addu $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 37121
  li $t1, 4385
  addu $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 4369
  sw $t0, 24($sp)
  li $t0, 8738
  sw $t0, 28($sp)
  li $t0, 13107
  sw $t0, 32($sp)
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  mul $t2, $t0, $t1
  lw $t0, 32($sp)
  sub $t1, $t2, $t0
  move $a0, $t1
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  sub $t1, $zero, $t0
  move $a0, $t1
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  sub $t1, $zero, $t0
  move $a0, $t1
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
