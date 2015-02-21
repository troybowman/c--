#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 5
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
#   line: 1
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 3
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 2
# sym: x
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: c
#   line: 6
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: x
# child RHS for node 2
# node 4: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: c
# child RHS for node 6
# node 8: type: TNT_CHARCON str: 'a'
# child SEQ_NEXT for node 5
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_PRINTF
# child PRINTF_TREE for node 10
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 12
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_STRCON str: "one: "
# child SEQ_NEXT for node 11
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 16
# node 17: type: TNT_ARG
# child SEQ_CUR for node 17
# node 18: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 15
# node 19: type: TNT_STMT
# child SEQ_CUR for node 19
# node 20: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 20
# node 21: type: TNT_ARG
# child SEQ_CUR for node 21
# node 22: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 9
# node 23: type: TNT_STMT
# child SEQ_CUR for node 23
# node 24: type: TNT_PRINTF
# child PRINTF_TREE for node 24
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 26
# node 27: type: TNT_ARG
# child SEQ_CUR for node 27
# node 28: type: TNT_STRCON str: "two: "
# child SEQ_NEXT for node 25
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_CALL sym: _print_char
# child CALL_ARGS for node 30
# node 31: type: TNT_ARG
# child SEQ_CUR for node 31
# node 32: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 29
# node 33: type: TNT_STMT
# child SEQ_CUR for node 33
# node 34: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 34
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 23
# node 37: type: TNT_STMT
# child SEQ_CUR for node 37
# node 38: type: TNT_PRINTF
# child PRINTF_TREE for node 38
# node 39: type: TNT_STMT
# child SEQ_CUR for node 39
# node 40: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 40
# node 41: type: TNT_ARG
# child SEQ_CUR for node 41
# node 42: type: TNT_STRCON str: "three "
# child SEQ_NEXT for node 39
# node 43: type: TNT_STMT
# child SEQ_CUR for node 43
# node 44: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 44
# node 45: type: TNT_ARG
# child SEQ_CUR for node 45
# node 46: type: TNT_STRCON str: "hello"
# child SEQ_NEXT for node 43
# node 47: type: TNT_STMT
# child SEQ_CUR for node 47
# node 48: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 48
# node 49: type: TNT_ARG
# child SEQ_CUR for node 49
# node 50: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 37
# node 51: type: TNT_STMT
# child SEQ_CUR for node 51
# node 52: type: TNT_PRINTF
# child PRINTF_TREE for node 52
# node 53: type: TNT_STMT
# child SEQ_CUR for node 53
# node 54: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 54
# node 55: type: TNT_ARG
# child SEQ_CUR for node 55
# node 56: type: TNT_STRCON str: "all together: ("
# child SEQ_NEXT for node 53
# node 57: type: TNT_STMT
# child SEQ_CUR for node 57
# node 58: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 58
# node 59: type: TNT_ARG
# child SEQ_CUR for node 59
# node 60: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 57
# node 61: type: TNT_STMT
# child SEQ_CUR for node 61
# node 62: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 62
# node 63: type: TNT_ARG
# child SEQ_CUR for node 63
# node 64: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 61
# node 65: type: TNT_STMT
# child SEQ_CUR for node 65
# node 66: type: TNT_CALL sym: _print_char
# child CALL_ARGS for node 66
# node 67: type: TNT_ARG
# child SEQ_CUR for node 67
# node 68: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 65
# node 69: type: TNT_STMT
# child SEQ_CUR for node 69
# node 70: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 70
# node 71: type: TNT_ARG
# child SEQ_CUR for node 71
# node 72: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 69
# node 73: type: TNT_STMT
# child SEQ_CUR for node 73
# node 74: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 74
# node 75: type: TNT_ARG
# child SEQ_CUR for node 75
# node 76: type: TNT_STRCON str: "hello again"
# child SEQ_NEXT for node 73
# node 77: type: TNT_STMT
# child SEQ_CUR for node 77
# node 78: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 78
# node 79: type: TNT_ARG
# child SEQ_CUR for node 79
# node 80: type: TNT_STRCON str: ")\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    1
# svregs used:   0
# stktemps used: 0
# regargs used:  1
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_CHARCON ('a')
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (c)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON ("one: ")
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
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON ("two: ")
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
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (c)
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
# src1 -> ST_FUNCTION (_print_char)
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
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON ("three ")
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
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON ("hello")
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
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON ("all together: (")
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
# src1 -> ST_STRCON (", ")
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
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (c)
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
# src1 -> ST_FUNCTION (_print_char)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON (", ")
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
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON ("hello again")
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
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON (")\n")
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

  _str0:
    .asciiz "one: "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

  _str2:
    .asciiz "two: "
    .align 2

  _str3:
    .asciiz "three "
    .align 2

  _str4:
    .asciiz "hello"
    .align 2

  _str5:
    .asciiz "all together: ("
    .align 2

  _str6:
    .asciiz ", "
    .align 2

  _str7:
    .asciiz "hello again"
    .align 2

  _str8:
    .asciiz ")\n"
    .align 2

.text

main:

  # |--------------------------------|
  # |               c                |
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

  li $t0, 1
  sw $t0, 24($sp)
  li, $t0, 'a'
  sb $t0, 28($sp)
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  lb $t0, 28($sp)
  move $a0, $t0
  jal __print_char
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  la $t0, _str4
  move $a0, $t0
  jal __print_string
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  la $t0, _str5
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str6
  move $a0, $t0
  jal __print_string
  lb $t0, 28($sp)
  move $a0, $t0
  jal __print_char
  la $t0, _str6
  move $a0, $t0
  jal __print_string
  la $t0, _str7
  move $a0, $t0
  jal __print_string
  la $t0, _str8
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $ra, 16($sp)
  la $sp, 32($sp)
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
