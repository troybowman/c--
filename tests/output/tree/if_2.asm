#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 2
# sym: boring
#   line: 3
#   type: ST_FUNCTION
#     rt_type: RT_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: main
#   line: 5
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: boring
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: boring
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
# sym: s
#   line: 8
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xa
# sym: x
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_IF
# child IF_COND for node 2
# node 3: type: TNT_AND
# child LHS for node 3
# node 4: type: TNT_LT
# child LHS for node 4
# node 5: type: TNT_INTCON val: 3
# child RHS for node 4
# node 6: type: TNT_INTCON val: 4
# child RHS for node 3
# node 7: type: TNT_LT
# child LHS for node 7
# node 8: type: TNT_INTCON val: 5
# child RHS for node 7
# node 9: type: TNT_INTCON val: 6
# child SEQ_NEXT for node 1
# node 10: type: TNT_STMT
# child SEQ_CUR for node 10
# node 11: type: TNT_IF
# child IF_COND for node 11
# node 12: type: TNT_NOT
# child RHS for node 12
# node 13: type: TNT_LT
# child LHS for node 13
# node 14: type: TNT_INTCON val: 3
# child RHS for node 13
# node 15: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 10
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_IF
# child IF_COND for node 17
# node 18: type: TNT_AND
# child LHS for node 18
# node 19: type: TNT_GT
# child LHS for node 19
# node 20: type: TNT_SYMBOL sym: x
# child RHS for node 19
# node 21: type: TNT_INTCON val: 0
# child RHS for node 18
# node 22: type: TNT_NEQ
# child LHS for node 22
# node 23: type: TNT_SYMBOL sym: x
# child RHS for node 22
# node 24: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 24
# node 25: type: TNT_SYMBOL sym: x
# child IF_ELSE for node 17
# node 26: type: TNT_IF
# child IF_COND for node 26
# node 27: type: TNT_OR
# child LHS for node 27
# node 28: type: TNT_EQ
# child LHS for node 28
# node 29: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 29
# node 30: type: TNT_INTCON val: 0
# child RHS for node 28
# node 31: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 31
# node 32: type: TNT_INTCON val: 1
# child RHS for node 27
# node 33: type: TNT_AND
# child LHS for node 33
# node 34: type: TNT_EQ
# child LHS for node 34
# node 35: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 35
# node 36: type: TNT_INTCON val: 1
# child RHS for node 34
# node 37: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 37
# node 38: type: TNT_INTCON val: 2
# child RHS for node 33
# node 39: type: TNT_NEQ
# child LHS for node 39
# node 40: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 40
# node 41: type: TNT_INTCON val: 2
# child RHS for node 39
# node 42: type: TNT_SYMBOL sym: x
# child IF_ELSE for node 26
# node 43: type: TNT_IF
# child IF_COND for node 43
# node 44: type: TNT_NOT
# child RHS for node 44
# node 45: type: TNT_AND
# child LHS for node 45
# node 46: type: TNT_AND
# child LHS for node 46
# node 47: type: TNT_LT
# child LHS for node 47
# node 48: type: TNT_CALL sym: boring
# child CALL_ARGS for node 48
# node 49: type: TNT_ARG
# child SEQ_CUR for node 49
# node 50: type: TNT_INTCON val: 0
# child RHS for node 47
# node 51: type: TNT_CALL sym: boring
# child CALL_ARGS for node 51
# node 52: type: TNT_ARG
# child SEQ_CUR for node 52
# node 53: type: TNT_INTCON val: 1
# child RHS for node 46
# node 54: type: TNT_LT
# child LHS for node 54
# node 55: type: TNT_CALL sym: boring
# child CALL_ARGS for node 55
# node 56: type: TNT_ARG
# child SEQ_CUR for node 56
# node 57: type: TNT_INTCON val: 2
# child RHS for node 54
# node 58: type: TNT_CALL sym: boring
# child CALL_ARGS for node 58
# node 59: type: TNT_ARG
# child SEQ_CUR for node 59
# node 60: type: TNT_INTCON val: 3
# child RHS for node 45
# node 61: type: TNT_EQ
# child LHS for node 61
# node 62: type: TNT_SYMBOL sym: x
# child RHS for node 61
# node 63: type: TNT_CALL sym: boring
# child CALL_ARGS for node 63
# node 64: type: TNT_ARG
# child SEQ_CUR for node 64
# node 65: type: TNT_INTCON val: 4
# c-- exited with code: 0
