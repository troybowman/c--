#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 2
# sym: sum
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
# sym: main
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: sum
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
# SYNTAX TREE FOR FUNCTION: sum
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
# size: 2
# sym: x
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 8
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xa
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: x
# child RHS for node 2
# node 4: type: TNT_PLUS
# child LHS for node 4
# node 5: type: TNT_INTCON val: 1
# child RHS for node 4
# node 6: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 1
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_ASSG
# child LHS for node 8
# node 9: type: TNT_SYMBOL sym: x
# child RHS for node 8
# node 10: type: TNT_MINUS
# child LHS for node 10
# node 11: type: TNT_INTCON val: 2
# child RHS for node 10
# node 12: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 7
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_ASSG
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: x
# child RHS for node 14
# node 16: type: TNT_MULT
# child LHS for node 16
# node 17: type: TNT_INTCON val: 4
# child RHS for node 16
# node 18: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 13
# node 19: type: TNT_STMT
# child SEQ_CUR for node 19
# node 20: type: TNT_ASSG
# child LHS for node 20
# node 21: type: TNT_SYMBOL sym: x
# child RHS for node 20
# node 22: type: TNT_DIV
# child LHS for node 22
# node 23: type: TNT_INTCON val: 6
# child RHS for node 22
# node 24: type: TNT_INTCON val: 7
# child SEQ_NEXT for node 19
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_ASSG
# child LHS for node 26
# node 27: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 27
# node 28: type: TNT_INTCON val: 0
# child RHS for node 26
# node 29: type: TNT_PLUS
# child LHS for node 29
# node 30: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 30
# node 31: type: TNT_INTCON val: 1
# child RHS for node 29
# node 32: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 32
# node 33: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 25
# node 34: type: TNT_STMT
# child SEQ_CUR for node 34
# node 35: type: TNT_ASSG
# child LHS for node 35
# node 36: type: TNT_SYMBOL sym: x
# child RHS for node 35
# node 37: type: TNT_DIV
# child LHS for node 37
# node 38: type: TNT_CALL sym: sum
# child CALL_ARGS for node 38
# node 39: type: TNT_ARG
# child SEQ_CUR for node 39
# node 40: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 40
# node 41: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 39
# node 42: type: TNT_ARG
# child SEQ_CUR for node 42
# node 43: type: TNT_SYMBOL sym: x
# child RHS for node 37
# node 44: type: TNT_CALL sym: sum
# child CALL_ARGS for node 44
# node 45: type: TNT_ARG
# child SEQ_CUR for node 45
# node 46: type: TNT_INTCON val: 150
# child SEQ_NEXT for node 45
# node 47: type: TNT_ARG
# child SEQ_CUR for node 47
# node 48: type: TNT_INTCON val: 777
