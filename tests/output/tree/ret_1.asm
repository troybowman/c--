#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 3
# sym: x
#   line: 3
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x5
# sym: func1
#   line: 5
#   type: ST_FUNCTION
#     rt_type: RT_INT
#     params:
#       0: argc
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: argv
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
# sym: func2
#   line: 15
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func1
#-----------------------------------------------------------------------------
# size: 4
# sym: argc
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: argv
#   line: 5
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: y
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: z
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: func1
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 1
# node 4: type: TNT_STMT
# child SEQ_CUR for node 4
# node 5: type: TNT_RET
# child RET_EXPR for node 5
# node 6: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 6
# node 7: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 4
# node 8: type: TNT_STMT
# child SEQ_CUR for node 8
# node 9: type: TNT_RET
# child RET_EXPR for node 9
# node 10: type: TNT_SYMBOL sym: argc
# child SEQ_NEXT for node 8
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_RET
# child RET_EXPR for node 12
# node 13: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 13
# node 14: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 11
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_RET
# child RET_EXPR for node 16
# node 17: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 17
# node 18: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 18
# node 19: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 19
# node 20: type: TNT_SYMBOL sym: z
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func2
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: func2
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child SEQ_NEXT for node 1
# node 3: type: TNT_STMT
# child SEQ_CUR for node 3
# node 4: type: TNT_RET
# child SEQ_NEXT for node 3
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 7
# node 8: type: TNT_INTCON val: 0
# child RHS for node 6
# node 9: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 5
# node 10: type: TNT_STMT
# child SEQ_CUR for node 10
# node 11: type: TNT_RET
