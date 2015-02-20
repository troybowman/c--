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
# node 2: type: TNT_ERROR
# child SEQ_NEXT for node 1
# node 3: type: TNT_STMT
# child SEQ_CUR for node 3
# node 4: type: TNT_PRINTF
# child PRINTF_TREE for node 4
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 6
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 3
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
# node 14: type: TNT_STRCON str: "%"
# child SEQ_NEXT for node 9
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_PRINTF
# child PRINTF_TREE for node 16
# node 17: type: TNT_STMT
# child SEQ_CUR for node 17
# node 18: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 18
# node 19: type: TNT_ARG
# child SEQ_CUR for node 19
# node 20: type: TNT_STRCON str: "%%%%%%%%"
# child SEQ_NEXT for node 15
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_PRINTF
# child PRINTF_TREE for node 22
# node 23: type: TNT_STMT
# child SEQ_CUR for node 23
# node 24: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 24
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_STRCON str: " % % % % "
# child SEQ_NEXT for node 21
# node 27: type: TNT_STMT
# child SEQ_CUR for node 27
# node 28: type: TNT_PRINTF
# child PRINTF_TREE for node 28
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 30
# node 31: type: TNT_ARG
# child SEQ_CUR for node 31
# node 32: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 27
# node 33: type: TNT_STMT
# child SEQ_CUR for node 33
# node 34: type: TNT_PRINTF
# child PRINTF_TREE for node 34
# node 35: type: TNT_STMT
# child SEQ_CUR for node 35
# node 36: type: TNT_CALL sym: _print_char
# child CALL_ARGS for node 36
# node 37: type: TNT_ARG
# child SEQ_CUR for node 37
# node 38: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 33
# node 39: type: TNT_STMT
# child SEQ_CUR for node 39
# node 40: type: TNT_PRINTF
# child PRINTF_TREE for node 40
# node 41: type: TNT_STMT
# child SEQ_CUR for node 41
# node 42: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 42
# node 43: type: TNT_ARG
# child SEQ_CUR for node 43
# node 44: type: TNT_SYMBOL sym: str
# child SEQ_NEXT for node 39
# node 45: type: TNT_STMT
# child SEQ_CUR for node 45
# node 46: type: TNT_PRINTF
# child PRINTF_TREE for node 46
# node 47: type: TNT_STMT
# child SEQ_CUR for node 47
# node 48: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 48
# node 49: type: TNT_ARG
# child SEQ_CUR for node 49
# node 50: type: TNT_STRCON str: "str"
# child SEQ_NEXT for node 45
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
# node 56: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 53
# node 57: type: TNT_STMT
# child SEQ_CUR for node 57
# node 58: type: TNT_CALL sym: _print_char
# child CALL_ARGS for node 58
# node 59: type: TNT_ARG
# child SEQ_CUR for node 59
# node 60: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 57
# node 61: type: TNT_STMT
# child SEQ_CUR for node 61
# node 62: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 62
# node 63: type: TNT_ARG
# child SEQ_CUR for node 63
# node 64: type: TNT_STRCON str: "hello"
# child SEQ_NEXT for node 61
# node 65: type: TNT_STMT
# child SEQ_CUR for node 65
# node 66: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 66
# node 67: type: TNT_ARG
# child SEQ_CUR for node 67
# node 68: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 51
# node 69: type: TNT_STMT
# child SEQ_CUR for node 69
# node 70: type: TNT_PRINTF
# child PRINTF_TREE for node 70
# node 71: type: TNT_STMT
# child SEQ_CUR for node 71
# node 72: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 72
# node 73: type: TNT_ARG
# child SEQ_CUR for node 73
# node 74: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 71
# node 75: type: TNT_STMT
# child SEQ_CUR for node 75
# node 76: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 76
# node 77: type: TNT_ARG
# child SEQ_CUR for node 77
# node 78: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 75
# node 79: type: TNT_STMT
# child SEQ_CUR for node 79
# node 80: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 80
# node 81: type: TNT_ARG
# child SEQ_CUR for node 81
# node 82: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 79
# node 83: type: TNT_STMT
# child SEQ_CUR for node 83
# node 84: type: TNT_CALL sym: _print_char
# child CALL_ARGS for node 84
# node 85: type: TNT_ARG
# child SEQ_CUR for node 85
# node 86: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 83
# node 87: type: TNT_STMT
# child SEQ_CUR for node 87
# node 88: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 88
# node 89: type: TNT_ARG
# child SEQ_CUR for node 89
# node 90: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 87
# node 91: type: TNT_STMT
# child SEQ_CUR for node 91
# node 92: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 92
# node 93: type: TNT_ARG
# child SEQ_CUR for node 93
# node 94: type: TNT_SYMBOL sym: str
# child SEQ_NEXT for node 91
# node 95: type: TNT_STMT
# child SEQ_CUR for node 95
# node 96: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 96
# node 97: type: TNT_ARG
# child SEQ_CUR for node 97
# node 98: type: TNT_STRCON str: " "
# child SEQ_NEXT for node 69
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
# node 104: type: TNT_STRCON str: " % % "
# child SEQ_NEXT for node 101
# node 105: type: TNT_STMT
# child SEQ_CUR for node 105
# node 106: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 106
# node 107: type: TNT_ARG
# child SEQ_CUR for node 107
# node 108: type: TNT_STRCON str: "blahblahblah"
# child SEQ_NEXT for node 105
# node 109: type: TNT_STMT
# child SEQ_CUR for node 109
# node 110: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 110
# node 111: type: TNT_ARG
# child SEQ_CUR for node 111
# node 112: type: TNT_STRCON str: " % %"
