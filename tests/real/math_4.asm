#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 14
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
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: format
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: ST_ELLIPSIS
#     is_extern: yes
# sym: rotl
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: a
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: b
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: rotr
#   line: 6
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: a
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: b
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: ch
#   line: 7
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: y
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       2: z
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: maj
#   line: 8
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: y
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       2: z
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: ep0
#   line: 9
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: ep1
#   line: 10
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: sig0
#   line: 11
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: sig1
#   line: 12
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: main
#   line: 14
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: rotl
#-----------------------------------------------------------------------------
# size: 2
# sym: a
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: b
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: rotl
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_BOR
# child LHS for node 3
# node 4: type: TNT_SHL
# child LHS for node 4
# node 5: type: TNT_SYMBOL sym: a
# child RHS for node 4
# node 6: type: TNT_SYMBOL sym: b
# child RHS for node 3
# node 7: type: TNT_SHR
# child LHS for node 7
# node 8: type: TNT_SYMBOL sym: a
# child RHS for node 7
# node 9: type: TNT_MINUS
# child LHS for node 9
# node 10: type: TNT_INTCON val: 32
# child RHS for node 9
# node 11: type: TNT_SYMBOL sym: b
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: rotr
#-----------------------------------------------------------------------------
# size: 2
# sym: a
#   line: 6
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: b
#   line: 6
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: rotr
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_BOR
# child LHS for node 3
# node 4: type: TNT_SHR
# child LHS for node 4
# node 5: type: TNT_SYMBOL sym: a
# child RHS for node 4
# node 6: type: TNT_SYMBOL sym: b
# child RHS for node 3
# node 7: type: TNT_SHL
# child LHS for node 7
# node 8: type: TNT_SYMBOL sym: a
# child RHS for node 7
# node 9: type: TNT_MINUS
# child LHS for node 9
# node 10: type: TNT_INTCON val: 32
# child RHS for node 9
# node 11: type: TNT_SYMBOL sym: b
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: ch
#-----------------------------------------------------------------------------
# size: 3
# sym: x
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: z
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: ch
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_XOR
# child LHS for node 3
# node 4: type: TNT_BAND
# child LHS for node 4
# node 5: type: TNT_SYMBOL sym: x
# child RHS for node 4
# node 6: type: TNT_SYMBOL sym: y
# child RHS for node 3
# node 7: type: TNT_BAND
# child LHS for node 7
# node 8: type: TNT_BNOT
# child RHS for node 8
# node 9: type: TNT_SYMBOL sym: x
# child RHS for node 7
# node 10: type: TNT_SYMBOL sym: z
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: maj
#-----------------------------------------------------------------------------
# size: 3
# sym: x
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: z
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: maj
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_XOR
# child LHS for node 3
# node 4: type: TNT_XOR
# child LHS for node 4
# node 5: type: TNT_BAND
# child LHS for node 5
# node 6: type: TNT_SYMBOL sym: x
# child RHS for node 5
# node 7: type: TNT_SYMBOL sym: y
# child RHS for node 4
# node 8: type: TNT_BAND
# child LHS for node 8
# node 9: type: TNT_SYMBOL sym: x
# child RHS for node 8
# node 10: type: TNT_SYMBOL sym: z
# child RHS for node 3
# node 11: type: TNT_BAND
# child LHS for node 11
# node 12: type: TNT_SYMBOL sym: y
# child RHS for node 11
# node 13: type: TNT_SYMBOL sym: z
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: ep0
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 9
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: ep0
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_XOR
# child LHS for node 3
# node 4: type: TNT_XOR
# child LHS for node 4
# node 5: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 5
# node 6: type: TNT_ARG
# child SEQ_CUR for node 6
# node 7: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 6
# node 8: type: TNT_ARG
# child SEQ_CUR for node 8
# node 9: type: TNT_INTCON val: 2
# child RHS for node 4
# node 10: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 11
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_INTCON val: 13
# child RHS for node 3
# node 15: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 15
# node 16: type: TNT_ARG
# child SEQ_CUR for node 16
# node 17: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 16
# node 18: type: TNT_ARG
# child SEQ_CUR for node 18
# node 19: type: TNT_INTCON val: 22
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: ep1
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 10
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: ep1
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_XOR
# child LHS for node 3
# node 4: type: TNT_XOR
# child LHS for node 4
# node 5: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 5
# node 6: type: TNT_ARG
# child SEQ_CUR for node 6
# node 7: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 6
# node 8: type: TNT_ARG
# child SEQ_CUR for node 8
# node 9: type: TNT_INTCON val: 6
# child RHS for node 4
# node 10: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 11
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_INTCON val: 11
# child RHS for node 3
# node 15: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 15
# node 16: type: TNT_ARG
# child SEQ_CUR for node 16
# node 17: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 16
# node 18: type: TNT_ARG
# child SEQ_CUR for node 18
# node 19: type: TNT_INTCON val: 25
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: sig0
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 11
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: sig0
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_XOR
# child LHS for node 3
# node 4: type: TNT_XOR
# child LHS for node 4
# node 5: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 5
# node 6: type: TNT_ARG
# child SEQ_CUR for node 6
# node 7: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 6
# node 8: type: TNT_ARG
# child SEQ_CUR for node 8
# node 9: type: TNT_INTCON val: 7
# child RHS for node 4
# node 10: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 11
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_INTCON val: 18
# child RHS for node 3
# node 15: type: TNT_SHR
# child LHS for node 15
# node 16: type: TNT_SYMBOL sym: x
# child RHS for node 15
# node 17: type: TNT_INTCON val: 3
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: sig1
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 12
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: sig1
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_XOR
# child LHS for node 3
# node 4: type: TNT_XOR
# child LHS for node 4
# node 5: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 5
# node 6: type: TNT_ARG
# child SEQ_CUR for node 6
# node 7: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 6
# node 8: type: TNT_ARG
# child SEQ_CUR for node 8
# node 9: type: TNT_INTCON val: 17
# child RHS for node 4
# node 10: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 11
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_INTCON val: 19
# child RHS for node 3
# node 15: type: TNT_SHR
# child LHS for node 15
# node 16: type: TNT_SYMBOL sym: x
# child RHS for node 15
# node 17: type: TNT_INTCON val: 10
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 5
# sym: a
#   line: 16
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: b
#   line: 16
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: c
#   line: 16
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: d
#   line: 16
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: e
#   line: 16
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: a
# child RHS for node 2
# node 4: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: b
# child RHS for node 6
# node 8: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 5
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_ASSG
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: c
# child RHS for node 10
# node 12: type: TNT_INTCON val: -1
# child SEQ_NEXT for node 9
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_ASSG
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: d
# child RHS for node 14
# node 16: type: TNT_INTCON val: 305419896
# child SEQ_NEXT for node 13
# node 17: type: TNT_STMT
# child SEQ_CUR for node 17
# node 18: type: TNT_ASSG
# child LHS for node 18
# node 19: type: TNT_SYMBOL sym: e
# child RHS for node 18
# node 20: type: TNT_INTCON val: -1698898192
# child SEQ_NEXT for node 17
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
# node 26: type: TNT_STRCON str: "rotr: "
# child SEQ_NEXT for node 23
# node 27: type: TNT_STMT
# child SEQ_CUR for node 27
# node 28: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 28
# node 29: type: TNT_ARG
# child SEQ_CUR for node 29
# node 30: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 30
# node 31: type: TNT_ARG
# child SEQ_CUR for node 31
# node 32: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 31
# node 33: type: TNT_ARG
# child SEQ_CUR for node 33
# node 34: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 27
# node 35: type: TNT_STMT
# child SEQ_CUR for node 35
# node 36: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 36
# node 37: type: TNT_ARG
# child SEQ_CUR for node 37
# node 38: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 35
# node 39: type: TNT_STMT
# child SEQ_CUR for node 39
# node 40: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 40
# node 41: type: TNT_ARG
# child SEQ_CUR for node 41
# node 42: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 42
# node 43: type: TNT_ARG
# child SEQ_CUR for node 43
# node 44: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 43
# node 45: type: TNT_ARG
# child SEQ_CUR for node 45
# node 46: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 39
# node 47: type: TNT_STMT
# child SEQ_CUR for node 47
# node 48: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 48
# node 49: type: TNT_ARG
# child SEQ_CUR for node 49
# node 50: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 47
# node 51: type: TNT_STMT
# child SEQ_CUR for node 51
# node 52: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 52
# node 53: type: TNT_ARG
# child SEQ_CUR for node 53
# node 54: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 54
# node 55: type: TNT_ARG
# child SEQ_CUR for node 55
# node 56: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 55
# node 57: type: TNT_ARG
# child SEQ_CUR for node 57
# node 58: type: TNT_INTCON val: 18
# child SEQ_NEXT for node 51
# node 59: type: TNT_STMT
# child SEQ_CUR for node 59
# node 60: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 60
# node 61: type: TNT_ARG
# child SEQ_CUR for node 61
# node 62: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 59
# node 63: type: TNT_STMT
# child SEQ_CUR for node 63
# node 64: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 64
# node 65: type: TNT_ARG
# child SEQ_CUR for node 65
# node 66: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 66
# node 67: type: TNT_ARG
# child SEQ_CUR for node 67
# node 68: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 67
# node 69: type: TNT_ARG
# child SEQ_CUR for node 69
# node 70: type: TNT_INTCON val: 25
# child SEQ_NEXT for node 63
# node 71: type: TNT_STMT
# child SEQ_CUR for node 71
# node 72: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 72
# node 73: type: TNT_ARG
# child SEQ_CUR for node 73
# node 74: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 21
# node 75: type: TNT_STMT
# child SEQ_CUR for node 75
# node 76: type: TNT_PRINTF
# child PRINTF_TREE for node 76
# node 77: type: TNT_STMT
# child SEQ_CUR for node 77
# node 78: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 78
# node 79: type: TNT_ARG
# child SEQ_CUR for node 79
# node 80: type: TNT_STRCON str: "rotr: "
# child SEQ_NEXT for node 77
# node 81: type: TNT_STMT
# child SEQ_CUR for node 81
# node 82: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 82
# node 83: type: TNT_ARG
# child SEQ_CUR for node 83
# node 84: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 84
# node 85: type: TNT_ARG
# child SEQ_CUR for node 85
# node 86: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 85
# node 87: type: TNT_ARG
# child SEQ_CUR for node 87
# node 88: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 81
# node 89: type: TNT_STMT
# child SEQ_CUR for node 89
# node 90: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 90
# node 91: type: TNT_ARG
# child SEQ_CUR for node 91
# node 92: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 89
# node 93: type: TNT_STMT
# child SEQ_CUR for node 93
# node 94: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 94
# node 95: type: TNT_ARG
# child SEQ_CUR for node 95
# node 96: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 96
# node 97: type: TNT_ARG
# child SEQ_CUR for node 97
# node 98: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 97
# node 99: type: TNT_ARG
# child SEQ_CUR for node 99
# node 100: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 93
# node 101: type: TNT_STMT
# child SEQ_CUR for node 101
# node 102: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 102
# node 103: type: TNT_ARG
# child SEQ_CUR for node 103
# node 104: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 101
# node 105: type: TNT_STMT
# child SEQ_CUR for node 105
# node 106: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 106
# node 107: type: TNT_ARG
# child SEQ_CUR for node 107
# node 108: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 108
# node 109: type: TNT_ARG
# child SEQ_CUR for node 109
# node 110: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 109
# node 111: type: TNT_ARG
# child SEQ_CUR for node 111
# node 112: type: TNT_INTCON val: 18
# child SEQ_NEXT for node 105
# node 113: type: TNT_STMT
# child SEQ_CUR for node 113
# node 114: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 114
# node 115: type: TNT_ARG
# child SEQ_CUR for node 115
# node 116: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 113
# node 117: type: TNT_STMT
# child SEQ_CUR for node 117
# node 118: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 118
# node 119: type: TNT_ARG
# child SEQ_CUR for node 119
# node 120: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 120
# node 121: type: TNT_ARG
# child SEQ_CUR for node 121
# node 122: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 121
# node 123: type: TNT_ARG
# child SEQ_CUR for node 123
# node 124: type: TNT_INTCON val: 25
# child SEQ_NEXT for node 117
# node 125: type: TNT_STMT
# child SEQ_CUR for node 125
# node 126: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 126
# node 127: type: TNT_ARG
# child SEQ_CUR for node 127
# node 128: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 75
# node 129: type: TNT_STMT
# child SEQ_CUR for node 129
# node 130: type: TNT_PRINTF
# child PRINTF_TREE for node 130
# node 131: type: TNT_STMT
# child SEQ_CUR for node 131
# node 132: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 132
# node 133: type: TNT_ARG
# child SEQ_CUR for node 133
# node 134: type: TNT_STRCON str: "rotr: "
# child SEQ_NEXT for node 131
# node 135: type: TNT_STMT
# child SEQ_CUR for node 135
# node 136: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 136
# node 137: type: TNT_ARG
# child SEQ_CUR for node 137
# node 138: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 138
# node 139: type: TNT_ARG
# child SEQ_CUR for node 139
# node 140: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 139
# node 141: type: TNT_ARG
# child SEQ_CUR for node 141
# node 142: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 135
# node 143: type: TNT_STMT
# child SEQ_CUR for node 143
# node 144: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 144
# node 145: type: TNT_ARG
# child SEQ_CUR for node 145
# node 146: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 143
# node 147: type: TNT_STMT
# child SEQ_CUR for node 147
# node 148: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 148
# node 149: type: TNT_ARG
# child SEQ_CUR for node 149
# node 150: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 150
# node 151: type: TNT_ARG
# child SEQ_CUR for node 151
# node 152: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 151
# node 153: type: TNT_ARG
# child SEQ_CUR for node 153
# node 154: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 147
# node 155: type: TNT_STMT
# child SEQ_CUR for node 155
# node 156: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 156
# node 157: type: TNT_ARG
# child SEQ_CUR for node 157
# node 158: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 155
# node 159: type: TNT_STMT
# child SEQ_CUR for node 159
# node 160: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 160
# node 161: type: TNT_ARG
# child SEQ_CUR for node 161
# node 162: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 162
# node 163: type: TNT_ARG
# child SEQ_CUR for node 163
# node 164: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 163
# node 165: type: TNT_ARG
# child SEQ_CUR for node 165
# node 166: type: TNT_INTCON val: 18
# child SEQ_NEXT for node 159
# node 167: type: TNT_STMT
# child SEQ_CUR for node 167
# node 168: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 168
# node 169: type: TNT_ARG
# child SEQ_CUR for node 169
# node 170: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 167
# node 171: type: TNT_STMT
# child SEQ_CUR for node 171
# node 172: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 172
# node 173: type: TNT_ARG
# child SEQ_CUR for node 173
# node 174: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 174
# node 175: type: TNT_ARG
# child SEQ_CUR for node 175
# node 176: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 175
# node 177: type: TNT_ARG
# child SEQ_CUR for node 177
# node 178: type: TNT_INTCON val: 25
# child SEQ_NEXT for node 171
# node 179: type: TNT_STMT
# child SEQ_CUR for node 179
# node 180: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 180
# node 181: type: TNT_ARG
# child SEQ_CUR for node 181
# node 182: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 129
# node 183: type: TNT_STMT
# child SEQ_CUR for node 183
# node 184: type: TNT_PRINTF
# child PRINTF_TREE for node 184
# node 185: type: TNT_STMT
# child SEQ_CUR for node 185
# node 186: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 186
# node 187: type: TNT_ARG
# child SEQ_CUR for node 187
# node 188: type: TNT_STRCON str: "rotr: "
# child SEQ_NEXT for node 185
# node 189: type: TNT_STMT
# child SEQ_CUR for node 189
# node 190: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 190
# node 191: type: TNT_ARG
# child SEQ_CUR for node 191
# node 192: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 192
# node 193: type: TNT_ARG
# child SEQ_CUR for node 193
# node 194: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 193
# node 195: type: TNT_ARG
# child SEQ_CUR for node 195
# node 196: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 189
# node 197: type: TNT_STMT
# child SEQ_CUR for node 197
# node 198: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 198
# node 199: type: TNT_ARG
# child SEQ_CUR for node 199
# node 200: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 197
# node 201: type: TNT_STMT
# child SEQ_CUR for node 201
# node 202: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 202
# node 203: type: TNT_ARG
# child SEQ_CUR for node 203
# node 204: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 204
# node 205: type: TNT_ARG
# child SEQ_CUR for node 205
# node 206: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 205
# node 207: type: TNT_ARG
# child SEQ_CUR for node 207
# node 208: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 201
# node 209: type: TNT_STMT
# child SEQ_CUR for node 209
# node 210: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 210
# node 211: type: TNT_ARG
# child SEQ_CUR for node 211
# node 212: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 209
# node 213: type: TNT_STMT
# child SEQ_CUR for node 213
# node 214: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 214
# node 215: type: TNT_ARG
# child SEQ_CUR for node 215
# node 216: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 216
# node 217: type: TNT_ARG
# child SEQ_CUR for node 217
# node 218: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 217
# node 219: type: TNT_ARG
# child SEQ_CUR for node 219
# node 220: type: TNT_INTCON val: 18
# child SEQ_NEXT for node 213
# node 221: type: TNT_STMT
# child SEQ_CUR for node 221
# node 222: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 222
# node 223: type: TNT_ARG
# child SEQ_CUR for node 223
# node 224: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 221
# node 225: type: TNT_STMT
# child SEQ_CUR for node 225
# node 226: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 226
# node 227: type: TNT_ARG
# child SEQ_CUR for node 227
# node 228: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 228
# node 229: type: TNT_ARG
# child SEQ_CUR for node 229
# node 230: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 229
# node 231: type: TNT_ARG
# child SEQ_CUR for node 231
# node 232: type: TNT_INTCON val: 25
# child SEQ_NEXT for node 225
# node 233: type: TNT_STMT
# child SEQ_CUR for node 233
# node 234: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 234
# node 235: type: TNT_ARG
# child SEQ_CUR for node 235
# node 236: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 183
# node 237: type: TNT_STMT
# child SEQ_CUR for node 237
# node 238: type: TNT_PRINTF
# child PRINTF_TREE for node 238
# node 239: type: TNT_STMT
# child SEQ_CUR for node 239
# node 240: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 240
# node 241: type: TNT_ARG
# child SEQ_CUR for node 241
# node 242: type: TNT_STRCON str: "rotr: "
# child SEQ_NEXT for node 239
# node 243: type: TNT_STMT
# child SEQ_CUR for node 243
# node 244: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 244
# node 245: type: TNT_ARG
# child SEQ_CUR for node 245
# node 246: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 246
# node 247: type: TNT_ARG
# child SEQ_CUR for node 247
# node 248: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 247
# node 249: type: TNT_ARG
# child SEQ_CUR for node 249
# node 250: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 243
# node 251: type: TNT_STMT
# child SEQ_CUR for node 251
# node 252: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 252
# node 253: type: TNT_ARG
# child SEQ_CUR for node 253
# node 254: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 251
# node 255: type: TNT_STMT
# child SEQ_CUR for node 255
# node 256: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 256
# node 257: type: TNT_ARG
# child SEQ_CUR for node 257
# node 258: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 258
# node 259: type: TNT_ARG
# child SEQ_CUR for node 259
# node 260: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 259
# node 261: type: TNT_ARG
# child SEQ_CUR for node 261
# node 262: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 255
# node 263: type: TNT_STMT
# child SEQ_CUR for node 263
# node 264: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 264
# node 265: type: TNT_ARG
# child SEQ_CUR for node 265
# node 266: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 263
# node 267: type: TNT_STMT
# child SEQ_CUR for node 267
# node 268: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 268
# node 269: type: TNT_ARG
# child SEQ_CUR for node 269
# node 270: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 270
# node 271: type: TNT_ARG
# child SEQ_CUR for node 271
# node 272: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 271
# node 273: type: TNT_ARG
# child SEQ_CUR for node 273
# node 274: type: TNT_INTCON val: 18
# child SEQ_NEXT for node 267
# node 275: type: TNT_STMT
# child SEQ_CUR for node 275
# node 276: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 276
# node 277: type: TNT_ARG
# child SEQ_CUR for node 277
# node 278: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 275
# node 279: type: TNT_STMT
# child SEQ_CUR for node 279
# node 280: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 280
# node 281: type: TNT_ARG
# child SEQ_CUR for node 281
# node 282: type: TNT_CALL sym: rotr
# child CALL_ARGS for node 282
# node 283: type: TNT_ARG
# child SEQ_CUR for node 283
# node 284: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 283
# node 285: type: TNT_ARG
# child SEQ_CUR for node 285
# node 286: type: TNT_INTCON val: 25
# child SEQ_NEXT for node 279
# node 287: type: TNT_STMT
# child SEQ_CUR for node 287
# node 288: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 288
# node 289: type: TNT_ARG
# child SEQ_CUR for node 289
# node 290: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 237
# node 291: type: TNT_STMT
# child SEQ_CUR for node 291
# node 292: type: TNT_PRINTF
# child PRINTF_TREE for node 292
# node 293: type: TNT_STMT
# child SEQ_CUR for node 293
# node 294: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 294
# node 295: type: TNT_ARG
# child SEQ_CUR for node 295
# node 296: type: TNT_STRCON str: "rotl: "
# child SEQ_NEXT for node 293
# node 297: type: TNT_STMT
# child SEQ_CUR for node 297
# node 298: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 298
# node 299: type: TNT_ARG
# child SEQ_CUR for node 299
# node 300: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 300
# node 301: type: TNT_ARG
# child SEQ_CUR for node 301
# node 302: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 301
# node 303: type: TNT_ARG
# child SEQ_CUR for node 303
# node 304: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 297
# node 305: type: TNT_STMT
# child SEQ_CUR for node 305
# node 306: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 306
# node 307: type: TNT_ARG
# child SEQ_CUR for node 307
# node 308: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 305
# node 309: type: TNT_STMT
# child SEQ_CUR for node 309
# node 310: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 310
# node 311: type: TNT_ARG
# child SEQ_CUR for node 311
# node 312: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 312
# node 313: type: TNT_ARG
# child SEQ_CUR for node 313
# node 314: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 313
# node 315: type: TNT_ARG
# child SEQ_CUR for node 315
# node 316: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 309
# node 317: type: TNT_STMT
# child SEQ_CUR for node 317
# node 318: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 318
# node 319: type: TNT_ARG
# child SEQ_CUR for node 319
# node 320: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 317
# node 321: type: TNT_STMT
# child SEQ_CUR for node 321
# node 322: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 322
# node 323: type: TNT_ARG
# child SEQ_CUR for node 323
# node 324: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 324
# node 325: type: TNT_ARG
# child SEQ_CUR for node 325
# node 326: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 325
# node 327: type: TNT_ARG
# child SEQ_CUR for node 327
# node 328: type: TNT_INTCON val: 9
# child SEQ_NEXT for node 321
# node 329: type: TNT_STMT
# child SEQ_CUR for node 329
# node 330: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 330
# node 331: type: TNT_ARG
# child SEQ_CUR for node 331
# node 332: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 329
# node 333: type: TNT_STMT
# child SEQ_CUR for node 333
# node 334: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 334
# node 335: type: TNT_ARG
# child SEQ_CUR for node 335
# node 336: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 336
# node 337: type: TNT_ARG
# child SEQ_CUR for node 337
# node 338: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 337
# node 339: type: TNT_ARG
# child SEQ_CUR for node 339
# node 340: type: TNT_INTCON val: 16
# child SEQ_NEXT for node 333
# node 341: type: TNT_STMT
# child SEQ_CUR for node 341
# node 342: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 342
# node 343: type: TNT_ARG
# child SEQ_CUR for node 343
# node 344: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 291
# node 345: type: TNT_STMT
# child SEQ_CUR for node 345
# node 346: type: TNT_PRINTF
# child PRINTF_TREE for node 346
# node 347: type: TNT_STMT
# child SEQ_CUR for node 347
# node 348: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 348
# node 349: type: TNT_ARG
# child SEQ_CUR for node 349
# node 350: type: TNT_STRCON str: "rotl: "
# child SEQ_NEXT for node 347
# node 351: type: TNT_STMT
# child SEQ_CUR for node 351
# node 352: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 352
# node 353: type: TNT_ARG
# child SEQ_CUR for node 353
# node 354: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 354
# node 355: type: TNT_ARG
# child SEQ_CUR for node 355
# node 356: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 355
# node 357: type: TNT_ARG
# child SEQ_CUR for node 357
# node 358: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 351
# node 359: type: TNT_STMT
# child SEQ_CUR for node 359
# node 360: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 360
# node 361: type: TNT_ARG
# child SEQ_CUR for node 361
# node 362: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 359
# node 363: type: TNT_STMT
# child SEQ_CUR for node 363
# node 364: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 364
# node 365: type: TNT_ARG
# child SEQ_CUR for node 365
# node 366: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 366
# node 367: type: TNT_ARG
# child SEQ_CUR for node 367
# node 368: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 367
# node 369: type: TNT_ARG
# child SEQ_CUR for node 369
# node 370: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 363
# node 371: type: TNT_STMT
# child SEQ_CUR for node 371
# node 372: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 372
# node 373: type: TNT_ARG
# child SEQ_CUR for node 373
# node 374: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 371
# node 375: type: TNT_STMT
# child SEQ_CUR for node 375
# node 376: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 376
# node 377: type: TNT_ARG
# child SEQ_CUR for node 377
# node 378: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 378
# node 379: type: TNT_ARG
# child SEQ_CUR for node 379
# node 380: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 379
# node 381: type: TNT_ARG
# child SEQ_CUR for node 381
# node 382: type: TNT_INTCON val: 9
# child SEQ_NEXT for node 375
# node 383: type: TNT_STMT
# child SEQ_CUR for node 383
# node 384: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 384
# node 385: type: TNT_ARG
# child SEQ_CUR for node 385
# node 386: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 383
# node 387: type: TNT_STMT
# child SEQ_CUR for node 387
# node 388: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 388
# node 389: type: TNT_ARG
# child SEQ_CUR for node 389
# node 390: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 390
# node 391: type: TNT_ARG
# child SEQ_CUR for node 391
# node 392: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 391
# node 393: type: TNT_ARG
# child SEQ_CUR for node 393
# node 394: type: TNT_INTCON val: 16
# child SEQ_NEXT for node 387
# node 395: type: TNT_STMT
# child SEQ_CUR for node 395
# node 396: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 396
# node 397: type: TNT_ARG
# child SEQ_CUR for node 397
# node 398: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 345
# node 399: type: TNT_STMT
# child SEQ_CUR for node 399
# node 400: type: TNT_PRINTF
# child PRINTF_TREE for node 400
# node 401: type: TNT_STMT
# child SEQ_CUR for node 401
# node 402: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 402
# node 403: type: TNT_ARG
# child SEQ_CUR for node 403
# node 404: type: TNT_STRCON str: "rotl: "
# child SEQ_NEXT for node 401
# node 405: type: TNT_STMT
# child SEQ_CUR for node 405
# node 406: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 406
# node 407: type: TNT_ARG
# child SEQ_CUR for node 407
# node 408: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 408
# node 409: type: TNT_ARG
# child SEQ_CUR for node 409
# node 410: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 409
# node 411: type: TNT_ARG
# child SEQ_CUR for node 411
# node 412: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 405
# node 413: type: TNT_STMT
# child SEQ_CUR for node 413
# node 414: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 414
# node 415: type: TNT_ARG
# child SEQ_CUR for node 415
# node 416: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 413
# node 417: type: TNT_STMT
# child SEQ_CUR for node 417
# node 418: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 418
# node 419: type: TNT_ARG
# child SEQ_CUR for node 419
# node 420: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 420
# node 421: type: TNT_ARG
# child SEQ_CUR for node 421
# node 422: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 421
# node 423: type: TNT_ARG
# child SEQ_CUR for node 423
# node 424: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 417
# node 425: type: TNT_STMT
# child SEQ_CUR for node 425
# node 426: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 426
# node 427: type: TNT_ARG
# child SEQ_CUR for node 427
# node 428: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 425
# node 429: type: TNT_STMT
# child SEQ_CUR for node 429
# node 430: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 430
# node 431: type: TNT_ARG
# child SEQ_CUR for node 431
# node 432: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 432
# node 433: type: TNT_ARG
# child SEQ_CUR for node 433
# node 434: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 433
# node 435: type: TNT_ARG
# child SEQ_CUR for node 435
# node 436: type: TNT_INTCON val: 9
# child SEQ_NEXT for node 429
# node 437: type: TNT_STMT
# child SEQ_CUR for node 437
# node 438: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 438
# node 439: type: TNT_ARG
# child SEQ_CUR for node 439
# node 440: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 437
# node 441: type: TNT_STMT
# child SEQ_CUR for node 441
# node 442: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 442
# node 443: type: TNT_ARG
# child SEQ_CUR for node 443
# node 444: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 444
# node 445: type: TNT_ARG
# child SEQ_CUR for node 445
# node 446: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 445
# node 447: type: TNT_ARG
# child SEQ_CUR for node 447
# node 448: type: TNT_INTCON val: 16
# child SEQ_NEXT for node 441
# node 449: type: TNT_STMT
# child SEQ_CUR for node 449
# node 450: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 450
# node 451: type: TNT_ARG
# child SEQ_CUR for node 451
# node 452: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 399
# node 453: type: TNT_STMT
# child SEQ_CUR for node 453
# node 454: type: TNT_PRINTF
# child PRINTF_TREE for node 454
# node 455: type: TNT_STMT
# child SEQ_CUR for node 455
# node 456: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 456
# node 457: type: TNT_ARG
# child SEQ_CUR for node 457
# node 458: type: TNT_STRCON str: "rotl: "
# child SEQ_NEXT for node 455
# node 459: type: TNT_STMT
# child SEQ_CUR for node 459
# node 460: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 460
# node 461: type: TNT_ARG
# child SEQ_CUR for node 461
# node 462: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 462
# node 463: type: TNT_ARG
# child SEQ_CUR for node 463
# node 464: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 463
# node 465: type: TNT_ARG
# child SEQ_CUR for node 465
# node 466: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 459
# node 467: type: TNT_STMT
# child SEQ_CUR for node 467
# node 468: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 468
# node 469: type: TNT_ARG
# child SEQ_CUR for node 469
# node 470: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 467
# node 471: type: TNT_STMT
# child SEQ_CUR for node 471
# node 472: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 472
# node 473: type: TNT_ARG
# child SEQ_CUR for node 473
# node 474: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 474
# node 475: type: TNT_ARG
# child SEQ_CUR for node 475
# node 476: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 475
# node 477: type: TNT_ARG
# child SEQ_CUR for node 477
# node 478: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 471
# node 479: type: TNT_STMT
# child SEQ_CUR for node 479
# node 480: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 480
# node 481: type: TNT_ARG
# child SEQ_CUR for node 481
# node 482: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 479
# node 483: type: TNT_STMT
# child SEQ_CUR for node 483
# node 484: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 484
# node 485: type: TNT_ARG
# child SEQ_CUR for node 485
# node 486: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 486
# node 487: type: TNT_ARG
# child SEQ_CUR for node 487
# node 488: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 487
# node 489: type: TNT_ARG
# child SEQ_CUR for node 489
# node 490: type: TNT_INTCON val: 9
# child SEQ_NEXT for node 483
# node 491: type: TNT_STMT
# child SEQ_CUR for node 491
# node 492: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 492
# node 493: type: TNT_ARG
# child SEQ_CUR for node 493
# node 494: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 491
# node 495: type: TNT_STMT
# child SEQ_CUR for node 495
# node 496: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 496
# node 497: type: TNT_ARG
# child SEQ_CUR for node 497
# node 498: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 498
# node 499: type: TNT_ARG
# child SEQ_CUR for node 499
# node 500: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 499
# node 501: type: TNT_ARG
# child SEQ_CUR for node 501
# node 502: type: TNT_INTCON val: 16
# child SEQ_NEXT for node 495
# node 503: type: TNT_STMT
# child SEQ_CUR for node 503
# node 504: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 504
# node 505: type: TNT_ARG
# child SEQ_CUR for node 505
# node 506: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 453
# node 507: type: TNT_STMT
# child SEQ_CUR for node 507
# node 508: type: TNT_PRINTF
# child PRINTF_TREE for node 508
# node 509: type: TNT_STMT
# child SEQ_CUR for node 509
# node 510: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 510
# node 511: type: TNT_ARG
# child SEQ_CUR for node 511
# node 512: type: TNT_STRCON str: "rotl: "
# child SEQ_NEXT for node 509
# node 513: type: TNT_STMT
# child SEQ_CUR for node 513
# node 514: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 514
# node 515: type: TNT_ARG
# child SEQ_CUR for node 515
# node 516: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 516
# node 517: type: TNT_ARG
# child SEQ_CUR for node 517
# node 518: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 517
# node 519: type: TNT_ARG
# child SEQ_CUR for node 519
# node 520: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 513
# node 521: type: TNT_STMT
# child SEQ_CUR for node 521
# node 522: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 522
# node 523: type: TNT_ARG
# child SEQ_CUR for node 523
# node 524: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 521
# node 525: type: TNT_STMT
# child SEQ_CUR for node 525
# node 526: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 526
# node 527: type: TNT_ARG
# child SEQ_CUR for node 527
# node 528: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 528
# node 529: type: TNT_ARG
# child SEQ_CUR for node 529
# node 530: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 529
# node 531: type: TNT_ARG
# child SEQ_CUR for node 531
# node 532: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 525
# node 533: type: TNT_STMT
# child SEQ_CUR for node 533
# node 534: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 534
# node 535: type: TNT_ARG
# child SEQ_CUR for node 535
# node 536: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 533
# node 537: type: TNT_STMT
# child SEQ_CUR for node 537
# node 538: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 538
# node 539: type: TNT_ARG
# child SEQ_CUR for node 539
# node 540: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 540
# node 541: type: TNT_ARG
# child SEQ_CUR for node 541
# node 542: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 541
# node 543: type: TNT_ARG
# child SEQ_CUR for node 543
# node 544: type: TNT_INTCON val: 9
# child SEQ_NEXT for node 537
# node 545: type: TNT_STMT
# child SEQ_CUR for node 545
# node 546: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 546
# node 547: type: TNT_ARG
# child SEQ_CUR for node 547
# node 548: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 545
# node 549: type: TNT_STMT
# child SEQ_CUR for node 549
# node 550: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 550
# node 551: type: TNT_ARG
# child SEQ_CUR for node 551
# node 552: type: TNT_CALL sym: rotl
# child CALL_ARGS for node 552
# node 553: type: TNT_ARG
# child SEQ_CUR for node 553
# node 554: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 553
# node 555: type: TNT_ARG
# child SEQ_CUR for node 555
# node 556: type: TNT_INTCON val: 16
# child SEQ_NEXT for node 549
# node 557: type: TNT_STMT
# child SEQ_CUR for node 557
# node 558: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 558
# node 559: type: TNT_ARG
# child SEQ_CUR for node 559
# node 560: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 507
# node 561: type: TNT_STMT
# child SEQ_CUR for node 561
# node 562: type: TNT_PRINTF
# child PRINTF_TREE for node 562
# node 563: type: TNT_STMT
# child SEQ_CUR for node 563
# node 564: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 564
# node 565: type: TNT_ARG
# child SEQ_CUR for node 565
# node 566: type: TNT_STRCON str: "ch:   "
# child SEQ_NEXT for node 563
# node 567: type: TNT_STMT
# child SEQ_CUR for node 567
# node 568: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 568
# node 569: type: TNT_ARG
# child SEQ_CUR for node 569
# node 570: type: TNT_CALL sym: ch
# child CALL_ARGS for node 570
# node 571: type: TNT_ARG
# child SEQ_CUR for node 571
# node 572: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 571
# node 573: type: TNT_ARG
# child SEQ_CUR for node 573
# node 574: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 573
# node 575: type: TNT_ARG
# child SEQ_CUR for node 575
# node 576: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 567
# node 577: type: TNT_STMT
# child SEQ_CUR for node 577
# node 578: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 578
# node 579: type: TNT_ARG
# child SEQ_CUR for node 579
# node 580: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 561
# node 581: type: TNT_STMT
# child SEQ_CUR for node 581
# node 582: type: TNT_PRINTF
# child PRINTF_TREE for node 582
# node 583: type: TNT_STMT
# child SEQ_CUR for node 583
# node 584: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 584
# node 585: type: TNT_ARG
# child SEQ_CUR for node 585
# node 586: type: TNT_STRCON str: "maj:  "
# child SEQ_NEXT for node 583
# node 587: type: TNT_STMT
# child SEQ_CUR for node 587
# node 588: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 588
# node 589: type: TNT_ARG
# child SEQ_CUR for node 589
# node 590: type: TNT_CALL sym: maj
# child CALL_ARGS for node 590
# node 591: type: TNT_ARG
# child SEQ_CUR for node 591
# node 592: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 591
# node 593: type: TNT_ARG
# child SEQ_CUR for node 593
# node 594: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 593
# node 595: type: TNT_ARG
# child SEQ_CUR for node 595
# node 596: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 587
# node 597: type: TNT_STMT
# child SEQ_CUR for node 597
# node 598: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 598
# node 599: type: TNT_ARG
# child SEQ_CUR for node 599
# node 600: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 581
# node 601: type: TNT_STMT
# child SEQ_CUR for node 601
# node 602: type: TNT_PRINTF
# child PRINTF_TREE for node 602
# node 603: type: TNT_STMT
# child SEQ_CUR for node 603
# node 604: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 604
# node 605: type: TNT_ARG
# child SEQ_CUR for node 605
# node 606: type: TNT_STRCON str: "ep0:  "
# child SEQ_NEXT for node 603
# node 607: type: TNT_STMT
# child SEQ_CUR for node 607
# node 608: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 608
# node 609: type: TNT_ARG
# child SEQ_CUR for node 609
# node 610: type: TNT_CALL sym: ep0
# child CALL_ARGS for node 610
# node 611: type: TNT_ARG
# child SEQ_CUR for node 611
# node 612: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 607
# node 613: type: TNT_STMT
# child SEQ_CUR for node 613
# node 614: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 614
# node 615: type: TNT_ARG
# child SEQ_CUR for node 615
# node 616: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 613
# node 617: type: TNT_STMT
# child SEQ_CUR for node 617
# node 618: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 618
# node 619: type: TNT_ARG
# child SEQ_CUR for node 619
# node 620: type: TNT_CALL sym: ep0
# child CALL_ARGS for node 620
# node 621: type: TNT_ARG
# child SEQ_CUR for node 621
# node 622: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 617
# node 623: type: TNT_STMT
# child SEQ_CUR for node 623
# node 624: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 624
# node 625: type: TNT_ARG
# child SEQ_CUR for node 625
# node 626: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 623
# node 627: type: TNT_STMT
# child SEQ_CUR for node 627
# node 628: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 628
# node 629: type: TNT_ARG
# child SEQ_CUR for node 629
# node 630: type: TNT_CALL sym: ep0
# child CALL_ARGS for node 630
# node 631: type: TNT_ARG
# child SEQ_CUR for node 631
# node 632: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 627
# node 633: type: TNT_STMT
# child SEQ_CUR for node 633
# node 634: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 634
# node 635: type: TNT_ARG
# child SEQ_CUR for node 635
# node 636: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 633
# node 637: type: TNT_STMT
# child SEQ_CUR for node 637
# node 638: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 638
# node 639: type: TNT_ARG
# child SEQ_CUR for node 639
# node 640: type: TNT_CALL sym: ep0
# child CALL_ARGS for node 640
# node 641: type: TNT_ARG
# child SEQ_CUR for node 641
# node 642: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 637
# node 643: type: TNT_STMT
# child SEQ_CUR for node 643
# node 644: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 644
# node 645: type: TNT_ARG
# child SEQ_CUR for node 645
# node 646: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 643
# node 647: type: TNT_STMT
# child SEQ_CUR for node 647
# node 648: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 648
# node 649: type: TNT_ARG
# child SEQ_CUR for node 649
# node 650: type: TNT_CALL sym: ep0
# child CALL_ARGS for node 650
# node 651: type: TNT_ARG
# child SEQ_CUR for node 651
# node 652: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 647
# node 653: type: TNT_STMT
# child SEQ_CUR for node 653
# node 654: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 654
# node 655: type: TNT_ARG
# child SEQ_CUR for node 655
# node 656: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 601
# node 657: type: TNT_STMT
# child SEQ_CUR for node 657
# node 658: type: TNT_PRINTF
# child PRINTF_TREE for node 658
# node 659: type: TNT_STMT
# child SEQ_CUR for node 659
# node 660: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 660
# node 661: type: TNT_ARG
# child SEQ_CUR for node 661
# node 662: type: TNT_STRCON str: "ep1:  "
# child SEQ_NEXT for node 659
# node 663: type: TNT_STMT
# child SEQ_CUR for node 663
# node 664: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 664
# node 665: type: TNT_ARG
# child SEQ_CUR for node 665
# node 666: type: TNT_CALL sym: ep1
# child CALL_ARGS for node 666
# node 667: type: TNT_ARG
# child SEQ_CUR for node 667
# node 668: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 663
# node 669: type: TNT_STMT
# child SEQ_CUR for node 669
# node 670: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 670
# node 671: type: TNT_ARG
# child SEQ_CUR for node 671
# node 672: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 669
# node 673: type: TNT_STMT
# child SEQ_CUR for node 673
# node 674: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 674
# node 675: type: TNT_ARG
# child SEQ_CUR for node 675
# node 676: type: TNT_CALL sym: ep1
# child CALL_ARGS for node 676
# node 677: type: TNT_ARG
# child SEQ_CUR for node 677
# node 678: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 673
# node 679: type: TNT_STMT
# child SEQ_CUR for node 679
# node 680: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 680
# node 681: type: TNT_ARG
# child SEQ_CUR for node 681
# node 682: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 679
# node 683: type: TNT_STMT
# child SEQ_CUR for node 683
# node 684: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 684
# node 685: type: TNT_ARG
# child SEQ_CUR for node 685
# node 686: type: TNT_CALL sym: ep1
# child CALL_ARGS for node 686
# node 687: type: TNT_ARG
# child SEQ_CUR for node 687
# node 688: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 683
# node 689: type: TNT_STMT
# child SEQ_CUR for node 689
# node 690: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 690
# node 691: type: TNT_ARG
# child SEQ_CUR for node 691
# node 692: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 689
# node 693: type: TNT_STMT
# child SEQ_CUR for node 693
# node 694: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 694
# node 695: type: TNT_ARG
# child SEQ_CUR for node 695
# node 696: type: TNT_CALL sym: ep1
# child CALL_ARGS for node 696
# node 697: type: TNT_ARG
# child SEQ_CUR for node 697
# node 698: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 693
# node 699: type: TNT_STMT
# child SEQ_CUR for node 699
# node 700: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 700
# node 701: type: TNT_ARG
# child SEQ_CUR for node 701
# node 702: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 699
# node 703: type: TNT_STMT
# child SEQ_CUR for node 703
# node 704: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 704
# node 705: type: TNT_ARG
# child SEQ_CUR for node 705
# node 706: type: TNT_CALL sym: ep1
# child CALL_ARGS for node 706
# node 707: type: TNT_ARG
# child SEQ_CUR for node 707
# node 708: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 703
# node 709: type: TNT_STMT
# child SEQ_CUR for node 709
# node 710: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 710
# node 711: type: TNT_ARG
# child SEQ_CUR for node 711
# node 712: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 657
# node 713: type: TNT_STMT
# child SEQ_CUR for node 713
# node 714: type: TNT_PRINTF
# child PRINTF_TREE for node 714
# node 715: type: TNT_STMT
# child SEQ_CUR for node 715
# node 716: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 716
# node 717: type: TNT_ARG
# child SEQ_CUR for node 717
# node 718: type: TNT_STRCON str: "sig0: "
# child SEQ_NEXT for node 715
# node 719: type: TNT_STMT
# child SEQ_CUR for node 719
# node 720: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 720
# node 721: type: TNT_ARG
# child SEQ_CUR for node 721
# node 722: type: TNT_CALL sym: sig0
# child CALL_ARGS for node 722
# node 723: type: TNT_ARG
# child SEQ_CUR for node 723
# node 724: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 719
# node 725: type: TNT_STMT
# child SEQ_CUR for node 725
# node 726: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 726
# node 727: type: TNT_ARG
# child SEQ_CUR for node 727
# node 728: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 725
# node 729: type: TNT_STMT
# child SEQ_CUR for node 729
# node 730: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 730
# node 731: type: TNT_ARG
# child SEQ_CUR for node 731
# node 732: type: TNT_CALL sym: sig0
# child CALL_ARGS for node 732
# node 733: type: TNT_ARG
# child SEQ_CUR for node 733
# node 734: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 729
# node 735: type: TNT_STMT
# child SEQ_CUR for node 735
# node 736: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 736
# node 737: type: TNT_ARG
# child SEQ_CUR for node 737
# node 738: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 735
# node 739: type: TNT_STMT
# child SEQ_CUR for node 739
# node 740: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 740
# node 741: type: TNT_ARG
# child SEQ_CUR for node 741
# node 742: type: TNT_CALL sym: sig0
# child CALL_ARGS for node 742
# node 743: type: TNT_ARG
# child SEQ_CUR for node 743
# node 744: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 739
# node 745: type: TNT_STMT
# child SEQ_CUR for node 745
# node 746: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 746
# node 747: type: TNT_ARG
# child SEQ_CUR for node 747
# node 748: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 745
# node 749: type: TNT_STMT
# child SEQ_CUR for node 749
# node 750: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 750
# node 751: type: TNT_ARG
# child SEQ_CUR for node 751
# node 752: type: TNT_CALL sym: sig0
# child CALL_ARGS for node 752
# node 753: type: TNT_ARG
# child SEQ_CUR for node 753
# node 754: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 749
# node 755: type: TNT_STMT
# child SEQ_CUR for node 755
# node 756: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 756
# node 757: type: TNT_ARG
# child SEQ_CUR for node 757
# node 758: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 755
# node 759: type: TNT_STMT
# child SEQ_CUR for node 759
# node 760: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 760
# node 761: type: TNT_ARG
# child SEQ_CUR for node 761
# node 762: type: TNT_CALL sym: sig0
# child CALL_ARGS for node 762
# node 763: type: TNT_ARG
# child SEQ_CUR for node 763
# node 764: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 759
# node 765: type: TNT_STMT
# child SEQ_CUR for node 765
# node 766: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 766
# node 767: type: TNT_ARG
# child SEQ_CUR for node 767
# node 768: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 713
# node 769: type: TNT_STMT
# child SEQ_CUR for node 769
# node 770: type: TNT_PRINTF
# child PRINTF_TREE for node 770
# node 771: type: TNT_STMT
# child SEQ_CUR for node 771
# node 772: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 772
# node 773: type: TNT_ARG
# child SEQ_CUR for node 773
# node 774: type: TNT_STRCON str: "sig1: "
# child SEQ_NEXT for node 771
# node 775: type: TNT_STMT
# child SEQ_CUR for node 775
# node 776: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 776
# node 777: type: TNT_ARG
# child SEQ_CUR for node 777
# node 778: type: TNT_CALL sym: sig1
# child CALL_ARGS for node 778
# node 779: type: TNT_ARG
# child SEQ_CUR for node 779
# node 780: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 775
# node 781: type: TNT_STMT
# child SEQ_CUR for node 781
# node 782: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 782
# node 783: type: TNT_ARG
# child SEQ_CUR for node 783
# node 784: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 781
# node 785: type: TNT_STMT
# child SEQ_CUR for node 785
# node 786: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 786
# node 787: type: TNT_ARG
# child SEQ_CUR for node 787
# node 788: type: TNT_CALL sym: sig1
# child CALL_ARGS for node 788
# node 789: type: TNT_ARG
# child SEQ_CUR for node 789
# node 790: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 785
# node 791: type: TNT_STMT
# child SEQ_CUR for node 791
# node 792: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 792
# node 793: type: TNT_ARG
# child SEQ_CUR for node 793
# node 794: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 791
# node 795: type: TNT_STMT
# child SEQ_CUR for node 795
# node 796: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 796
# node 797: type: TNT_ARG
# child SEQ_CUR for node 797
# node 798: type: TNT_CALL sym: sig1
# child CALL_ARGS for node 798
# node 799: type: TNT_ARG
# child SEQ_CUR for node 799
# node 800: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 795
# node 801: type: TNT_STMT
# child SEQ_CUR for node 801
# node 802: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 802
# node 803: type: TNT_ARG
# child SEQ_CUR for node 803
# node 804: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 801
# node 805: type: TNT_STMT
# child SEQ_CUR for node 805
# node 806: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 806
# node 807: type: TNT_ARG
# child SEQ_CUR for node 807
# node 808: type: TNT_CALL sym: sig1
# child CALL_ARGS for node 808
# node 809: type: TNT_ARG
# child SEQ_CUR for node 809
# node 810: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 805
# node 811: type: TNT_STMT
# child SEQ_CUR for node 811
# node 812: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 812
# node 813: type: TNT_ARG
# child SEQ_CUR for node 813
# node 814: type: TNT_STRCON str: ", "
# child SEQ_NEXT for node 811
# node 815: type: TNT_STMT
# child SEQ_CUR for node 815
# node 816: type: TNT_CALL sym: _print_int
# child CALL_ARGS for node 816
# node 817: type: TNT_ARG
# child SEQ_CUR for node 817
# node 818: type: TNT_CALL sym: sig1
# child CALL_ARGS for node 818
# node 819: type: TNT_ARG
# child SEQ_CUR for node 819
# node 820: type: TNT_SYMBOL sym: e
# child SEQ_NEXT for node 815
# node 821: type: TNT_STMT
# child SEQ_CUR for node 821
# node 822: type: TNT_CALL sym: _print_string
# child CALL_ARGS for node 822
# node 823: type: TNT_ARG
# child SEQ_CUR for node 823
# node 824: type: TNT_STRCON str: "\n"
# child SEQ_NEXT for node 769
# node 825: type: TNT_STMT
# child SEQ_CUR for node 825
# node 826: type: TNT_RET
# child RET_EXPR for node 826
# node 827: type: TNT_INTCON val: 0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: rotl
#-----------------------------------------------------------------------------
# temps used:    5
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
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
# CNT_SLLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
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
# src1 -> ST_INTCON (32)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: rotr
#-----------------------------------------------------------------------------
# temps used:    5
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
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
# CNT_SRLV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
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
# src1 -> ST_INTCON (32)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_SLLV
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: ch
#-----------------------------------------------------------------------------
# temps used:    4
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
# CNT_AND
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
# CNT_NOT
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: maj
#-----------------------------------------------------------------------------
# temps used:    4
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
# CNT_AND
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
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (1)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: ep0
#-----------------------------------------------------------------------------
# temps used:    2
# svregs used:   2
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
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
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SVTEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (13)
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
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_XOR
# ------
# dest -> ST_SVTEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (22)
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
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (1)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: ep1
#-----------------------------------------------------------------------------
# temps used:    2
# svregs used:   2
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (6)
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
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SVTEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (11)
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
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_XOR
# ------
# dest -> ST_SVTEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (25)
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
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (1)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: sig0
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   1
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (7)
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
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SVTEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (18)
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
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: sig1
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   1
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (17)
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
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SVTEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (19)
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
# src1 -> ST_FUNCTION (rotr)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_INTCON (10)
# |
# >
# CNT_SRLV
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_XOR
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  3
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
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
# src1 -> ST_INTCON (1)
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
# src1 -> ST_INTCON (-1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (c)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (305419896)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (d)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (-1698898192)
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
# src1 -> ST_STRCON ("rotr: ")
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
# src1 -> ST_FUNCTION (rotr)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (rotr)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_INTCON (18)
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
# src1 -> ST_FUNCTION (rotr)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_INTCON (25)
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
# src1 -> ST_FUNCTION (rotr)
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
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("rotr: ")
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
# src1 -> ST_FUNCTION (rotr)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (_print_string)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (b)
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
# src1 -> ST_FUNCTION (rotr)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (_print_string)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (18)
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
# src1 -> ST_FUNCTION (rotr)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (_print_string)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (25)
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
# src1 -> ST_FUNCTION (rotr)
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
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("rotr: ")
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
# src1 -> ST_FUNCTION (rotr)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (rotr)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_INTCON (18)
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
# src1 -> ST_FUNCTION (rotr)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_INTCON (25)
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
# src1 -> ST_FUNCTION (rotr)
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
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("rotr: ")
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
# src1 -> ST_FUNCTION (rotr)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (rotr)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_INTCON (18)
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
# src1 -> ST_FUNCTION (rotr)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_INTCON (25)
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
# src1 -> ST_FUNCTION (rotr)
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
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("rotr: ")
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
# src1 -> ST_FUNCTION (rotr)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (_print_string)
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
# src1 -> ST_FUNCTION (rotr)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (_print_string)
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
# src1 -> ST_INTCON (18)
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
# src1 -> ST_FUNCTION (rotr)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (_print_string)
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
# src1 -> ST_INTCON (25)
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
# src1 -> ST_FUNCTION (rotr)
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
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("rotl: ")
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
# src1 -> ST_FUNCTION (rotl)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (rotl)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_INTCON (9)
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
# src1 -> ST_FUNCTION (rotl)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_INTCON (16)
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
# src1 -> ST_FUNCTION (rotl)
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
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("rotl: ")
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
# src1 -> ST_FUNCTION (rotl)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (_print_string)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (b)
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
# src1 -> ST_FUNCTION (rotl)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (_print_string)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (9)
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
# src1 -> ST_FUNCTION (rotl)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (_print_string)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (b)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (16)
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
# src1 -> ST_FUNCTION (rotl)
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
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("rotl: ")
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
# src1 -> ST_FUNCTION (rotl)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (rotl)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_INTCON (9)
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
# src1 -> ST_FUNCTION (rotl)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_INTCON (16)
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
# src1 -> ST_FUNCTION (rotl)
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
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("rotl: ")
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
# src1 -> ST_FUNCTION (rotl)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (rotl)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_INTCON (9)
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
# src1 -> ST_FUNCTION (rotl)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_INTCON (16)
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
# src1 -> ST_FUNCTION (rotl)
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
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("rotl: ")
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
# src1 -> ST_FUNCTION (rotl)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (_print_string)
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
# src1 -> ST_FUNCTION (rotl)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (_print_string)
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
# src1 -> ST_INTCON (9)
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
# src1 -> ST_FUNCTION (rotl)
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
# src1 -> ST_FUNCTION (_print_int)
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
# src1 -> ST_FUNCTION (_print_string)
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
# src1 -> ST_INTCON (16)
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
# src1 -> ST_FUNCTION (rotl)
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
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("ch:   ")
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
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (e)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (2)
# src1 -> ST_TEMP (2)
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
# src1 -> ST_FUNCTION (ch)
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
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("maj:  ")
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
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (e)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (2)
# src1 -> ST_TEMP (2)
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
# src1 -> ST_FUNCTION (maj)
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
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("ep0:  ")
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (ep0)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (ep0)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (ep0)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (ep0)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (ep0)
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
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("ep1:  ")
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (ep1)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (ep1)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (ep1)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (ep1)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (ep1)
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
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("sig0: ")
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sig0)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sig0)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sig0)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sig0)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sig0)
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
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("sig1: ")
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sig1)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sig1)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sig1)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sig1)
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
# src1 -> ST_FUNCTION (_print_int)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sig1)
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
# src1 -> ST_INTCON (0)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)

.data

  _str0:
    .asciiz "rotr: "
    .align 2

  _str1:
    .asciiz ", "
    .align 2

  _str2:
    .asciiz "\n"
    .align 2

  _str3:
    .asciiz "rotl: "
    .align 2

  _str4:
    .asciiz "ch:   "
    .align 2

  _str5:
    .asciiz "maj:  "
    .align 2

  _str6:
    .asciiz "ep0:  "
    .align 2

  _str7:
    .asciiz "ep1:  "
    .align 2

  _str8:
    .asciiz "sig0: "
    .align 2

  _str9:
    .asciiz "sig1: "
    .align 2

.text

_rotl:

  # |--------------------------------|
  # |         <b is in $a1>          |
  # |--------------------------------| sp+4
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack
  la $sp, -0($sp)

  move $t0, $a0
  move $t1, $a1
  sllv $t2, $t0, $t1
  move $t0, $a0
  li $t1, 32
  move $t3, $a1
  sub $t4, $t1, $t3
  srlv $t1, $t0, $t4
  or $t0, $t2, $t1
  move $v0, $t0
  j __leave_rotl

__leave_rotl:
  la $sp, 0($sp)
  jr $ra

_rotr:

  # |--------------------------------|
  # |         <b is in $a1>          |
  # |--------------------------------| sp+4
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack
  la $sp, -0($sp)

  move $t0, $a0
  move $t1, $a1
  srlv $t2, $t0, $t1
  move $t0, $a0
  li $t1, 32
  move $t3, $a1
  sub $t4, $t1, $t3
  sllv $t1, $t0, $t4
  or $t0, $t2, $t1
  move $v0, $t0
  j __leave_rotr

__leave_rotr:
  la $sp, 0($sp)
  jr $ra

_ch:

  # |--------------------------------|
  # |         <z is in $a2>          |
  # |--------------------------------| sp+8
  # |         <y is in $a1>          |
  # |--------------------------------| sp+4
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack
  la $sp, -0($sp)

  move $t0, $a0
  move $t1, $a1
  and $t2, $t0, $t1
  move $t0, $a0
  not $t1, $t0
  move $t0, $a2
  and $t3, $t1, $t0
  xor $t0, $t2, $t3
  move $v0, $t0
  j __leave_ch

__leave_ch:
  la $sp, 0($sp)
  jr $ra

_maj:

  # |--------------------------------|
  # |         <z is in $a2>          |
  # |--------------------------------| sp+8
  # |         <y is in $a1>          |
  # |--------------------------------| sp+4
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack
  la $sp, -0($sp)

  move $t0, $a0
  move $t1, $a1
  and $t2, $t0, $t1
  move $t0, $a0
  move $t1, $a2
  and $t3, $t0, $t1
  xor $t0, $t2, $t3
  move $t1, $a1
  move $t2, $a2
  and $t3, $t1, $t2
  xor $t1, $t0, $t3
  move $v0, $t1
  j __leave_maj

__leave_maj:
  la $sp, 0($sp)
  jr $ra

_ep0:

  # |--------------------------------|
  # |               x                |
  # |--------------------------------| sp+32  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |              $ra               |
  # |--------------------------------| sp+24
  # |              $s1               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 24($sp)
  sw $a0, 32($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)

  lw $t0, 32($sp)
  li $t1, 2
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $s0, $v0
  lw $t0, 32($sp)
  li $t1, 13
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $s1, $s0, $t0
  lw $t0, 32($sp)
  li $t1, 22
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $t1, $s1, $t0
  move $v0, $t1
  j __leave_ep0

__leave_ep0:
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  lw $ra, 24($sp)
  la $sp, 32($sp)
  jr $ra

_ep1:

  # |--------------------------------|
  # |               x                |
  # |--------------------------------| sp+32  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |              $ra               |
  # |--------------------------------| sp+24
  # |              $s1               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 24($sp)
  sw $a0, 32($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)

  lw $t0, 32($sp)
  li $t1, 6
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $s0, $v0
  lw $t0, 32($sp)
  li $t1, 11
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $s1, $s0, $t0
  lw $t0, 32($sp)
  li $t1, 25
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $t1, $s1, $t0
  move $v0, $t1
  j __leave_ep1

__leave_ep1:
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  lw $ra, 24($sp)
  la $sp, 32($sp)
  jr $ra

_sig0:

  # |--------------------------------|
  # |               x                |
  # |--------------------------------| sp+24  <-- start of caller's stack
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $s0, 16($sp)

  lw $t0, 24($sp)
  li $t1, 7
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $s0, $v0
  lw $t0, 24($sp)
  li $t1, 18
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $t1, $s0, $t0
  lw $t0, 24($sp)
  li $t2, 3
  srlv $t3, $t0, $t2
  xor $t0, $t1, $t3
  move $v0, $t0
  j __leave_sig0

__leave_sig0:
  lw $s0, 16($sp)
  lw $ra, 20($sp)
  la $sp, 24($sp)
  jr $ra

_sig1:

  # |--------------------------------|
  # |               x                |
  # |--------------------------------| sp+24  <-- start of caller's stack
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $s0, 16($sp)

  lw $t0, 24($sp)
  li $t1, 17
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $s0, $v0
  lw $t0, 24($sp)
  li $t1, 19
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $t1, $s0, $t0
  lw $t0, 24($sp)
  li $t2, 10
  srlv $t3, $t0, $t2
  xor $t0, $t1, $t3
  move $v0, $t0
  j __leave_sig1

__leave_sig1:
  lw $s0, 16($sp)
  lw $ra, 20($sp)
  la $sp, 24($sp)
  jr $ra

main:

  # |--------------------------------|
  # |           <padding>            |
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
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -48($sp)
  sw $ra, 16($sp)

  li $t0, 0
  sw $t0, 24($sp)
  li $t0, 1
  sw $t0, 28($sp)
  li $t0, -1
  sw $t0, 32($sp)
  li $t0, 305419896
  sw $t0, 36($sp)
  li $t0, -1698898192
  sw $t0, 40($sp)
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 18
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 25
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 18
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 25
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 18
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 25
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 18
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 25
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 18
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 25
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 9
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 16
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 9
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 16
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 9
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 16
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 9
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 16
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 9
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 16
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str4
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  lw $t1, 32($sp)
  lw $t2, 40($sp)
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _ch
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str5
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  lw $t1, 32($sp)
  lw $t2, 40($sp)
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _maj
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str6
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal _ep0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  move $a0, $t0
  jal _ep0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  move $a0, $t0
  jal _ep0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  move $a0, $t0
  jal _ep0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  move $a0, $t0
  jal _ep0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str7
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal _ep1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  move $a0, $t0
  jal _ep1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  move $a0, $t0
  jal _ep1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  move $a0, $t0
  jal _ep1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  move $a0, $t0
  jal _ep1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str8
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal _sig0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  move $a0, $t0
  jal _sig0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  move $a0, $t0
  jal _sig0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  move $a0, $t0
  jal _sig0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  move $a0, $t0
  jal _sig0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str9
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal _sig1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  move $a0, $t0
  jal _sig1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  move $a0, $t0
  jal _sig1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  move $a0, $t0
  jal _sig1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  move $a0, $t0
  jal _sig1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  li $t0, 0
  move $v0, $t0
  j __leavemain

__leavemain:
  lw $ra, 16($sp)
  la $sp, 48($sp)
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
