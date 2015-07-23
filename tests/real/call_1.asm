#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 7
# sym: add
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: y
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
# LOCAL SYMBOLS FOR FUNCTION: add
#-----------------------------------------------------------------------------
# size: 2
# sym: x
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: add
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_PLUS
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: x
# child RHS for node 3
# node 5: type: TNT_SYMBOL sym: y
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 7
# sym: a
#   line: 12
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: b
#   line: 12
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: c
#   line: 12
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: d
#   line: 12
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: e
#   line: 12
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: i
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: f
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: f
# child RHS for node 2
# node 4: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_FOR
# child FOR_INIT for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_SYMBOL sym: i
# child RHS for node 7
# node 9: type: TNT_INTCON val: 7
# child FOR_COND for node 6
# node 10: type: TNT_GT
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: i
# child RHS for node 10
# node 12: type: TNT_INTCON val: 0
# child FOR_INC for node 6
# node 13: type: TNT_ASSG
# child LHS for node 13
# node 14: type: TNT_SYMBOL sym: i
# child RHS for node 13
# node 15: type: TNT_MINUS
# child LHS for node 15
# node 16: type: TNT_SYMBOL sym: i
# child RHS for node 15
# node 17: type: TNT_INTCON val: 1
# child FOR_BODY for node 6
# node 18: type: TNT_STMT
# child SEQ_CUR for node 18
# node 19: type: TNT_ASSG
# child LHS for node 19
# node 20: type: TNT_SYMBOL sym: a
# child RHS for node 19
# node 21: type: TNT_CALL sym: add
# child CALL_ARGS for node 21
# node 22: type: TNT_ARG
# child SEQ_CUR for node 22
# node 23: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 22
# node 24: type: TNT_ARG
# child SEQ_CUR for node 24
# node 25: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 18
# node 26: type: TNT_STMT
# child SEQ_CUR for node 26
# node 27: type: TNT_PRINTF
# child PRINTF_TREE for node 27
# node 28: type: TNT_STMT
# child SEQ_CUR for node 28
# node 29: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 29
# node 30: type: TNT_ARG
# child SEQ_CUR for node 30
# node 31: type: TNT_STRCON str: "a is now: "
# child SEQ_NEXT for node 28
# node 32: type: TNT_STMT
# child SEQ_CUR for node 32
# node 33: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 33
# node 34: type: TNT_ARG
# child SEQ_CUR for node 34
# node 35: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 32
# node 36: type: TNT_STMT
# child SEQ_CUR for node 36
# node 37: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 37
# node 38: type: TNT_ARG
# child SEQ_CUR for node 38
# node 39: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 26
# node 40: type: TNT_STMT
# child SEQ_CUR for node 40
# node 41: type: TNT_ASSG
# child LHS for node 41
# node 42: type: TNT_SYMBOL sym: b
# child RHS for node 41
# node 43: type: TNT_CALL sym: add
# child CALL_ARGS for node 43
# node 44: type: TNT_ARG
# child SEQ_CUR for node 44
# node 45: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 44
# node 46: type: TNT_ARG
# child SEQ_CUR for node 46
# node 47: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 40
# node 48: type: TNT_STMT
# child SEQ_CUR for node 48
# node 49: type: TNT_PRINTF
# child PRINTF_TREE for node 49
# node 50: type: TNT_STMT
# child SEQ_CUR for node 50
# node 51: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 51
# node 52: type: TNT_ARG
# child SEQ_CUR for node 52
# node 53: type: TNT_STRCON str: "b is now: "
# child SEQ_NEXT for node 50
# node 54: type: TNT_STMT
# child SEQ_CUR for node 54
# node 55: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 55
# node 56: type: TNT_ARG
# child SEQ_CUR for node 56
# node 57: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 54
# node 58: type: TNT_STMT
# child SEQ_CUR for node 58
# node 59: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 59
# node 60: type: TNT_ARG
# child SEQ_CUR for node 60
# node 61: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 48
# node 62: type: TNT_STMT
# child SEQ_CUR for node 62
# node 63: type: TNT_ASSG
# child LHS for node 63
# node 64: type: TNT_SYMBOL sym: c
# child RHS for node 63
# node 65: type: TNT_CALL sym: add
# child CALL_ARGS for node 65
# node 66: type: TNT_ARG
# child SEQ_CUR for node 66
# node 67: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 66
# node 68: type: TNT_ARG
# child SEQ_CUR for node 68
# node 69: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 62
# node 70: type: TNT_STMT
# child SEQ_CUR for node 70
# node 71: type: TNT_PRINTF
# child PRINTF_TREE for node 71
# node 72: type: TNT_STMT
# child SEQ_CUR for node 72
# node 73: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 73
# node 74: type: TNT_ARG
# child SEQ_CUR for node 74
# node 75: type: TNT_STRCON str: "c is now: "
# child SEQ_NEXT for node 72
# node 76: type: TNT_STMT
# child SEQ_CUR for node 76
# node 77: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 77
# node 78: type: TNT_ARG
# child SEQ_CUR for node 78
# node 79: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 76
# node 80: type: TNT_STMT
# child SEQ_CUR for node 80
# node 81: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 81
# node 82: type: TNT_ARG
# child SEQ_CUR for node 82
# node 83: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 70
# node 84: type: TNT_STMT
# child SEQ_CUR for node 84
# node 85: type: TNT_ASSG
# child LHS for node 85
# node 86: type: TNT_SYMBOL sym: d
# child RHS for node 85
# node 87: type: TNT_CALL sym: add
# child CALL_ARGS for node 87
# node 88: type: TNT_ARG
# child SEQ_CUR for node 88
# node 89: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 88
# node 90: type: TNT_ARG
# child SEQ_CUR for node 90
# node 91: type: TNT_NEG
# child RHS for node 91
# node 92: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 84
# node 93: type: TNT_STMT
# child SEQ_CUR for node 93
# node 94: type: TNT_PRINTF
# child PRINTF_TREE for node 94
# node 95: type: TNT_STMT
# child SEQ_CUR for node 95
# node 96: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 96
# node 97: type: TNT_ARG
# child SEQ_CUR for node 97
# node 98: type: TNT_STRCON str: "d is now: "
# child SEQ_NEXT for node 95
# node 99: type: TNT_STMT
# child SEQ_CUR for node 99
# node 100: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 100
# node 101: type: TNT_ARG
# child SEQ_CUR for node 101
# node 102: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 99
# node 103: type: TNT_STMT
# child SEQ_CUR for node 103
# node 104: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 104
# node 105: type: TNT_ARG
# child SEQ_CUR for node 105
# node 106: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 93
# node 107: type: TNT_STMT
# child SEQ_CUR for node 107
# node 108: type: TNT_ASSG
# child LHS for node 108
# node 109: type: TNT_SYMBOL sym: e
# child RHS for node 108
# node 110: type: TNT_CALL sym: add
# child CALL_ARGS for node 110
# node 111: type: TNT_ARG
# child SEQ_CUR for node 111
# node 112: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 111
# node 113: type: TNT_ARG
# child SEQ_CUR for node 113
# node 114: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 107
# node 115: type: TNT_STMT
# child SEQ_CUR for node 115
# node 116: type: TNT_PRINTF
# child PRINTF_TREE for node 116
# node 117: type: TNT_STMT
# child SEQ_CUR for node 117
# node 118: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 118
# node 119: type: TNT_ARG
# child SEQ_CUR for node 119
# node 120: type: TNT_STRCON str: "e is now: "
# child SEQ_NEXT for node 117
# node 121: type: TNT_STMT
# child SEQ_CUR for node 121
# node 122: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 122
# node 123: type: TNT_ARG
# child SEQ_CUR for node 123
# node 124: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 121
# node 125: type: TNT_STMT
# child SEQ_CUR for node 125
# node 126: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 126
# node 127: type: TNT_ARG
# child SEQ_CUR for node 127
# node 128: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 115
# node 129: type: TNT_STMT
# child SEQ_CUR for node 129
# node 130: type: TNT_ASSG
# child LHS for node 130
# node 131: type: TNT_SYMBOL sym: f
# child RHS for node 130
# node 132: type: TNT_MULT
# child LHS for node 132
# node 133: type: TNT_SYMBOL sym: f
# child RHS for node 132
# node 134: type: TNT_CALL sym: add
# child CALL_ARGS for node 134
# node 135: type: TNT_ARG
# child SEQ_CUR for node 135
# node 136: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 135
# node 137: type: TNT_ARG
# child SEQ_CUR for node 137
# node 138: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 129
# node 139: type: TNT_STMT
# child SEQ_CUR for node 139
# node 140: type: TNT_PRINTF
# child PRINTF_TREE for node 140
# node 141: type: TNT_STMT
# child SEQ_CUR for node 141
# node 142: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 142
# node 143: type: TNT_ARG
# child SEQ_CUR for node 143
# node 144: type: TNT_STRCON str: "f is now: "
# child SEQ_NEXT for node 141
# node 145: type: TNT_STMT
# child SEQ_CUR for node 145
# node 146: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 146
# node 147: type: TNT_ARG
# child SEQ_CUR for node 147
# node 148: type: TNT_SYMBOL sym: f
# child SEQ_NEXT for node 145
# node 149: type: TNT_STMT
# child SEQ_CUR for node 149
# node 150: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 150
# node 151: type: TNT_ARG
# child SEQ_CUR for node 151
# node 152: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 5
# node 153: type: TNT_STMT
# child SEQ_CUR for node 153
# node 154: type: TNT_PRINTF
# child PRINTF_TREE for node 154
# node 155: type: TNT_STMT
# child SEQ_CUR for node 155
# node 156: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 156
# node 157: type: TNT_ARG
# child SEQ_CUR for node 157
# node 158: type: TNT_SYMBOL sym: f
# child SEQ_NEXT for node 155
# node 159: type: TNT_STMT
# child SEQ_CUR for node 159
# node 160: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 160
# node 161: type: TNT_ARG
# child SEQ_CUR for node 161
# node 162: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: add
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
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
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (2)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   1
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
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
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
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
# src1 -> ST_FUNCTION (add)
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
# dest -> ST_PRIMITIVE (a)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("a is now: ")
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
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (a)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
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
# src1 -> ST_FUNCTION (add)
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
# dest -> ST_PRIMITIVE (b)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("b is now: ")
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
# src1 -> ST_INTCON (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (b)
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
# src1 -> ST_FUNCTION (add)
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
# dest -> ST_PRIMITIVE (c)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("c is now: ")
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
# src1 -> ST_PRIMITIVE (c)
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
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ZERO
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (2)
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
# src1 -> ST_FUNCTION (add)
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
# dest -> ST_PRIMITIVE (d)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("d is now: ")
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
# src1 -> ST_PRIMITIVE (d)
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
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (d)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
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
# src1 -> ST_FUNCTION (add)
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
# dest -> ST_PRIMITIVE (e)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("e is now: ")
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
# src1 -> ST_PRIMITIVE (e)
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
# CNT_LW
# ------
# dest -> ST_SVTEMP (0)
# src1 -> ST_PRIMITIVE (f)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (e)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
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
# src1 -> ST_FUNCTION (add)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (f)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("f is now: ")
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
# src1 -> ST_PRIMITIVE (f)
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
# src1 -> ST_PRIMITIVE (f)
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
    .asciiz "a is now: "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

  _str2:
    .asciiz "b is now: "
    .align 2

  _str3:
    .asciiz "c is now: "
    .align 2

  _str4:
    .asciiz "d is now: "
    .align 2

  _str5:
    .asciiz "e is now: "
    .align 2

  _str6:
    .asciiz "f is now: "
    .align 2

.text

_add:

  # |--------------------------------|
  # |         <y is in $a1>          |
  # |--------------------------------| sp+4
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack
  la $sp, -0($sp)

  move $t0, $a0
  move $t1, $a1
  addu $t2, $t0, $t1
  move $v0, $t2
  j __leave_add

__leave_add:
  la $sp, 0($sp)
  jr $ra

main:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+52
  # |               f                |
  # |--------------------------------| sp+48
  # |               i                |
  # |--------------------------------| sp+44
  # |               e                |
  # |--------------------------------| sp+40
  # |               d                |
  # |--------------------------------| sp+36
  # |               c                |
  # |--------------------------------| sp+32
  # |               b                |
  # |--------------------------------| sp+28
  # |               a                |
  # |--------------------------------| sp+24
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -56($sp)
  sw $s0, 16($sp)
  sw $ra, 20($sp)
  sw $a0, 56($sp)
  sw $a1, 60($sp)

  li $t0, 1
  sw $t0, 48($sp)
  li $t0, 7
  sw $t0, 44($sp)
_L0:
  lw $t0, 44($sp)
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 44($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  sw $t0, 24($sp)
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  sw $t0, 28($sp)
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 2
  lw $t1, 28($sp)
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  sw $t0, 32($sp)
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 5
  sub $t2, $zero, $t1
  move $a1, $t2
  move $a0, $t0
  jal _add
  move $t0, $v0
  sw $t0, 36($sp)
  la $t0, _str4
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  sw $t0, 40($sp)
  la $t0, _str5
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $s0, 48($sp)
  lw $t0, 40($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  mul $t1, $s0, $t0
  sw $t1, 48($sp)
  la $t0, _str6
  move $a0, $t0
  jal __print_string
  lw $t0, 48($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 44($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  sw $t2, 44($sp)
  j _L0
_L1:
  lw $t0, 48($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a1, 60($sp)
  lw $a0, 56($sp)
  lw $ra, 20($sp)
  lw $s0, 16($sp)
  la $sp, 56($sp)
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
