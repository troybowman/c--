#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 7
# sym: id
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
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
#   line: 8
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: main
#   line: 10
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: id
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: id
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_SYMBOL sym: x
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 2
# sym: x
#   line: 12
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: i
#   line: 12
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
# node 4: type: TNT_INTCON val: 123
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_IF
# child IF_COND for node 6
# node 7: type: TNT_GT
# child LHS for node 7
# node 8: type: TNT_CALL sym: id
# child CALL_ARGS for node 8
# node 9: type: TNT_ARG
# child SEQ_CUR for node 9
# node 10: type: TNT_CALL sym: id
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_INTCON val: 3
# child RHS for node 7
# node 13: type: TNT_CALL sym: id
# child CALL_ARGS for node 13
# node 14: type: TNT_ARG
# child SEQ_CUR for node 14
# node 15: type: TNT_CALL sym: id
# child CALL_ARGS for node 15
# node 16: type: TNT_ARG
# child SEQ_CUR for node 16
# node 17: type: TNT_CALL sym: id
# child CALL_ARGS for node 17
# node 18: type: TNT_ARG
# child SEQ_CUR for node 18
# node 19: type: TNT_INTCON val: 4
# child IF_BODY for node 6
# node 20: type: TNT_ASSG
# child LHS for node 20
# node 21: type: TNT_SYMBOL sym: x
# child RHS for node 20
# node 22: type: TNT_INTCON val: 321
# child SEQ_NEXT for node 5
# node 23: type: TNT_STMT
# child SEQ_CUR for node 23
# node 24: type: TNT_ASSG
# child LHS for node 24
# node 25: type: TNT_SYMBOL sym: i
# child RHS for node 24
# node 26: type: TNT_INTCON val: 12
# child SEQ_NEXT for node 23
# node 27: type: TNT_STMT
# child SEQ_CUR for node 27
# node 28: type: TNT_WHILE
# child WHILE_COND for node 28
# node 29: type: TNT_GT
# child LHS for node 29
# node 30: type: TNT_CALL sym: id
# child CALL_ARGS for node 30
# node 31: type: TNT_ARG
# child SEQ_CUR for node 31
# node 32: type: TNT_CALL sym: id
# child CALL_ARGS for node 32
# node 33: type: TNT_ARG
# child SEQ_CUR for node 33
# node 34: type: TNT_CALL sym: id
# child CALL_ARGS for node 34
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_SYMBOL sym: i
# child RHS for node 29
# node 37: type: TNT_INTCON val: 0
# child WHILE_BODY for node 28
# node 38: type: TNT_STMT
# child SEQ_CUR for node 38
# node 39: type: TNT_ASSG
# child LHS for node 39
# node 40: type: TNT_SYMBOL sym: x
# child RHS for node 39
# node 41: type: TNT_MINUS
# child LHS for node 41
# node 42: type: TNT_SYMBOL sym: x
# child RHS for node 41
# node 43: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 38
# node 44: type: TNT_STMT
# child SEQ_CUR for node 44
# node 45: type: TNT_ASSG
# child LHS for node 45
# node 46: type: TNT_SYMBOL sym: i
# child RHS for node 45
# node 47: type: TNT_MINUS
# child LHS for node 47
# node 48: type: TNT_SYMBOL sym: i
# child RHS for node 47
# node 49: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 44
# node 50: type: TNT_STMT
# child SEQ_CUR for node 50
# node 51: type: TNT_PRINTF
# child PRINTF_TREE for node 51
# node 52: type: TNT_STMT
# child SEQ_CUR for node 52
# node 53: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 53
# node 54: type: TNT_ARG
# child SEQ_CUR for node 54
# node 55: type: TNT_STRCON str: "x: "
# child SEQ_NEXT for node 52
# node 56: type: TNT_STMT
# child SEQ_CUR for node 56
# node 57: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 57
# node 58: type: TNT_ARG
# child SEQ_CUR for node 58
# node 59: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 56
# node 60: type: TNT_STMT
# child SEQ_CUR for node 60
# node 61: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 61
# node 62: type: TNT_ARG
# child SEQ_CUR for node 62
# node 63: type: TNT_STRCON str: ", i: "
# child SEQ_NEXT for node 60
# node 64: type: TNT_STMT
# child SEQ_CUR for node 64
# node 65: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 65
# node 66: type: TNT_ARG
# child SEQ_CUR for node 66
# node 67: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 64
# node 68: type: TNT_STMT
# child SEQ_CUR for node 68
# node 69: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 69
# node 70: type: TNT_ARG
# child SEQ_CUR for node 70
# node 71: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 27
# node 72: type: TNT_STMT
# child SEQ_CUR for node 72
# node 73: type: TNT_FOR
# child FOR_INIT for node 73
# node 74: type: TNT_ASSG
# child LHS for node 74
# node 75: type: TNT_SYMBOL sym: i
# child RHS for node 74
# node 76: type: TNT_CALL sym: id
# child CALL_ARGS for node 76
# node 77: type: TNT_ARG
# child SEQ_CUR for node 77
# node 78: type: TNT_INTCON val: 0
# child FOR_COND for node 73
# node 79: type: TNT_LT
# child LHS for node 79
# node 80: type: TNT_CALL sym: id
# child CALL_ARGS for node 80
# node 81: type: TNT_ARG
# child SEQ_CUR for node 81
# node 82: type: TNT_CALL sym: id
# child CALL_ARGS for node 82
# node 83: type: TNT_ARG
# child SEQ_CUR for node 83
# node 84: type: TNT_SYMBOL sym: i
# child RHS for node 79
# node 85: type: TNT_INTCON val: 6
# child FOR_INC for node 73
# node 86: type: TNT_ASSG
# child LHS for node 86
# node 87: type: TNT_SYMBOL sym: i
# child RHS for node 86
# node 88: type: TNT_PLUS
# child LHS for node 88
# node 89: type: TNT_CALL sym: id
# child CALL_ARGS for node 89
# node 90: type: TNT_ARG
# child SEQ_CUR for node 90
# node 91: type: TNT_SYMBOL sym: i
# child RHS for node 88
# node 92: type: TNT_INTCON val: 1
# child FOR_BODY for node 73
# node 93: type: TNT_STMT
# child SEQ_CUR for node 93
# node 94: type: TNT_ASSG
# child LHS for node 94
# node 95: type: TNT_SYMBOL sym: x
# child RHS for node 94
# node 96: type: TNT_PLUS
# child LHS for node 96
# node 97: type: TNT_SYMBOL sym: x
# child RHS for node 96
# node 98: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 93
# node 99: type: TNT_STMT
# child SEQ_CUR for node 99
# node 100: type: TNT_PRINTF
# child PRINTF_TREE for node 100
# node 101: type: TNT_STMT
# child SEQ_CUR for node 101
# node 102: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 102
# node 103: type: TNT_ARG
# child SEQ_CUR for node 103
# node 104: type: TNT_STRCON str: "x: "
# child SEQ_NEXT for node 101
# node 105: type: TNT_STMT
# child SEQ_CUR for node 105
# node 106: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 106
# node 107: type: TNT_ARG
# child SEQ_CUR for node 107
# node 108: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 105
# node 109: type: TNT_STMT
# child SEQ_CUR for node 109
# node 110: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 110
# node 111: type: TNT_ARG
# child SEQ_CUR for node 111
# node 112: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 72
# node 113: type: TNT_STMT
# child SEQ_CUR for node 113
# node 114: type: TNT_PRINTF
# child PRINTF_TREE for node 114
# node 115: type: TNT_STMT
# child SEQ_CUR for node 115
# node 116: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 116
# node 117: type: TNT_ARG
# child SEQ_CUR for node 117
# node 118: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 115
# node 119: type: TNT_STMT
# child SEQ_CUR for node 119
# node 120: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 120
# node 121: type: TNT_ARG
# child SEQ_CUR for node 121
# node 122: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: id
#-----------------------------------------------------------------------------
# temps used:    1
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   1
# stktemps used: 0
# regargs used:  1
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (123)
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
# src1 -> ST_INTCON (3)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (4)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SGT
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_SAVED_TEMPORARY (0)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (0)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (321)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (12)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (i)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SGT
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (2)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON ("x: ")
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
# src1 -> ST_STRCON (", i: ")
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
# src1 -> ST_PRIMITIVE (i)
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
# CNT_JUMP
# --------
# dest -> ST_LABEL (1)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (0)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (3)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (i)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (6)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (4)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON ("x: ")
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
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (i)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (3)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (4)
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

.data

  _str0:
    .asciiz "x: "
    .align 2

  _str1:
    .asciiz ", i: "
    .align 2

  _str2:
    .asciiz "\n"
    .align 2

.text

_id:

  # |--------------------------------|
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack
  la $sp, -0($sp)

  move $t0, $a0
  move $v0, $t0
  j __leave_id

__leave_id:
  la $sp, 0($sp)
  jr $ra

main:

  # |--------------------------------|
  # |               i                |
  # |--------------------------------| sp+28
  # |               x                |
  # |--------------------------------| sp+24
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 20($sp)
  sw $s0, 16($sp)

  li $t0, 123
  sw $t0, 24($sp)
  li $t0, 3
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $s0, $v0
  li $t0, 4
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $t0, $v0
  sgt $t1, $s0, $t0
  beq $t1, $zero, _L0
  li $t0, 321
  sw $t0, 24($sp)
_L0:
  li $t0, 12
  sw $t0, 28($sp)
_L1:
  lw $t0, 28($sp)
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $t0, $v0
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L2
  lw $t0, 24($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  sw $t2, 24($sp)
  lw $t0, 28($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  sw $t2, 28($sp)
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  j _L1
_L2:
  li $t0, 0
  move $a0, $t0
  jal _id
  move $t0, $v0
  sw $t0, 28($sp)
_L3:
  lw $t0, 28($sp)
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $t0, $v0
  li $t1, 6
  slt $t2, $t0, $t1
  beq $t2, $zero, _L4
  lw $t0, 24($sp)
  li $t1, 2
  add $t2, $t0, $t1
  sw $t2, 24($sp)
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  move $a0, $t0
  jal _id
  move $t0, $v0
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, 28($sp)
  j _L3
_L4:
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $s0, 16($sp)
  lw $ra, 20($sp)
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
