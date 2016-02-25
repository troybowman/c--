#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 9
# sym: i
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: x
#   line: 3
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x5
# sym: res
#   line: 4
#   type: ST_PRIMITIVE
#     base: PRIM_INT
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
# node 3: type: TNT_SYMBOL sym: i
# child RHS for node 2
# node 4: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_WHILE
# child WHILE_COND for node 6
# node 7: type: TNT_LT
# child LHS for node 7
# node 8: type: TNT_SYMBOL sym: i
# child RHS for node 7
# node 9: type: TNT_INTCON val: 5
# child WHILE_BODY for node 6
# node 10: type: TNT_STMT
# child SEQ_CUR for node 10
# node 11: type: TNT_ASSG
# child LHS for node 11
# node 12: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 12
# node 13: type: TNT_SYMBOL sym: i
# child RHS for node 11
# node 14: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 10
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_ASSG
# child LHS for node 16
# node 17: type: TNT_SYMBOL sym: i
# child RHS for node 16
# node 18: type: TNT_PLUS
# child LHS for node 18
# node 19: type: TNT_SYMBOL sym: i
# child RHS for node 18
# node 20: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 5
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_ASSG
# child LHS for node 22
# node 23: type: TNT_SYMBOL sym: res
# child RHS for node 22
# node 24: type: TNT_INTCON val: 123
# child SEQ_NEXT for node 21
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_WHILE
# child WHILE_COND for node 26
# node 27: type: TNT_NOT
# child RHS for node 27
# node 28: type: TNT_AND
# child LHS for node 28
# node 29: type: TNT_AND
# child LHS for node 29
# node 30: type: TNT_LEQ
# child LHS for node 30
# node 31: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 31
# node 32: type: TNT_DIV
# child LHS for node 32
# node 33: type: TNT_SYMBOL sym: i
# child RHS for node 32
# node 34: type: TNT_INTCON val: 5
# child RHS for node 30
# node 35: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 35
# node 36: type: TNT_DIV
# child LHS for node 36
# node 37: type: TNT_SYMBOL sym: i
# child RHS for node 36
# node 38: type: TNT_INTCON val: 4
# child RHS for node 29
# node 39: type: TNT_LEQ
# child LHS for node 39
# node 40: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 40
# node 41: type: TNT_DIV
# child LHS for node 41
# node 42: type: TNT_SYMBOL sym: i
# child RHS for node 41
# node 43: type: TNT_INTCON val: 4
# child RHS for node 39
# node 44: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 44
# node 45: type: TNT_DIV
# child LHS for node 45
# node 46: type: TNT_SYMBOL sym: i
# child RHS for node 45
# node 47: type: TNT_INTCON val: 3
# child RHS for node 28
# node 48: type: TNT_NOT
# child RHS for node 48
# node 49: type: TNT_NOT
# child RHS for node 49
# node 50: type: TNT_NOT
# child RHS for node 50
# node 51: type: TNT_OR
# child LHS for node 51
# node 52: type: TNT_OR
# child LHS for node 52
# node 53: type: TNT_GT
# child LHS for node 53
# node 54: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 54
# node 55: type: TNT_DIV
# child LHS for node 55
# node 56: type: TNT_SYMBOL sym: i
# child RHS for node 55
# node 57: type: TNT_INTCON val: 2
# child RHS for node 53
# node 58: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 58
# node 59: type: TNT_DIV
# child LHS for node 59
# node 60: type: TNT_SYMBOL sym: i
# child RHS for node 59
# node 61: type: TNT_INTCON val: 3
# child RHS for node 52
# node 62: type: TNT_GT
# child LHS for node 62
# node 63: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 63
# node 64: type: TNT_DIV
# child LHS for node 64
# node 65: type: TNT_SYMBOL sym: i
# child RHS for node 64
# node 66: type: TNT_INTCON val: 3
# child RHS for node 62
# node 67: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 67
# node 68: type: TNT_DIV
# child LHS for node 68
# node 69: type: TNT_SYMBOL sym: i
# child RHS for node 68
# node 70: type: TNT_INTCON val: 4
# child RHS for node 51
# node 71: type: TNT_GT
# child LHS for node 71
# node 72: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 72
# node 73: type: TNT_DIV
# child LHS for node 73
# node 74: type: TNT_SYMBOL sym: i
# child RHS for node 73
# node 75: type: TNT_INTCON val: 4
# child RHS for node 71
# node 76: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 76
# node 77: type: TNT_DIV
# child LHS for node 77
# node 78: type: TNT_SYMBOL sym: i
# child RHS for node 77
# node 79: type: TNT_INTCON val: 5
# child WHILE_BODY for node 26
# node 80: type: TNT_STMT
# child SEQ_CUR for node 80
# node 81: type: TNT_ASSG
# child LHS for node 81
# node 82: type: TNT_SYMBOL sym: res
# child RHS for node 81
# node 83: type: TNT_MULT
# child LHS for node 83
# node 84: type: TNT_SYMBOL sym: res
# child RHS for node 83
# node 85: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 80
# node 86: type: TNT_STMT
# child SEQ_CUR for node 86
# node 87: type: TNT_ASSG
# child LHS for node 87
# node 88: type: TNT_SYMBOL sym: i
# child RHS for node 87
# node 89: type: TNT_MINUS
# child LHS for node 89
# node 90: type: TNT_SYMBOL sym: i
# child RHS for node 89
# node 91: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 25
# node 92: type: TNT_STMT
# child SEQ_CUR for node 92
# node 93: type: TNT_PRINTF
# child PRINTF_TREE for node 93
# node 94: type: TNT_STMT
# child SEQ_CUR for node 94
# node 95: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 95
# node 96: type: TNT_ARG
# child SEQ_CUR for node 96
# node 97: type: TNT_SYMBOL sym: res
# child SEQ_NEXT for node 94
# node 98: type: TNT_STMT
# child SEQ_CUR for node 98
# node 99: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 99
# node 100: type: TNT_ARG
# child SEQ_CUR for node 100
# node 101: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    6
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (123)
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
# src1 -> ST_LABEL (2)
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
# CNT_DIV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
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
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
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
# src1 -> ST_INTCON (4)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (3)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (3)
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
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (3)
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
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (3)
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
# dest -> ST_TEMP (3)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (4)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (3)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (4)
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
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (3)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (3)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (4)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (3)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (4)
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
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (4)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (4)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (4)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (5)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (5)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (5)
# src1 -> ST_TEMP (4)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (5)
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
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (4)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (3)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (4)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (4)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (5)
# src1 -> ST_TEMP (3)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (5)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (5)
# src1 -> ST_TEMP (4)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (5)
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
# CNT_XOR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_INTCON (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (3)
# src1 -> ST_TEMP (0)
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
# CNT_MUL
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (res)
# src1 -> ST_TEMP (2)
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
# CNT_SUB
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

  _i:
    .space 4

  _x:
    .space 20

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

  li $t0, 0
  sw $t0, _i
_L0:
  lw $t0, _i
  li $t1, 5
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, _i
  lw $t1, _i
  sll $t2, $t1, 2
  la $t1, _x
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  lw $t0, _i
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, _i
  j _L0
_L1:
  li $t0, 123
  sw $t0, _res
_L2:
  lw $t0, _i
  li $t1, 5
  div $t2, $t0, $t1
  sll $t0, $t2, 2
  la $t1, _x
  addu $t2, $t1, $t0
  lw $t0, ($t2)
  lw $t1, _i
  li $t2, 4
  div $t3, $t1, $t2
  sll $t1, $t3, 2
  la $t2, _x
  addu $t3, $t2, $t1
  lw $t1, ($t3)
  sle $t2, $t0, $t1
  lw $t0, _i
  li $t1, 4
  div $t3, $t0, $t1
  sll $t0, $t3, 2
  la $t1, _x
  addu $t3, $t1, $t0
  lw $t0, ($t3)
  lw $t1, _i
  li $t3, 3
  div $t4, $t1, $t3
  sll $t1, $t4, 2
  la $t3, _x
  addu $t4, $t3, $t1
  lw $t1, ($t4)
  sle $t3, $t0, $t1
  and $t0, $t2, $t3
  lw $t1, _i
  li $t2, 2
  div $t3, $t1, $t2
  sll $t1, $t3, 2
  la $t2, _x
  addu $t3, $t2, $t1
  lw $t1, ($t3)
  lw $t2, _i
  li $t3, 3
  div $t4, $t2, $t3
  sll $t2, $t4, 2
  la $t3, _x
  addu $t4, $t3, $t2
  lw $t2, ($t4)
  sgt $t3, $t1, $t2
  lw $t1, _i
  li $t2, 3
  div $t4, $t1, $t2
  sll $t1, $t4, 2
  la $t2, _x
  addu $t4, $t2, $t1
  lw $t1, ($t4)
  lw $t2, _i
  li $t4, 4
  div $t5, $t2, $t4
  sll $t2, $t5, 2
  la $t4, _x
  addu $t5, $t4, $t2
  lw $t2, ($t5)
  sgt $t4, $t1, $t2
  or $t1, $t3, $t4
  lw $t2, _i
  li $t3, 4
  div $t4, $t2, $t3
  sll $t2, $t4, 2
  la $t3, _x
  addu $t4, $t3, $t2
  lw $t2, ($t4)
  lw $t3, _i
  li $t4, 5
  div $t5, $t3, $t4
  sll $t3, $t5, 2
  la $t4, _x
  addu $t5, $t4, $t3
  lw $t3, ($t5)
  sgt $t4, $t2, $t3
  or $t2, $t1, $t4
  xor $t1, $t2, 1
  xor $t2, $t1, 1
  xor $t1, $t2, 1
  and $t2, $t0, $t1
  xor $t0, $t2, 1
  beq $t0, $zero, _L3
  lw $t0, _res
  lw $t1, _i
  mul $t2, $t0, $t1
  sw $t2, _res
  lw $t0, _i
  li $t1, 1
  sub $t2, $t0, $t1
  sw $t2, _i
  j _L2
_L3:
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
