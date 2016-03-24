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
# size: 3
# sym: x
#   line: 7
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xa
# sym: y
#   line: 7
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xa
# sym: u
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 3
# node 4: type: TNT_INTCON val: 4
# child RHS for node 2
# node 5: type: TNT_INTCON val: 1111
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 8
# node 9: type: TNT_INTCON val: 5
# child RHS for node 7
# node 10: type: TNT_INTCON val: 2222
# child SEQ_NEXT for node 6
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_ASSG
# child LHS for node 12
# node 13: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 13
# node 14: type: TNT_INTCON val: 6
# child RHS for node 12
# node 15: type: TNT_INTCON val: 3333
# child SEQ_NEXT for node 11
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_ASSG
# child LHS for node 17
# node 18: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 18
# node 19: type: TNT_INTCON val: 7
# child RHS for node 17
# node 20: type: TNT_INTCON val: 4444
# child SEQ_NEXT for node 16
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_ASSG
# child LHS for node 22
# node 23: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 23
# node 24: type: TNT_INTCON val: 8
# child RHS for node 22
# node 25: type: TNT_INTCON val: 5555
# child SEQ_NEXT for node 21
# node 26: type: TNT_STMT
# child SEQ_CUR for node 26
# node 27: type: TNT_ASSG
# child LHS for node 27
# node 28: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 28
# node 29: type: TNT_INTCON val: 9
# child RHS for node 27
# node 30: type: TNT_INTCON val: 6666
# child SEQ_NEXT for node 26
# node 31: type: TNT_STMT
# child SEQ_CUR for node 31
# node 32: type: TNT_ASSG
# child LHS for node 32
# node 33: type: TNT_SYMBOL sym: u
# child RHS for node 32
# node 34: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 34
# node 35: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 31
# node 36: type: TNT_STMT
# child SEQ_CUR for node 36
# node 37: type: TNT_PRINTF
# child PRINTF_TREE for node 37
# node 38: type: TNT_STMT
# child SEQ_CUR for node 38
# node 39: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 39
# node 40: type: TNT_ARG
# child SEQ_CUR for node 40
# node 41: type: TNT_SYMBOL sym: u
# child SEQ_NEXT for node 38
# node 42: type: TNT_STMT
# child SEQ_CUR for node 42
# node 43: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 43
# node 44: type: TNT_ARG
# child SEQ_CUR for node 44
# node 45: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 36
# node 46: type: TNT_STMT
# child SEQ_CUR for node 46
# node 47: type: TNT_ASSG
# child LHS for node 47
# node 48: type: TNT_SYMBOL sym: u
# child RHS for node 47
# node 49: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 49
# node 50: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 46
# node 51: type: TNT_STMT
# child SEQ_CUR for node 51
# node 52: type: TNT_PRINTF
# child PRINTF_TREE for node 52
# node 53: type: TNT_STMT
# child SEQ_CUR for node 53
# node 54: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 54
# node 55: type: TNT_ARG
# child SEQ_CUR for node 55
# node 56: type: TNT_SYMBOL sym: u
# child SEQ_NEXT for node 53
# node 57: type: TNT_STMT
# child SEQ_CUR for node 57
# node 58: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 58
# node 59: type: TNT_ARG
# child SEQ_CUR for node 59
# node 60: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 51
# node 61: type: TNT_STMT
# child SEQ_CUR for node 61
# node 62: type: TNT_ASSG
# child LHS for node 62
# node 63: type: TNT_SYMBOL sym: u
# child RHS for node 62
# node 64: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 64
# node 65: type: TNT_INTCON val: 6
# child SEQ_NEXT for node 61
# node 66: type: TNT_STMT
# child SEQ_CUR for node 66
# node 67: type: TNT_PRINTF
# child PRINTF_TREE for node 67
# node 68: type: TNT_STMT
# child SEQ_CUR for node 68
# node 69: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 69
# node 70: type: TNT_ARG
# child SEQ_CUR for node 70
# node 71: type: TNT_SYMBOL sym: u
# child SEQ_NEXT for node 68
# node 72: type: TNT_STMT
# child SEQ_CUR for node 72
# node 73: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 73
# node 74: type: TNT_ARG
# child SEQ_CUR for node 74
# node 75: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 66
# node 76: type: TNT_STMT
# child SEQ_CUR for node 76
# node 77: type: TNT_ASSG
# child LHS for node 77
# node 78: type: TNT_SYMBOL sym: u
# child RHS for node 77
# node 79: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 79
# node 80: type: TNT_INTCON val: 7
# child SEQ_NEXT for node 76
# node 81: type: TNT_STMT
# child SEQ_CUR for node 81
# node 82: type: TNT_PRINTF
# child PRINTF_TREE for node 82
# node 83: type: TNT_STMT
# child SEQ_CUR for node 83
# node 84: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 84
# node 85: type: TNT_ARG
# child SEQ_CUR for node 85
# node 86: type: TNT_SYMBOL sym: u
# child SEQ_NEXT for node 83
# node 87: type: TNT_STMT
# child SEQ_CUR for node 87
# node 88: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 88
# node 89: type: TNT_ARG
# child SEQ_CUR for node 89
# node 90: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 81
# node 91: type: TNT_STMT
# child SEQ_CUR for node 91
# node 92: type: TNT_ASSG
# child LHS for node 92
# node 93: type: TNT_SYMBOL sym: u
# child RHS for node 92
# node 94: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 94
# node 95: type: TNT_INTCON val: 8
# child SEQ_NEXT for node 91
# node 96: type: TNT_STMT
# child SEQ_CUR for node 96
# node 97: type: TNT_PRINTF
# child PRINTF_TREE for node 97
# node 98: type: TNT_STMT
# child SEQ_CUR for node 98
# node 99: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 99
# node 100: type: TNT_ARG
# child SEQ_CUR for node 100
# node 101: type: TNT_SYMBOL sym: u
# child SEQ_NEXT for node 98
# node 102: type: TNT_STMT
# child SEQ_CUR for node 102
# node 103: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 103
# node 104: type: TNT_ARG
# child SEQ_CUR for node 104
# node 105: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 96
# node 106: type: TNT_STMT
# child SEQ_CUR for node 106
# node 107: type: TNT_ASSG
# child LHS for node 107
# node 108: type: TNT_SYMBOL sym: u
# child RHS for node 107
# node 109: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 109
# node 110: type: TNT_INTCON val: 9
# child SEQ_NEXT for node 106
# node 111: type: TNT_STMT
# child SEQ_CUR for node 111
# node 112: type: TNT_PRINTF
# child PRINTF_TREE for node 112
# node 113: type: TNT_STMT
# child SEQ_CUR for node 113
# node 114: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 114
# node 115: type: TNT_ARG
# child SEQ_CUR for node 115
# node 116: type: TNT_SYMBOL sym: u
# child SEQ_NEXT for node 113
# node 117: type: TNT_STMT
# child SEQ_CUR for node 117
# node 118: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 118
# node 119: type: TNT_ARG
# child SEQ_CUR for node 119
# node 120: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 111
# node 121: type: TNT_STMT
# child SEQ_CUR for node 121
# node 122: type: TNT_PRINTF
# child PRINTF_TREE for node 122
# node 123: type: TNT_STMT
# child SEQ_CUR for node 123
# node 124: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 124
# node 125: type: TNT_ARG
# child SEQ_CUR for node 125
# node 126: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 123
# node 127: type: TNT_STMT
# child SEQ_CUR for node 127
# node 128: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 128
# node 129: type: TNT_ARG
# child SEQ_CUR for node 129
# node 130: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 130
# node 131: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 127
# node 132: type: TNT_STMT
# child SEQ_CUR for node 132
# node 133: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 133
# node 134: type: TNT_ARG
# child SEQ_CUR for node 134
# node 135: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 132
# node 136: type: TNT_STMT
# child SEQ_CUR for node 136
# node 137: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 137
# node 138: type: TNT_ARG
# child SEQ_CUR for node 138
# node 139: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 139
# node 140: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 136
# node 141: type: TNT_STMT
# child SEQ_CUR for node 141
# node 142: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 142
# node 143: type: TNT_ARG
# child SEQ_CUR for node 143
# node 144: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 141
# node 145: type: TNT_STMT
# child SEQ_CUR for node 145
# node 146: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 146
# node 147: type: TNT_ARG
# child SEQ_CUR for node 147
# node 148: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 148
# node 149: type: TNT_INTCON val: 6
# child SEQ_NEXT for node 145
# node 150: type: TNT_STMT
# child SEQ_CUR for node 150
# node 151: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 151
# node 152: type: TNT_ARG
# child SEQ_CUR for node 152
# node 153: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 150
# node 154: type: TNT_STMT
# child SEQ_CUR for node 154
# node 155: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 155
# node 156: type: TNT_ARG
# child SEQ_CUR for node 156
# node 157: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 157
# node 158: type: TNT_INTCON val: 7
# child SEQ_NEXT for node 154
# node 159: type: TNT_STMT
# child SEQ_CUR for node 159
# node 160: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 160
# node 161: type: TNT_ARG
# child SEQ_CUR for node 161
# node 162: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 159
# node 163: type: TNT_STMT
# child SEQ_CUR for node 163
# node 164: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 164
# node 165: type: TNT_ARG
# child SEQ_CUR for node 165
# node 166: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 166
# node 167: type: TNT_INTCON val: 8
# child SEQ_NEXT for node 163
# node 168: type: TNT_STMT
# child SEQ_CUR for node 168
# node 169: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 169
# node 170: type: TNT_ARG
# child SEQ_CUR for node 170
# node 171: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 168
# node 172: type: TNT_STMT
# child SEQ_CUR for node 172
# node 173: type: TNT_CALL sym: __print_int
# child CALL_ARGS for node 173
# node 174: type: TNT_ARG
# child SEQ_CUR for node 174
# node 175: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 175
# node 176: type: TNT_INTCON val: 9
# child SEQ_NEXT for node 172
# node 177: type: TNT_STMT
# child SEQ_CUR for node 177
# node 178: type: TNT_CALL sym: __print_string
# child CALL_ARGS for node 178
# node 179: type: TNT_ARG
# child SEQ_CUR for node 179
# node 180: type: TNT_STRCON str: "\n"
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
# src1 -> ST_INTCON (1111)
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (2222)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (5)
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3333)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (6)
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (4444)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (7)
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
# src1 -> ST_INTCON (5555)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (8)
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
# src1 -> ST_INTCON (6666)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (9)
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
# src1 -> ST_ARRAY (x)
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
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (u)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (u)
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
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (5)
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
# src1 -> ST_ARRAY (x)
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
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (u)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (u)
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
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (6)
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
# src1 -> ST_ARRAY (x)
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
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (u)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (u)
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
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (7)
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
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (u)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (u)
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
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (8)
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
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (u)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (u)
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
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (9)
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
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (u)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (u)
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
# src1 -> ST_ARRAY (x)
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
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (", ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (5)
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
# src1 -> ST_ARRAY (x)
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
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (", ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (6)
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
# src1 -> ST_ARRAY (x)
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
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (", ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (7)
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
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (", ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (8)
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
# src1 -> ST_FUNCTION (__print_int)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON (", ")
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (9)
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
    .asciiz "\n"
    .align 2

  _str1:
    .asciiz ", "
    .align 2

.text

main:

  # |--------------------------------|
  # |              $a0               |
  # |--------------------------------| sp+112  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+108
  # |               u                |
  # |--------------------------------| sp+104
  # |               y                |
  # |--------------------------------| sp+64
  # |               x                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -112($sp)
  sw $ra, 16($sp)
  sw $a0, 112($sp)

  li $t0, 1111
  li $t1, 4
  sll $t2, $t1, 2
  la $t1, 24($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 2222
  li $t1, 5
  sll $t2, $t1, 2
  la $t1, 24($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 3333
  li $t1, 6
  sll $t2, $t1, 2
  la $t1, 24($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 4444
  li $t1, 7
  sll $t2, $t1, 2
  la $t1, 64($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 5555
  li $t1, 8
  sll $t2, $t1, 2
  la $t1, 64($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 6666
  li $t1, 9
  sll $t2, $t1, 2
  la $t1, 64($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 4
  sll $t1, $t0, 2
  la $t0, 24($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 104($sp)
  lw $t0, 104($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 5
  sll $t1, $t0, 2
  la $t0, 24($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 104($sp)
  lw $t0, 104($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 6
  sll $t1, $t0, 2
  la $t0, 24($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 104($sp)
  lw $t0, 104($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 7
  sll $t1, $t0, 2
  la $t0, 64($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 104($sp)
  lw $t0, 104($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 8
  sll $t1, $t0, 2
  la $t0, 64($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 104($sp)
  lw $t0, 104($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 9
  sll $t1, $t0, 2
  la $t0, 64($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 104($sp)
  lw $t0, 104($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 4
  sll $t1, $t0, 2
  la $t0, 24($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 5
  sll $t1, $t0, 2
  la $t0, 24($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 6
  sll $t1, $t0, 2
  la $t0, 24($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 7
  sll $t1, $t0, 2
  la $t0, 64($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 8
  sll $t1, $t0, 2
  la $t0, 64($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 9
  sll $t1, $t0, 2
  la $t0, 64($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a0, 112($sp)
  lw $ra, 16($sp)
  la $sp, 112($sp)
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
