#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 3
# sym: x
#   line: 1
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x6
# sym: func1
#   line: 3
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: main
#   line: 9
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: x
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func1
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: func1
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 3
# node 4: type: TNT_INTCON val: 0
# child RHS for node 2
# node 5: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 8
# node 9: type: TNT_INTCON val: 1
# child RHS for node 7
# node 10: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 6
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_ASSG
# child LHS for node 12
# node 13: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 13
# node 14: type: TNT_INTCON val: 2
# child RHS for node 12
# node 15: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 11
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_ASSG
# child LHS for node 17
# node 18: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 18
# node 19: type: TNT_INTCON val: 3
# child RHS for node 17
# node 20: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 16
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_ASSG
# child LHS for node 22
# node 23: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 23
# node 24: type: TNT_INTCON val: 4
# child RHS for node 22
# node 25: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 21
# node 26: type: TNT_STMT
# child SEQ_CUR for node 26
# node 27: type: TNT_ASSG
# child LHS for node 27
# node 28: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 28
# node 29: type: TNT_INTCON val: 5
# child RHS for node 27
# node 30: type: TNT_INTCON val: 6
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 9
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 3
# node 4: type: TNT_INTCON val: 0
# child RHS for node 2
# node 5: type: TNT_CHARCON str: 'h'
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 8
# node 9: type: TNT_INTCON val: 1
# child RHS for node 7
# node 10: type: TNT_CHARCON str: 'e'
# child SEQ_NEXT for node 6
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_ASSG
# child LHS for node 12
# node 13: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 13
# node 14: type: TNT_INTCON val: 2
# child RHS for node 12
# node 15: type: TNT_CHARCON str: 'l'
# child SEQ_NEXT for node 11
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_ASSG
# child LHS for node 17
# node 18: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 18
# node 19: type: TNT_INTCON val: 3
# child RHS for node 17
# node 20: type: TNT_CHARCON str: 'l'
# child SEQ_NEXT for node 16
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_ASSG
# child LHS for node 22
# node 23: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 23
# node 24: type: TNT_INTCON val: 4
# child RHS for node 22
# node 25: type: TNT_CHARCON str: 'o'
