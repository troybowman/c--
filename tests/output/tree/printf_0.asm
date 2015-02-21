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
# size: 3
# sym: i
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: c
#   line: 6
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: str
#   line: 7
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xa
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
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
# node 6: type: TNT_STRCON str: ""
# child SEQ_NEXT for node 1
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_PRINTF
# child PRINTF_TREE for node 8
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 7
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_PRINTF
# child PRINTF_TREE for node 14
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 16
# node 17: type: TNT_ARG
# child SEQ_CUR for node 17
# node 18: type: TNT_STRCON str: "%"
# child SEQ_NEXT for node 13
# node 19: type: TNT_STMT
# child SEQ_CUR for node 19
# node 20: type: TNT_PRINTF
# child PRINTF_TREE for node 20
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 22
# node 23: type: TNT_ARG
# child SEQ_CUR for node 23
# node 24: type: TNT_STRCON str: "%%%%%%%%"
# child SEQ_NEXT for node 19
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_PRINTF
# child PRINTF_TREE for node 26
# node 27: type: TNT_STMT
# child SEQ_CUR for node 27
# node 28: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 28
# node 29: type: TNT_ARG
# child SEQ_CUR for node 29
# node 30: type: TNT_STRCON str: " % % % % "
# child SEQ_NEXT for node 25
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
# node 36: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 31
# node 37: type: TNT_STMT
# child SEQ_CUR for node 37
# node 38: type: TNT_PRINTF
# child PRINTF_TREE for node 38
# node 39: type: TNT_STMT
# child SEQ_CUR for node 39
# node 40: type: TNT_CALL sym: _print_char
# child CALL_ARGS for node 40
# node 41: type: TNT_ARG
# child SEQ_CUR for node 41
# node 42: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 37
# node 43: type: TNT_STMT
# child SEQ_CUR for node 43
# node 44: type: TNT_PRINTF
# child PRINTF_TREE for node 44
# node 45: type: TNT_STMT
# child SEQ_CUR for node 45
# node 46: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 46
# node 47: type: TNT_ARG
# child SEQ_CUR for node 47
# node 48: type: TNT_SYMBOL sym: str
# child SEQ_NEXT for node 43
# node 49: type: TNT_STMT
# child SEQ_CUR for node 49
# node 50: type: TNT_PRINTF
# child PRINTF_TREE for node 50
# node 51: type: TNT_STMT
# child SEQ_CUR for node 51
# node 52: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 52
# node 53: type: TNT_ARG
# child SEQ_CUR for node 53
# node 54: type: TNT_STRCON str: "str"
# child SEQ_NEXT for node 49
# node 55: type: TNT_STMT
# child SEQ_CUR for node 55
# node 56: type: TNT_PRINTF
# child PRINTF_TREE for node 56
# node 57: type: TNT_STMT
# child SEQ_CUR for node 57
# node 58: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 58
# node 59: type: TNT_ARG
# child SEQ_CUR for node 59
# node 60: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 57
# node 61: type: TNT_STMT
# child SEQ_CUR for node 61
# node 62: type: TNT_CALL sym: _print_char
# child CALL_ARGS for node 62
# node 63: type: TNT_ARG
# child SEQ_CUR for node 63
# node 64: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 61
# node 65: type: TNT_STMT
# child SEQ_CUR for node 65
# node 66: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 66
# node 67: type: TNT_ARG
# child SEQ_CUR for node 67
# node 68: type: TNT_STRCON str: "hello"
# child SEQ_NEXT for node 65
# node 69: type: TNT_STMT
# child SEQ_CUR for node 69
# node 70: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 70
# node 71: type: TNT_ARG
# child SEQ_CUR for node 71
# node 72: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 55
# node 73: type: TNT_STMT
# child SEQ_CUR for node 73
# node 74: type: TNT_PRINTF
# child PRINTF_TREE for node 74
# node 75: type: TNT_STMT
# child SEQ_CUR for node 75
# node 76: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 76
# node 77: type: TNT_ARG
# child SEQ_CUR for node 77
# node 78: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 75
# node 79: type: TNT_STMT
# child SEQ_CUR for node 79
# node 80: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 80
# node 81: type: TNT_ARG
# child SEQ_CUR for node 81
# node 82: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 79
# node 83: type: TNT_STMT
# child SEQ_CUR for node 83
# node 84: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 84
# node 85: type: TNT_ARG
# child SEQ_CUR for node 85
# node 86: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 83
# node 87: type: TNT_STMT
# child SEQ_CUR for node 87
# node 88: type: TNT_CALL sym: _print_char
# child CALL_ARGS for node 88
# node 89: type: TNT_ARG
# child SEQ_CUR for node 89
# node 90: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 87
# node 91: type: TNT_STMT
# child SEQ_CUR for node 91
# node 92: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 92
# node 93: type: TNT_ARG
# child SEQ_CUR for node 93
# node 94: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 91
# node 95: type: TNT_STMT
# child SEQ_CUR for node 95
# node 96: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 96
# node 97: type: TNT_ARG
# child SEQ_CUR for node 97
# node 98: type: TNT_SYMBOL sym: str
# child SEQ_NEXT for node 95
# node 99: type: TNT_STMT
# child SEQ_CUR for node 99
# node 100: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 100
# node 101: type: TNT_ARG
# child SEQ_CUR for node 101
# node 102: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 73
# node 103: type: TNT_STMT
# child SEQ_CUR for node 103
# node 104: type: TNT_PRINTF
# child PRINTF_TREE for node 104
# node 105: type: TNT_STMT
# child SEQ_CUR for node 105
# node 106: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 106
# node 107: type: TNT_ARG
# child SEQ_CUR for node 107
# node 108: type: TNT_STRCON str: " %q %r "
# child SEQ_NEXT for node 105
# node 109: type: TNT_STMT
# child SEQ_CUR for node 109
# node 110: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 110
# node 111: type: TNT_ARG
# child SEQ_CUR for node 111
# node 112: type: TNT_STRCON str: "blahblahblah"
# child SEQ_NEXT for node 109
# node 113: type: TNT_STMT
# child SEQ_CUR for node 113
# node 114: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 114
# node 115: type: TNT_ARG
# child SEQ_CUR for node 115
# node 116: type: TNT_STRCON str: " %t %u"
# child SEQ_NEXT for node 103
# node 117: type: TNT_STMT
# child SEQ_CUR for node 117
# node 118: type: TNT_PRINTF
# child PRINTF_TREE for node 118
# node 119: type: TNT_STMT
# child SEQ_CUR for node 119
# node 120: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 120
# node 121: type: TNT_ARG
# child SEQ_CUR for node 121
# node 122: type: TNT_STRCON str: "%"
# child SEQ_NEXT for node 119
# node 123: type: TNT_STMT
# child SEQ_CUR for node 123
# node 124: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 124
# node 125: type: TNT_ARG
# child SEQ_CUR for node 125
# node 126: type: TNT_STRCON str: "one"
# child SEQ_NEXT for node 123
# node 127: type: TNT_STMT
# child SEQ_CUR for node 127
# node 128: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 128
# node 129: type: TNT_ARG
# child SEQ_CUR for node 129
# node 130: type: TNT_STRCON str: "%"
# child SEQ_NEXT for node 127
# node 131: type: TNT_STMT
# child SEQ_CUR for node 131
# node 132: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 132
# node 133: type: TNT_ARG
# child SEQ_CUR for node 133
# node 134: type: TNT_STRCON str: "two"
# child SEQ_NEXT for node 131
# node 135: type: TNT_STMT
# child SEQ_CUR for node 135
# node 136: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 136
# node 137: type: TNT_ARG
# child SEQ_CUR for node 137
# node 138: type: TNT_STRCON str: "%%%"
# child SEQ_NEXT for node 135
# node 139: type: TNT_STMT
# child SEQ_CUR for node 139
# node 140: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 140
# node 141: type: TNT_ARG
# child SEQ_CUR for node 141
# node 142: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 139
# node 143: type: TNT_STMT
# child SEQ_CUR for node 143
# node 144: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 144
# node 145: type: TNT_ARG
# child SEQ_CUR for node 145
# node 146: type: TNT_STRCON str: "dd"
# child SEQ_NEXT for node 143
# node 147: type: TNT_STMT
# child SEQ_CUR for node 147
# node 148: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 148
# node 149: type: TNT_ARG
# child SEQ_CUR for node 149
# node 150: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 147
# node 151: type: TNT_STMT
# child SEQ_CUR for node 151
# node 152: type: TNT_CALL sym: _print_char
# child CALL_ARGS for node 152
# node 153: type: TNT_ARG
# child SEQ_CUR for node 153
# node 154: type: TNT_CHARCON str: '5'
# child SEQ_NEXT for node 151
# node 155: type: TNT_STMT
# child SEQ_CUR for node 155
# node 156: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 156
# node 157: type: TNT_ARG
# child SEQ_CUR for node 157
# node 158: type: TNT_STRCON str: "cs"
# child SEQ_NEXT for node 155
# node 159: type: TNT_STMT
# child SEQ_CUR for node 159
# node 160: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 160
# node 161: type: TNT_ARG
# child SEQ_CUR for node 161
# node 162: type: TNT_STRCON str: "six"
