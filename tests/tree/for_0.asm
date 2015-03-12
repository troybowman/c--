#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 2
# sym: char_at
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: string
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: idx
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
# LOCAL SYMBOLS FOR FUNCTION: char_at
#-----------------------------------------------------------------------------
# size: 2
# sym: string
#   line: 3
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: idx
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
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
# sym: x
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_FOR
# child FOR_BODY for node 2
# node 3: type: TNT_ASSG
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: x
# child RHS for node 3
# node 5: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_FOR
# child FOR_INIT for node 7
# node 8: type: TNT_ASSG
# child LHS for node 8
# node 9: type: TNT_SYMBOL sym: x
# child RHS for node 8
# node 10: type: TNT_INTCON val: 0
# child FOR_COND for node 7
# node 11: type: TNT_LT
# child LHS for node 11
# node 12: type: TNT_SYMBOL sym: x
# child RHS for node 11
# node 13: type: TNT_INTCON val: 10
# child FOR_INC for node 7
# node 14: type: TNT_ASSG
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: x
# child RHS for node 14
# node 16: type: TNT_INTCON val: 5
# child FOR_BODY for node 7
# node 17: type: TNT_ASSG
# child LHS for node 17
# node 18: type: TNT_SYMBOL sym: x
# child RHS for node 17
# node 19: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 19
# node 20: type: TNT_ARG
# child SEQ_CUR for node 20
# node 21: type: TNT_STRCON str: "test"
# child SEQ_NEXT for node 20
# node 22: type: TNT_ARG
# child SEQ_CUR for node 22
# node 23: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 6
# node 24: type: TNT_STMT
# child SEQ_CUR for node 24
# node 25: type: TNT_FOR
# child FOR_COND for node 25
# node 26: type: TNT_LT
# child LHS for node 26
# node 27: type: TNT_SYMBOL sym: x
# child RHS for node 26
# node 28: type: TNT_INTCON val: 10
# child FOR_BODY for node 25
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_ASSG
# child LHS for node 30
# node 31: type: TNT_SYMBOL sym: x
# child RHS for node 30
# node 32: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 32
# node 33: type: TNT_ARG
# child SEQ_CUR for node 33
# node 34: type: TNT_STRCON str: "test"
# child SEQ_NEXT for node 33
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 29
# node 37: type: TNT_STMT
# child SEQ_CUR for node 37
# node 38: type: TNT_RET
