#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 8
# sym: char_at
#   line: 13
#   type: ST_FUNCTION
#     rt_type: RT_CHAR
#     params:
#       0: string
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: idx
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: main
#   line: 25
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: print_int
#   line: 22
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: set_x
#   line: 19
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: x1
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: x2
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       2: x3
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       3: x4
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       4: x5
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: x
#   line: 3
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x5
# sym: x_at
#   line: 7
#   type: ST_FUNCTION
#     rt_type: RT_INT
#     params:
#       0: idx
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: y
#   line: 4
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x5
# sym: y_at
#   line: 10
#   type: ST_FUNCTION
#     rt_type: RT_CHAR
#     params:
#       0: idx
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: x_at
#-----------------------------------------------------------------------------
# size: 1
# sym: idx
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: x_at
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 3
# node 4: type: TNT_SYMBOL sym: idx
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: y_at
#-----------------------------------------------------------------------------
# size: 1
# sym: idx
#   line: 10
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: y_at
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 3
# node 4: type: TNT_SYMBOL sym: idx
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: char_at
#-----------------------------------------------------------------------------
# size: 2
# sym: idx
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: string
#   line: 13
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: char_at
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: string
# child AL_OFFSET for node 3
# node 4: type: TNT_SYMBOL sym: idx
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 1
# sym: local
#   line: 27
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: local
# child RHS for node 2
# node 4: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 4
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 1
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_ASSG
# child LHS for node 8
# node 9: type: TNT_SYMBOL sym: local
# child RHS for node 8
# node 10: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 12
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_SYMBOL sym: local
# child SEQ_NEXT for node 7
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_ASSG
# child LHS for node 16
# node 17: type: TNT_SYMBOL sym: local
# child RHS for node 16
# node 18: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 18
# node 19: type: TNT_ARG
# child SEQ_CUR for node 19
# node 20: type: TNT_CALL sym: y_at
# child CALL_ARGS for node 20
# node 21: type: TNT_ARG
# child SEQ_CUR for node 21
# node 22: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 22
# node 23: type: TNT_ARG
# child SEQ_CUR for node 23
# node 24: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 24
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_STRCON str: "hello"
# child SEQ_NEXT for node 25
# node 27: type: TNT_ARG
# child SEQ_CUR for node 27
# node 28: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 15
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_CALL sym: set_x
# child CALL_ARGS for node 30
# node 31: type: TNT_ARG
# child SEQ_CUR for node 31
# node 32: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 32
# node 33: type: TNT_ARG
# child SEQ_CUR for node 33
# node 34: type: TNT_SYMBOL sym: local
# child SEQ_NEXT for node 31
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_CALL sym: y_at
# child CALL_ARGS for node 36
# node 37: type: TNT_ARG
# child SEQ_CUR for node 37
# node 38: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 38
# node 39: type: TNT_ARG
# child SEQ_CUR for node 39
# node 40: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 35
# node 41: type: TNT_ARG
# child SEQ_CUR for node 41
# node 42: type: TNT_CHARCON str: 'a'
# child SEQ_NEXT for node 41
# node 43: type: TNT_ARG
# child SEQ_CUR for node 43
# node 44: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 44
# node 45: type: TNT_ARG
# child SEQ_CUR for node 45
# node 46: type: TNT_STRCON str: "test1"
# child SEQ_NEXT for node 45
# node 47: type: TNT_ARG
# child SEQ_CUR for node 47
# node 48: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 48
# node 49: type: TNT_ARG
# child SEQ_CUR for node 49
# node 50: type: TNT_STRCON str: "test2"
# child SEQ_NEXT for node 49
# node 51: type: TNT_ARG
# child SEQ_CUR for node 51
# node 52: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 52
# node 53: type: TNT_ARG
# child SEQ_CUR for node 53
# node 54: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 54
# node 55: type: TNT_ARG
# child SEQ_CUR for node 55
# node 56: type: TNT_STRCON str: "test3"
# child SEQ_NEXT for node 55
# node 57: type: TNT_ARG
# child SEQ_CUR for node 57
# node 58: type: TNT_SYMBOL sym: local
# child SEQ_NEXT for node 43
# node 59: type: TNT_ARG
# child SEQ_CUR for node 59
# node 60: type: TNT_INTCON val: 8675309
