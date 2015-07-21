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
# size: 4
# sym: i
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: j
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: a1
#   line: 6
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x5
# sym: a2
#   line: 6
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x11
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: a1
# child AL_OFFSET for node 3
# node 4: type: TNT_INTCON val: 0
# child RHS for node 2
# node 5: type: TNT_CHARCON str: 'h'
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_ARRAY_LOOKUP sym: a1
# child AL_OFFSET for node 8
# node 9: type: TNT_INTCON val: 1
# child RHS for node 7
# node 10: type: TNT_CHARCON str: 'e'
# child SEQ_NEXT for node 6
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_ASSG
# child LHS for node 12
# node 13: type: TNT_ARRAY_LOOKUP sym: a1
# child AL_OFFSET for node 13
# node 14: type: TNT_INTCON val: 2
# child RHS for node 12
# node 15: type: TNT_CHARCON str: 'l'
# child SEQ_NEXT for node 11
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_ASSG
# child LHS for node 17
# node 18: type: TNT_ARRAY_LOOKUP sym: a1
# child AL_OFFSET for node 18
# node 19: type: TNT_INTCON val: 3
# child RHS for node 17
# node 20: type: TNT_CHARCON str: 'l'
# child SEQ_NEXT for node 16
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_ASSG
# child LHS for node 22
# node 23: type: TNT_ARRAY_LOOKUP sym: a1
# child AL_OFFSET for node 23
# node 24: type: TNT_INTCON val: 4
# child RHS for node 22
# node 25: type: TNT_CHARCON str: 'o'
# child SEQ_NEXT for node 21
# node 26: type: TNT_STMT
# child SEQ_CUR for node 26
# node 27: type: TNT_ASSG
# child LHS for node 27
# node 28: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 28
# node 29: type: TNT_INTCON val: 0
# child RHS for node 27
# node 30: type: TNT_CHARCON str: 'w'
# child SEQ_NEXT for node 26
# node 31: type: TNT_STMT
# child SEQ_CUR for node 31
# node 32: type: TNT_ASSG
# child LHS for node 32
# node 33: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 33
# node 34: type: TNT_INTCON val: 1
# child RHS for node 32
# node 35: type: TNT_CHARCON str: 'X'
# child SEQ_NEXT for node 31
# node 36: type: TNT_STMT
# child SEQ_CUR for node 36
# node 37: type: TNT_ASSG
# child LHS for node 37
# node 38: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 38
# node 39: type: TNT_INTCON val: 2
# child RHS for node 37
# node 40: type: TNT_CHARCON str: 'X'
# child SEQ_NEXT for node 36
# node 41: type: TNT_STMT
# child SEQ_CUR for node 41
# node 42: type: TNT_ASSG
# child LHS for node 42
# node 43: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 43
# node 44: type: TNT_INTCON val: 3
# child RHS for node 42
# node 45: type: TNT_CHARCON str: 'X'
# child SEQ_NEXT for node 41
# node 46: type: TNT_STMT
# child SEQ_CUR for node 46
# node 47: type: TNT_ASSG
# child LHS for node 47
# node 48: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 48
# node 49: type: TNT_INTCON val: 4
# child RHS for node 47
# node 50: type: TNT_CHARCON str: 'o'
# child SEQ_NEXT for node 46
# node 51: type: TNT_STMT
# child SEQ_CUR for node 51
# node 52: type: TNT_ASSG
# child LHS for node 52
# node 53: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 53
# node 54: type: TNT_INTCON val: 5
# child RHS for node 52
# node 55: type: TNT_CHARCON str: 'X'
# child SEQ_NEXT for node 51
# node 56: type: TNT_STMT
# child SEQ_CUR for node 56
# node 57: type: TNT_ASSG
# child LHS for node 57
# node 58: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 58
# node 59: type: TNT_INTCON val: 6
# child RHS for node 57
# node 60: type: TNT_CHARCON str: 'X'
# child SEQ_NEXT for node 56
# node 61: type: TNT_STMT
# child SEQ_CUR for node 61
# node 62: type: TNT_ASSG
# child LHS for node 62
# node 63: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 63
# node 64: type: TNT_INTCON val: 7
# child RHS for node 62
# node 65: type: TNT_CHARCON str: 'X'
# child SEQ_NEXT for node 61
# node 66: type: TNT_STMT
# child SEQ_CUR for node 66
# node 67: type: TNT_ASSG
# child LHS for node 67
# node 68: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 68
# node 69: type: TNT_INTCON val: 8
# child RHS for node 67
# node 70: type: TNT_CHARCON str: 'r'
# child SEQ_NEXT for node 66
# node 71: type: TNT_STMT
# child SEQ_CUR for node 71
# node 72: type: TNT_ASSG
# child LHS for node 72
# node 73: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 73
# node 74: type: TNT_INTCON val: 9
# child RHS for node 72
# node 75: type: TNT_CHARCON str: 'X'
# child SEQ_NEXT for node 71
# node 76: type: TNT_STMT
# child SEQ_CUR for node 76
# node 77: type: TNT_ASSG
# child LHS for node 77
# node 78: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 78
# node 79: type: TNT_INTCON val: 10
# child RHS for node 77
# node 80: type: TNT_CHARCON str: 'X'
# child SEQ_NEXT for node 76
# node 81: type: TNT_STMT
# child SEQ_CUR for node 81
# node 82: type: TNT_ASSG
# child LHS for node 82
# node 83: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 83
# node 84: type: TNT_INTCON val: 11
# child RHS for node 82
# node 85: type: TNT_CHARCON str: 'X'
# child SEQ_NEXT for node 81
# node 86: type: TNT_STMT
# child SEQ_CUR for node 86
# node 87: type: TNT_ASSG
# child LHS for node 87
# node 88: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 88
# node 89: type: TNT_INTCON val: 12
# child RHS for node 87
# node 90: type: TNT_CHARCON str: 'l'
# child SEQ_NEXT for node 86
# node 91: type: TNT_STMT
# child SEQ_CUR for node 91
# node 92: type: TNT_ASSG
# child LHS for node 92
# node 93: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 93
# node 94: type: TNT_INTCON val: 13
# child RHS for node 92
# node 95: type: TNT_CHARCON str: 'X'
# child SEQ_NEXT for node 91
# node 96: type: TNT_STMT
# child SEQ_CUR for node 96
# node 97: type: TNT_ASSG
# child LHS for node 97
# node 98: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 98
# node 99: type: TNT_INTCON val: 14
# child RHS for node 97
# node 100: type: TNT_CHARCON str: 'X'
# child SEQ_NEXT for node 96
# node 101: type: TNT_STMT
# child SEQ_CUR for node 101
# node 102: type: TNT_ASSG
# child LHS for node 102
# node 103: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 103
# node 104: type: TNT_INTCON val: 15
# child RHS for node 102
# node 105: type: TNT_CHARCON str: 'X'
# child SEQ_NEXT for node 101
# node 106: type: TNT_STMT
# child SEQ_CUR for node 106
# node 107: type: TNT_ASSG
# child LHS for node 107
# node 108: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 108
# node 109: type: TNT_INTCON val: 16
# child RHS for node 107
# node 110: type: TNT_CHARCON str: 'd'
# child SEQ_NEXT for node 106
# node 111: type: TNT_STMT
# child SEQ_CUR for node 111
# node 112: type: TNT_FOR
# child FOR_INIT for node 112
# node 113: type: TNT_STMT
# child SEQ_CUR for node 113
# node 114: type: TNT_ASSG
# child LHS for node 114
# node 115: type: TNT_SYMBOL sym: i
# child RHS for node 114
# node 116: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 113
# node 117: type: TNT_STMT
# child SEQ_CUR for node 117
# node 118: type: TNT_ASSG
# child LHS for node 118
# node 119: type: TNT_SYMBOL sym: j
# child RHS for node 118
# node 120: type: TNT_INTCON val: 0
# child FOR_COND for node 112
# node 121: type: TNT_AND
# child LHS for node 121
# node 122: type: TNT_LT
# child LHS for node 122
# node 123: type: TNT_SYMBOL sym: i
# child RHS for node 122
# node 124: type: TNT_INTCON val: 5
# child RHS for node 121
# node 125: type: TNT_LT
# child LHS for node 125
# node 126: type: TNT_SYMBOL sym: j
# child RHS for node 125
# node 127: type: TNT_INTCON val: 17
# child FOR_INC for node 112
# node 128: type: TNT_STMT
# child SEQ_CUR for node 128
# node 129: type: TNT_ASSG
# child LHS for node 129
# node 130: type: TNT_SYMBOL sym: i
# child RHS for node 129
# node 131: type: TNT_PLUS
# child LHS for node 131
# node 132: type: TNT_SYMBOL sym: i
# child RHS for node 131
# node 133: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 128
# node 134: type: TNT_STMT
# child SEQ_CUR for node 134
# node 135: type: TNT_ASSG
# child LHS for node 135
# node 136: type: TNT_SYMBOL sym: j
# child RHS for node 135
# node 137: type: TNT_PLUS
# child LHS for node 137
# node 138: type: TNT_SYMBOL sym: j
# child RHS for node 137
# node 139: type: TNT_INTCON val: 4
# child FOR_BODY for node 112
# node 140: type: TNT_PRINTF
# child PRINTF_TREE for node 140
# node 141: type: TNT_STMT
# child SEQ_CUR for node 141
# node 142: type: TNT_CALL sym: _print_char
# child CALL_ARGS for node 142
# node 143: type: TNT_ARG
# child SEQ_CUR for node 143
# node 144: type: TNT_ARRAY_LOOKUP sym: a1
# child AL_OFFSET for node 144
# node 145: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 141
# node 146: type: TNT_STMT
# child SEQ_CUR for node 146
# node 147: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 147
# node 148: type: TNT_ARG
# child SEQ_CUR for node 148
# node 149: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 146
# node 150: type: TNT_STMT
# child SEQ_CUR for node 150
# node 151: type: TNT_CALL sym: _print_char
# child CALL_ARGS for node 151
# node 152: type: TNT_ARG
# child SEQ_CUR for node 152
# node 153: type: TNT_ARRAY_LOOKUP sym: a2
# child AL_OFFSET for node 153
# node 154: type: TNT_SYMBOL sym: j
# child SEQ_NEXT for node 150
# node 155: type: TNT_STMT
# child SEQ_CUR for node 155
# node 156: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 156
# node 157: type: TNT_ARG
# child SEQ_CUR for node 157
# node 158: type: TNT_STRCON str: "\n"
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
# src1 -> ST_CHARCON ('h')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('e')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('l')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('l')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('o')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('w')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('X')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('X')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('X')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('o')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('X')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('X')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (6)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('X')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (7)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('r')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('X')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (9)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('X')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (10)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('X')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (11)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('l')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (12)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('X')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (13)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('X')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (14)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('X')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (15)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('d')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (16)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (j)
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
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (j)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (17)
# |
# >
# CNT_SLT
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
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (1)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (a1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LB
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
# src1 -> ST_FUNCTION (_print_char)
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
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (j)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (a2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LB
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
# src1 -> ST_FUNCTION (_print_char)
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
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (j)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
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
# dest -> ST_PRIMITIVE (j)
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
  # |--------------------------------| sp+60
  # |               a2               |
  # |--------------------------------| sp+40
  # |               a1               |
  # |--------------------------------| sp+32
  # |               j                |
  # |--------------------------------| sp+28
  # |               i                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -64($sp)
  sw $ra, 16($sp)
  sw $a0, 64($sp)

  li $t0, 'h'
  li $t1, 0
  la $t2, 32($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'e'
  li $t1, 1
  la $t2, 32($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'l'
  li $t1, 2
  la $t2, 32($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'l'
  li $t1, 3
  la $t2, 32($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'o'
  li $t1, 4
  la $t2, 32($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'w'
  li $t1, 0
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 1
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 2
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 3
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'o'
  li $t1, 4
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 5
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 6
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 7
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'r'
  li $t1, 8
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 9
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 10
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 11
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'l'
  li $t1, 12
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 13
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 14
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 15
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'd'
  li $t1, 16
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 0
  sw $t0, 24($sp)
  li $t0, 0
  sw $t0, 28($sp)
_L0:
  lw $t0, 24($sp)
  li $t1, 5
  slt $t2, $t0, $t1
  lw $t0, 28($sp)
  li $t1, 17
  slt $t3, $t0, $t1
  and $t0, $t2, $t3
  beq $t0, $zero, _L1
  lw $t0, 24($sp)
  la $t1, 32($sp)
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  move $a0, $t0
  jal __print_char
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  la $t1, 40($sp)
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  move $a0, $t0
  jal __print_char
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  lw $t0, 28($sp)
  li $t1, 4
  addu $t2, $t0, $t1
  sw $t2, 28($sp)
  j _L0
_L1:

__leavemain:
  lw $a0, 64($sp)
  lw $ra, 16($sp)
  la $sp, 64($sp)
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
