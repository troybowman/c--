#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 8
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
# sym: id
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: sum
#   line: 8
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: a
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: b
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       2: c
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       3: d
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       4: e
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       5: f
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       6: g
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       7: h
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       8: i
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       9: j
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       10: k
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       11: l
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       12: m
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       13: n
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       14: o
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       15: p
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       16: q
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       17: r
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       18: s
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       19: t
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: main
#   line: 13
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
# LOCAL SYMBOLS FOR FUNCTION: sum
#-----------------------------------------------------------------------------
# size: 20
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
# sym: d
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: e
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: f
#   line: 6
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: g
#   line: 6
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: h
#   line: 6
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: i
#   line: 6
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: j
#   line: 6
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: k
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: l
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: m
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: n
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: o
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: p
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: q
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: r
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: s
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: t
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: sum
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_PRINTF
# child PRINTF_TREE for node 2
# node 3: type: TNT_STMT
# child SEQ_CUR for node 3
# node 4: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 4
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_STRCON str: "sum: "
# child SEQ_NEXT for node 3
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 8
# node 9: type: TNT_ARG
# child SEQ_CUR for node 9
# node 10: type: TNT_PLUS
# child LHS for node 10
# node 11: type: TNT_PLUS
# child LHS for node 11
# node 12: type: TNT_PLUS
# child LHS for node 12
# node 13: type: TNT_PLUS
# child LHS for node 13
# node 14: type: TNT_PLUS
# child LHS for node 14
# node 15: type: TNT_PLUS
# child LHS for node 15
# node 16: type: TNT_PLUS
# child LHS for node 16
# node 17: type: TNT_PLUS
# child LHS for node 17
# node 18: type: TNT_PLUS
# child LHS for node 18
# node 19: type: TNT_PLUS
# child LHS for node 19
# node 20: type: TNT_PLUS
# child LHS for node 20
# node 21: type: TNT_PLUS
# child LHS for node 21
# node 22: type: TNT_PLUS
# child LHS for node 22
# node 23: type: TNT_PLUS
# child LHS for node 23
# node 24: type: TNT_PLUS
# child LHS for node 24
# node 25: type: TNT_PLUS
# child LHS for node 25
# node 26: type: TNT_PLUS
# child LHS for node 26
# node 27: type: TNT_PLUS
# child LHS for node 27
# node 28: type: TNT_PLUS
# child LHS for node 28
# node 29: type: TNT_SYMBOL sym: a
# child RHS for node 28
# node 30: type: TNT_SYMBOL sym: b
# child RHS for node 27
# node 31: type: TNT_SYMBOL sym: c
# child RHS for node 26
# node 32: type: TNT_SYMBOL sym: d
# child RHS for node 25
# node 33: type: TNT_SYMBOL sym: e
# child RHS for node 24
# node 34: type: TNT_SYMBOL sym: f
# child RHS for node 23
# node 35: type: TNT_SYMBOL sym: g
# child RHS for node 22
# node 36: type: TNT_SYMBOL sym: h
# child RHS for node 21
# node 37: type: TNT_SYMBOL sym: i
# child RHS for node 20
# node 38: type: TNT_SYMBOL sym: j
# child RHS for node 19
# node 39: type: TNT_SYMBOL sym: k
# child RHS for node 18
# node 40: type: TNT_SYMBOL sym: l
# child RHS for node 17
# node 41: type: TNT_SYMBOL sym: m
# child RHS for node 16
# node 42: type: TNT_SYMBOL sym: n
# child RHS for node 15
# node 43: type: TNT_SYMBOL sym: o
# child RHS for node 14
# node 44: type: TNT_SYMBOL sym: p
# child RHS for node 13
# node 45: type: TNT_SYMBOL sym: q
# child RHS for node 12
# node 46: type: TNT_SYMBOL sym: r
# child RHS for node 11
# node 47: type: TNT_SYMBOL sym: s
# child RHS for node 10
# node 48: type: TNT_SYMBOL sym: t
# child SEQ_NEXT for node 7
# node 49: type: TNT_STMT
# child SEQ_CUR for node 49
# node 50: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 50
# node 51: type: TNT_ARG
# child SEQ_CUR for node 51
# node 52: type: TNT_STRCON str: "\n"
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 3
# sym: x
#   line: 15
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 16
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x5
# sym: z
#   line: 17
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
# node 7: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 7
# node 8: type: TNT_INTCON val: 0
# child RHS for node 6
# node 9: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 5
# node 10: type: TNT_STMT
# child SEQ_CUR for node 10
# node 11: type: TNT_ASSG
# child LHS for node 11
# node 12: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 12
# node 13: type: TNT_INTCON val: 1
# child RHS for node 11
# node 14: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 10
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_ASSG
# child LHS for node 16
# node 17: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 17
# node 18: type: TNT_INTCON val: 2
# child RHS for node 16
# node 19: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 15
# node 20: type: TNT_STMT
# child SEQ_CUR for node 20
# node 21: type: TNT_ASSG
# child LHS for node 21
# node 22: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 22
# node 23: type: TNT_INTCON val: 3
# child RHS for node 21
# node 24: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 20
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_ASSG
# child LHS for node 26
# node 27: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 27
# node 28: type: TNT_INTCON val: 4
# child RHS for node 26
# node 29: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 25
# node 30: type: TNT_STMT
# child SEQ_CUR for node 30
# node 31: type: TNT_ASSG
# child LHS for node 31
# node 32: type: TNT_SYMBOL sym: z
# child RHS for node 31
# node 33: type: TNT_CHARCON str: 'b'
# child SEQ_NEXT for node 30
# node 34: type: TNT_STMT
# child SEQ_CUR for node 34
# node 35: type: TNT_CALL sym: sum
# child CALL_ARGS for node 35
# node 36: type: TNT_ARG
# child SEQ_CUR for node 36
# node 37: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 36
# node 38: type: TNT_ARG
# child SEQ_CUR for node 38
# node 39: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 38
# node 40: type: TNT_ARG
# child SEQ_CUR for node 40
# node 41: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 40
# node 42: type: TNT_ARG
# child SEQ_CUR for node 42
# node 43: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 42
# node 44: type: TNT_ARG
# child SEQ_CUR for node 44
# node 45: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 44
# node 46: type: TNT_ARG
# child SEQ_CUR for node 46
# node 47: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 46
# node 48: type: TNT_ARG
# child SEQ_CUR for node 48
# node 49: type: TNT_MULT
# child LHS for node 49
# node 50: type: TNT_SYMBOL sym: x
# child RHS for node 49
# node 51: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 48
# node 52: type: TNT_ARG
# child SEQ_CUR for node 52
# node 53: type: TNT_PLUS
# child LHS for node 53
# node 54: type: TNT_PLUS
# child LHS for node 54
# node 55: type: TNT_SYMBOL sym: x
# child RHS for node 54
# node 56: type: TNT_SYMBOL sym: x
# child RHS for node 53
# node 57: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 52
# node 58: type: TNT_ARG
# child SEQ_CUR for node 58
# node 59: type: TNT_DIV
# child LHS for node 59
# node 60: type: TNT_CALL sym: id
# child CALL_ARGS for node 60
# node 61: type: TNT_ARG
# child SEQ_CUR for node 61
# node 62: type: TNT_SYMBOL sym: x
# child RHS for node 59
# node 63: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 58
# node 64: type: TNT_ARG
# child SEQ_CUR for node 64
# node 65: type: TNT_CALL sym: id
# child CALL_ARGS for node 65
# node 66: type: TNT_ARG
# child SEQ_CUR for node 66
# node 67: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 67
# node 68: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 64
# node 69: type: TNT_ARG
# child SEQ_CUR for node 69
# node 70: type: TNT_PLUS
# child LHS for node 70
# node 71: type: TNT_CALL sym: id
# child CALL_ARGS for node 71
# node 72: type: TNT_ARG
# child SEQ_CUR for node 72
# node 73: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 73
# node 74: type: TNT_INTCON val: 3
# child RHS for node 70
# node 75: type: TNT_CALL sym: id
# child CALL_ARGS for node 75
# node 76: type: TNT_ARG
# child SEQ_CUR for node 76
# node 77: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 77
# node 78: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 69
# node 79: type: TNT_ARG
# child SEQ_CUR for node 79
# node 80: type: TNT_DIV
# child LHS for node 80
# node 81: type: TNT_DIV
# child LHS for node 81
# node 82: type: TNT_SYMBOL sym: z
# child RHS for node 81
# node 83: type: TNT_SYMBOL sym: z
# child RHS for node 80
# node 84: type: TNT_SYMBOL sym: z
# child SEQ_NEXT for node 79
# node 85: type: TNT_ARG
# child SEQ_CUR for node 85
# node 86: type: TNT_PLUS
# child LHS for node 86
# node 87: type: TNT_SYMBOL sym: x
# child RHS for node 86
# node 88: type: TNT_SYMBOL sym: z
# child SEQ_NEXT for node 85
# node 89: type: TNT_ARG
# child SEQ_CUR for node 89
# node 90: type: TNT_MULT
# child LHS for node 90
# node 91: type: TNT_SYMBOL sym: x
# child RHS for node 90
# node 92: type: TNT_CALL sym: id
# child CALL_ARGS for node 92
# node 93: type: TNT_ARG
# child SEQ_CUR for node 93
# node 94: type: TNT_SYMBOL sym: z
# child SEQ_NEXT for node 89
# node 95: type: TNT_ARG
# child SEQ_CUR for node 95
# node 96: type: TNT_PLUS
# child LHS for node 96
# node 97: type: TNT_PLUS
# child LHS for node 97
# node 98: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 98
# node 99: type: TNT_INTCON val: 3
# child RHS for node 97
# node 100: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 100
# node 101: type: TNT_INTCON val: 3
# child RHS for node 96
# node 102: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 102
# node 103: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 95
# node 104: type: TNT_ARG
# child SEQ_CUR for node 104
# node 105: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 105
# node 106: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 106
# node 107: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 107
# node 108: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 104
# node 109: type: TNT_ARG
# child SEQ_CUR for node 109
# node 110: type: TNT_MULT
# child LHS for node 110
# node 111: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 111
# node 112: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 112
# node 113: type: TNT_SYMBOL sym: x
# child RHS for node 110
# node 114: type: TNT_CALL sym: id
# child CALL_ARGS for node 114
# node 115: type: TNT_ARG
# child SEQ_CUR for node 115
# node 116: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 116
# node 117: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 109
# node 118: type: TNT_ARG
# child SEQ_CUR for node 118
# node 119: type: TNT_CALL sym: id
# child CALL_ARGS for node 119
# node 120: type: TNT_ARG
# child SEQ_CUR for node 120
# node 121: type: TNT_CALL sym: id
# child CALL_ARGS for node 121
# node 122: type: TNT_ARG
# child SEQ_CUR for node 122
# node 123: type: TNT_CALL sym: id
# child CALL_ARGS for node 123
# node 124: type: TNT_ARG
# child SEQ_CUR for node 124
# node 125: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 125
# node 126: type: TNT_CALL sym: id
# child CALL_ARGS for node 126
# node 127: type: TNT_ARG
# child SEQ_CUR for node 127
# node 128: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 118
# node 129: type: TNT_ARG
# child SEQ_CUR for node 129
# node 130: type: TNT_PLUS
# child LHS for node 130
# node 131: type: TNT_SYMBOL sym: x
# child RHS for node 130
# node 132: type: TNT_SYMBOL sym: z
# child SEQ_NEXT for node 129
# node 133: type: TNT_ARG
# child SEQ_CUR for node 133
# node 134: type: TNT_PLUS
# child LHS for node 134
# node 135: type: TNT_SYMBOL sym: x
# child RHS for node 134
# node 136: type: TNT_PLUS
# child LHS for node 136
# node 137: type: TNT_SYMBOL sym: x
# child RHS for node 136
# node 138: type: TNT_PLUS
# child LHS for node 138
# node 139: type: TNT_SYMBOL sym: x
# child RHS for node 138
# node 140: type: TNT_PLUS
# child LHS for node 140
# node 141: type: TNT_SYMBOL sym: x
# child RHS for node 140
# node 142: type: TNT_PLUS
# child LHS for node 142
# node 143: type: TNT_SYMBOL sym: x
# child RHS for node 142
# node 144: type: TNT_PLUS
# child LHS for node 144
# node 145: type: TNT_SYMBOL sym: x
# child RHS for node 144
# node 146: type: TNT_PLUS
# child LHS for node 146
# node 147: type: TNT_SYMBOL sym: x
# child RHS for node 146
# node 148: type: TNT_PLUS
# child LHS for node 148
# node 149: type: TNT_SYMBOL sym: x
# child RHS for node 148
# node 150: type: TNT_PLUS
# child LHS for node 150
# node 151: type: TNT_SYMBOL sym: x
# child RHS for node 150
# node 152: type: TNT_PLUS
# child LHS for node 152
# node 153: type: TNT_SYMBOL sym: x
# child RHS for node 152
# node 154: type: TNT_PLUS
# child LHS for node 154
# node 155: type: TNT_SYMBOL sym: x
# child RHS for node 154
# node 156: type: TNT_MINUS
# child LHS for node 156
# node 157: type: TNT_SYMBOL sym: x
# child RHS for node 156
# node 158: type: TNT_MULT
# child LHS for node 158
# node 159: type: TNT_SYMBOL sym: x
# child RHS for node 158
# node 160: type: TNT_MULT
# child LHS for node 160
# node 161: type: TNT_SYMBOL sym: x
# child RHS for node 160
# node 162: type: TNT_MINUS
# child LHS for node 162
# node 163: type: TNT_SYMBOL sym: x
# child RHS for node 162
# node 164: type: TNT_CALL sym: id
# child CALL_ARGS for node 164
# node 165: type: TNT_ARG
# child SEQ_CUR for node 165
# node 166: type: TNT_SYMBOL sym: x
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
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: sum
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  1
# stkargs used:  0
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("sum: ")
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
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_ADD
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
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (d)
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
# src1 -> ST_PRIMITIVE (e)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (f)
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
# src1 -> ST_PRIMITIVE (g)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (h)
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
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (j)
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
# src1 -> ST_PRIMITIVE (k)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (l)
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
# src1 -> ST_PRIMITIVE (m)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (n)
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
# src1 -> ST_PRIMITIVE (o)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (p)
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
# src1 -> ST_PRIMITIVE (q)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (r)
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
# src1 -> ST_PRIMITIVE (s)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (t)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
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
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   8
# stktemps used: 26
# regargs used:  4
# stkargs used:  16
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
# src1 -> ST_INTCON (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
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
# src1 -> ST_ARRAY (y)
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
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
# src1 -> ST_ARRAY (y)
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
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
# src1 -> ST_ARRAY (y)
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (3)
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
# src1 -> ST_ARRAY (y)
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
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
# src1 -> ST_ARRAY (y)
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('b')
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (z)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_SVTEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_SVTEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_SVTEMP (2)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_SVTEMP (3)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_LI
# ------
# dest -> ST_SVTEMP (4)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_LW
# ------
# dest -> ST_SVTEMP (5)
# src1 -> ST_PRIMITIVE (x)
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
# CNT_MUL
# -------
# dest -> ST_SVTEMP (6)
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
# CNT_ADD
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
# CNT_ADD
# -------
# dest -> ST_SVTEMP (7)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
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
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_DIV
# -------
# dest -> ST_STKTEMP (0)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
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
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_STKTEMP (1)
# src1 -> ST_RETVAL
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
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
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_STKTEMP (2)
# src1 -> ST_RETVAL
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
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
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ADD
# -------
# dest -> ST_STKTEMP (3)
# src1 -> ST_STKTEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_DIV
# -------
# dest -> ST_STKTEMP (2)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_ADD
# -------
# dest -> ST_STKTEMP (4)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (5)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (z)
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
# src1 -> ST_FUNCTION (id)
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
# dest -> ST_STKTEMP (6)
# src1 -> ST_STKTEMP (5)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (3)
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
# src1 -> ST_ARRAY (y)
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
# src1 -> ST_TEMP (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_STKTEMP (5)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (7)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (8)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
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
# src1 -> ST_FUNCTION (id)
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
# dest -> ST_STKTEMP (9)
# src1 -> ST_STKTEMP (8)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2)
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
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
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
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
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
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
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
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_STKTEMP (8)
# src1 -> ST_RETVAL
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_ADD
# -------
# dest -> ST_STKTEMP (10)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (11)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (12)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (13)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (14)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (15)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (16)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (17)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (18)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (19)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (20)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (21)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (22)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (23)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (24)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_STKTEMP (25)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
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
# src1 -> ST_FUNCTION (id)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_STKTEMP (25)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STKTEMP (24)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_STKTEMP (23)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STKTEMP (22)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_STKTEMP (21)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STKTEMP (20)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_STKTEMP (19)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STKTEMP (18)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_STKTEMP (17)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STKTEMP (16)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_STKTEMP (15)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STKTEMP (14)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_STKTEMP (13)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STKTEMP (12)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_STKTEMP (11)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (15)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (14)
# src1 -> ST_STKTEMP (10)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (13)
# src1 -> ST_STKTEMP (8)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (12)
# src1 -> ST_STKTEMP (9)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (11)
# src1 -> ST_STKTEMP (7)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (10)
# src1 -> ST_STKTEMP (5)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (9)
# src1 -> ST_STKTEMP (6)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (8)
# src1 -> ST_STKTEMP (4)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (7)
# src1 -> ST_STKTEMP (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (6)
# src1 -> ST_STKTEMP (3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (5)
# src1 -> ST_STKTEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (4)
# src1 -> ST_STKTEMP (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (3)
# src1 -> ST_SVTEMP (7)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (2)
# src1 -> ST_SVTEMP (6)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (1)
# src1 -> ST_SVTEMP (5)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (0)
# src1 -> ST_SVTEMP (4)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (3)
# src1 -> ST_SVTEMP (3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (2)
# src1 -> ST_SVTEMP (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_SVTEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_SVTEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (sum)

.data

  _str0:
    .asciiz "sum: "
    .align 2

  _str1:
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

_sum:

  # |--------------------------------|
  # |               t                |
  # |--------------------------------| sp+100
  # |               s                |
  # |--------------------------------| sp+96
  # |               r                |
  # |--------------------------------| sp+92
  # |               q                |
  # |--------------------------------| sp+88
  # |               p                |
  # |--------------------------------| sp+84
  # |               o                |
  # |--------------------------------| sp+80
  # |               n                |
  # |--------------------------------| sp+76
  # |               m                |
  # |--------------------------------| sp+72
  # |               l                |
  # |--------------------------------| sp+68
  # |               k                |
  # |--------------------------------| sp+64
  # |               j                |
  # |--------------------------------| sp+60
  # |               i                |
  # |--------------------------------| sp+56
  # |               h                |
  # |--------------------------------| sp+52
  # |               g                |
  # |--------------------------------| sp+48
  # |               f                |
  # |--------------------------------| sp+44
  # |               e                |
  # |--------------------------------| sp+40
  # |         <d is in $a3>          |
  # |--------------------------------| sp+36
  # |         <c is in $a2>          |
  # |--------------------------------| sp+32
  # |         <b is in $a1>          |
  # |--------------------------------| sp+28
  # |               a                |
  # |--------------------------------| sp+24  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)

  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $t1, $a1
  addu $t2, $t0, $t1
  move $t0, $a2
  addu $t1, $t2, $t0
  move $t0, $a3
  addu $t2, $t1, $t0
  lw $t0, 40($sp)
  addu $t1, $t2, $t0
  lw $t0, 44($sp)
  addu $t2, $t1, $t0
  lw $t0, 48($sp)
  addu $t1, $t2, $t0
  lw $t0, 52($sp)
  addu $t2, $t1, $t0
  lw $t0, 56($sp)
  addu $t1, $t2, $t0
  lw $t0, 60($sp)
  addu $t2, $t1, $t0
  lw $t0, 64($sp)
  addu $t1, $t2, $t0
  lw $t0, 68($sp)
  addu $t2, $t1, $t0
  lw $t0, 72($sp)
  addu $t1, $t2, $t0
  lw $t0, 76($sp)
  addu $t2, $t1, $t0
  lw $t0, 80($sp)
  addu $t1, $t2, $t0
  lw $t0, 84($sp)
  addu $t2, $t1, $t0
  lw $t0, 88($sp)
  addu $t1, $t2, $t0
  lw $t0, 92($sp)
  addu $t2, $t1, $t0
  lw $t0, 96($sp)
  addu $t1, $t2, $t0
  lw $t0, 100($sp)
  addu $t2, $t1, $t0
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

__leave_sum:
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

main:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+252
  # |               z                |
  # |--------------------------------| sp+248
  # |               y                |
  # |--------------------------------| sp+228
  # |               x                |
  # |--------------------------------| sp+224
  # |           <padding>            |
  # |--------------------------------| sp+220
  # |              $ra               |
  # |--------------------------------| sp+216
  # |          <stktemp 25>          |
  # |--------------------------------| sp+212
  # |          <stktemp 24>          |
  # |--------------------------------| sp+208
  # |          <stktemp 23>          |
  # |--------------------------------| sp+204
  # |          <stktemp 22>          |
  # |--------------------------------| sp+200
  # |          <stktemp 21>          |
  # |--------------------------------| sp+196
  # |          <stktemp 20>          |
  # |--------------------------------| sp+192
  # |          <stktemp 19>          |
  # |--------------------------------| sp+188
  # |          <stktemp 18>          |
  # |--------------------------------| sp+184
  # |          <stktemp 17>          |
  # |--------------------------------| sp+180
  # |          <stktemp 16>          |
  # |--------------------------------| sp+176
  # |          <stktemp 15>          |
  # |--------------------------------| sp+172
  # |          <stktemp 14>          |
  # |--------------------------------| sp+168
  # |          <stktemp 13>          |
  # |--------------------------------| sp+164
  # |          <stktemp 12>          |
  # |--------------------------------| sp+160
  # |          <stktemp 11>          |
  # |--------------------------------| sp+156
  # |          <stktemp 10>          |
  # |--------------------------------| sp+152
  # |          <stktemp 9>           |
  # |--------------------------------| sp+148
  # |          <stktemp 8>           |
  # |--------------------------------| sp+144
  # |          <stktemp 7>           |
  # |--------------------------------| sp+140
  # |          <stktemp 6>           |
  # |--------------------------------| sp+136
  # |          <stktemp 5>           |
  # |--------------------------------| sp+132
  # |          <stktemp 4>           |
  # |--------------------------------| sp+128
  # |          <stktemp 3>           |
  # |--------------------------------| sp+124
  # |          <stktemp 2>           |
  # |--------------------------------| sp+120
  # |          <stktemp 1>           |
  # |--------------------------------| sp+116
  # |          <stktemp 0>           |
  # |--------------------------------| sp+112
  # |              $s7               |
  # |--------------------------------| sp+108
  # |              $s6               |
  # |--------------------------------| sp+104
  # |              $s5               |
  # |--------------------------------| sp+100
  # |              $s4               |
  # |--------------------------------| sp+96
  # |              $s3               |
  # |--------------------------------| sp+92
  # |              $s2               |
  # |--------------------------------| sp+88
  # |              $s1               |
  # |--------------------------------| sp+84
  # |              $s0               |
  # |--------------------------------| sp+80
  # |          <stkarg 15>           |
  # |--------------------------------| sp+76
  # |          <stkarg 14>           |
  # |--------------------------------| sp+72
  # |          <stkarg 13>           |
  # |--------------------------------| sp+68
  # |          <stkarg 12>           |
  # |--------------------------------| sp+64
  # |          <stkarg 11>           |
  # |--------------------------------| sp+60
  # |          <stkarg 10>           |
  # |--------------------------------| sp+56
  # |           <stkarg 9>           |
  # |--------------------------------| sp+52
  # |           <stkarg 8>           |
  # |--------------------------------| sp+48
  # |           <stkarg 7>           |
  # |--------------------------------| sp+44
  # |           <stkarg 6>           |
  # |--------------------------------| sp+40
  # |           <stkarg 5>           |
  # |--------------------------------| sp+36
  # |           <stkarg 4>           |
  # |--------------------------------| sp+32
  # |           <stkarg 3>           |
  # |--------------------------------| sp+28
  # |           <stkarg 2>           |
  # |--------------------------------| sp+24
  # |           <stkarg 1>           |
  # |--------------------------------| sp+20
  # |           <stkarg 0>           |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -256($sp)
  sw $ra, 216($sp)
  sw $a0, 256($sp)
  sw $a1, 260($sp)
  sw $a2, 264($sp)
  sw $a3, 268($sp)
  sw $s0, 80($sp)
  sw $s1, 84($sp)
  sw $s2, 88($sp)
  sw $s3, 92($sp)
  sw $s4, 96($sp)
  sw $s5, 100($sp)
  sw $s6, 104($sp)
  sw $s7, 108($sp)

  li $t0, 1
  sw $t0, 224($sp)
  li $t0, 0
  li $t1, 0
  sll $t2, $t1, 2
  la $t1, 228($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1
  li $t1, 1
  sll $t2, $t1, 2
  la $t1, 228($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 2
  li $t1, 2
  sll $t2, $t1, 2
  la $t1, 228($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 3
  li $t1, 3
  sll $t2, $t1, 2
  la $t1, 228($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 4
  li $t1, 4
  sll $t2, $t1, 2
  la $t1, 228($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 'b'
  sb $t0, 248($sp)
  li $s0, 1
  li $s1, 2
  li $s2, 3
  li $s3, 4
  li $s4, 5
  lw $s5, 224($sp)
  lw $t0, 224($sp)
  lw $t1, 224($sp)
  mul $s6, $t0, $t1
  lw $t0, 224($sp)
  lw $t1, 224($sp)
  addu $t2, $t0, $t1
  lw $t0, 224($sp)
  addu $s7, $t2, $t0
  lw $t0, 224($sp)
  move $a0, $t0
  jal _id
  move $t0, $v0
  lw $t1, 224($sp)
  div $t9, $t0, $t1
  sw $t9, 112($sp)
  li $t0, 3
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  sw $v0, 116($sp)
  li $t0, 3
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  sw $v0, 120($sp)
  li $t0, 3
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  move $t0, $v0
  lw $t7, 120($sp)
  addu $t9, $t7, $t0
  sw $t9, 124($sp)
  lb $t0, 248($sp)
  lb $t1, 248($sp)
  div $t2, $t0, $t1
  lb $t0, 248($sp)
  div $t9, $t2, $t0
  sw $t9, 120($sp)
  lw $t0, 224($sp)
  lb $t1, 248($sp)
  addu $t9, $t0, $t1
  sw $t9, 128($sp)
  lw $t9, 224($sp)
  sw $t9, 132($sp)
  lb $t0, 248($sp)
  move $a0, $t0
  jal _id
  move $t0, $v0
  lw $t7, 132($sp)
  mul $t9, $t7, $t0
  sw $t9, 136($sp)
  li $t0, 3
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 3
  sll $t2, $t1, 2
  la $t1, 228($sp)
  addu $t3, $t1, $t2
  lw $t1, ($t3)
  addu $t2, $t0, $t1
  li $t0, 3
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t3, $t0, $t1
  lw $t0, ($t3)
  addu $t9, $t2, $t0
  sw $t9, 132($sp)
  lw $t0, 224($sp)
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t9, ($t2)
  sw $t9, 140($sp)
  lw $t0, 224($sp)
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t9, ($t2)
  sw $t9, 144($sp)
  li $t0, 4
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  move $t0, $v0
  lw $t7, 144($sp)
  mul $t9, $t7, $t0
  sw $t9, 148($sp)
  li $t0, 2
  move $a0, $t0
  jal _id
  move $t0, $v0
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  sw $v0, 144($sp)
  lw $t0, 224($sp)
  lb $t1, 248($sp)
  addu $t9, $t0, $t1
  sw $t9, 152($sp)
  lw $t9, 224($sp)
  sw $t9, 156($sp)
  lw $t9, 224($sp)
  sw $t9, 160($sp)
  lw $t9, 224($sp)
  sw $t9, 164($sp)
  lw $t9, 224($sp)
  sw $t9, 168($sp)
  lw $t9, 224($sp)
  sw $t9, 172($sp)
  lw $t9, 224($sp)
  sw $t9, 176($sp)
  lw $t9, 224($sp)
  sw $t9, 180($sp)
  lw $t9, 224($sp)
  sw $t9, 184($sp)
  lw $t9, 224($sp)
  sw $t9, 188($sp)
  lw $t9, 224($sp)
  sw $t9, 192($sp)
  lw $t9, 224($sp)
  sw $t9, 196($sp)
  lw $t9, 224($sp)
  sw $t9, 200($sp)
  lw $t9, 224($sp)
  sw $t9, 204($sp)
  lw $t9, 224($sp)
  sw $t9, 208($sp)
  lw $t9, 224($sp)
  sw $t9, 212($sp)
  lw $t0, 224($sp)
  move $a0, $t0
  jal _id
  move $t0, $v0
  lw $t7, 212($sp)
  sub $t1, $t7, $t0
  lw $t7, 208($sp)
  mul $t0, $t7, $t1
  lw $t7, 204($sp)
  mul $t1, $t7, $t0
  lw $t7, 200($sp)
  sub $t0, $t7, $t1
  lw $t7, 196($sp)
  addu $t1, $t7, $t0
  lw $t7, 192($sp)
  addu $t0, $t7, $t1
  lw $t7, 188($sp)
  addu $t1, $t7, $t0
  lw $t7, 184($sp)
  addu $t0, $t7, $t1
  lw $t7, 180($sp)
  addu $t1, $t7, $t0
  lw $t7, 176($sp)
  addu $t0, $t7, $t1
  lw $t7, 172($sp)
  addu $t1, $t7, $t0
  lw $t7, 168($sp)
  addu $t0, $t7, $t1
  lw $t7, 164($sp)
  addu $t1, $t7, $t0
  lw $t7, 160($sp)
  addu $t0, $t7, $t1
  lw $t7, 156($sp)
  addu $t1, $t7, $t0
  sw $t1, 76($sp)
  lw $t7, 152($sp)
  sw $t7, 72($sp)
  lw $t7, 144($sp)
  sw $t7, 68($sp)
  lw $t7, 148($sp)
  sw $t7, 64($sp)
  lw $t7, 140($sp)
  sw $t7, 60($sp)
  lw $t7, 132($sp)
  sw $t7, 56($sp)
  lw $t7, 136($sp)
  sw $t7, 52($sp)
  lw $t7, 128($sp)
  sw $t7, 48($sp)
  lw $t7, 120($sp)
  sw $t7, 44($sp)
  lw $t7, 124($sp)
  sw $t7, 40($sp)
  lw $t7, 116($sp)
  sw $t7, 36($sp)
  lw $t7, 112($sp)
  sw $t7, 32($sp)
  sw $s7, 28($sp)
  sw $s6, 24($sp)
  sw $s5, 20($sp)
  sw $s4, 16($sp)
  move $a3, $s3
  move $a2, $s2
  move $a1, $s1
  move $a0, $s0
  jal _sum

__leavemain:
  lw $s7, 108($sp)
  lw $s6, 104($sp)
  lw $s5, 100($sp)
  lw $s4, 96($sp)
  lw $s3, 92($sp)
  lw $s2, 88($sp)
  lw $s1, 84($sp)
  lw $s0, 80($sp)
  lw $a3, 268($sp)
  lw $a2, 264($sp)
  lw $a1, 260($sp)
  lw $a0, 256($sp)
  lw $ra, 216($sp)
  la $sp, 256($sp)
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
