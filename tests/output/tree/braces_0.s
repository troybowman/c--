#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 1
# sym: main
#   line: 3
#   type: ST_FUNCTION
#     rt_type: RT_INT
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 2
# sym: x
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 6
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x32
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_NEXT for node 1
# node 2: type: TNT_STMT
# child SEQ_CUR for node 2
# node 3: type: TNT_STMT
# child SEQ_CUR for node 3
# node 4: type: TNT_STMT
# child SEQ_CUR for node 4
# node 5: type: TNT_STMT
# child SEQ_NEXT for node 2
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_STMT
# child SEQ_CUR for node 8
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_STMT
# child SEQ_CUR for node 10
# node 11: type: TNT_IF
# child IF_COND for node 11
# node 12: type: TNT_EQ
# child LHS for node 12
# node 13: type: TNT_SYMBOL sym: x
# child RHS for node 12
# node 14: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 14
# node 15: type: TNT_INTCON val: 13
# child IF_BODY for node 11
# node 16: type: TNT_RET
# child RET_EXPR for node 16
# node 17: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 7
# node 18: type: TNT_STMT
# child SEQ_CUR for node 18
# node 19: type: TNT_RET
# child RET_EXPR for node 19
# node 20: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 6
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_STMT
# child SEQ_CUR for node 22
# node 23: type: TNT_RET
# child RET_EXPR for node 23
# node 24: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 22
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_STMT
# child SEQ_CUR for node 26
# node 27: type: TNT_RET
# child RET_EXPR for node 27
# node 28: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 26
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_STMT
# child SEQ_CUR for node 30
# node 31: type: TNT_RET
# child RET_EXPR for node 31
# node 32: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 21
# node 33: type: TNT_STMT
# child SEQ_CUR for node 33
# node 34: type: TNT_IF
# child IF_COND for node 34
# node 35: type: TNT_LT
# child LHS for node 35
# node 36: type: TNT_INTCON val: 3
# child RHS for node 35
# node 37: type: TNT_INTCON val: 4
# child IF_BODY for node 34
# node 38: type: TNT_STMT
# child SEQ_CUR for node 38
# node 39: type: TNT_STMT
# child IF_ELSE for node 34
# node 40: type: TNT_STMT
# child SEQ_CUR for node 40
# node 41: type: TNT_STMT
# child SEQ_CUR for node 41
# node 42: type: TNT_STMT
# child SEQ_CUR for node 42
# node 43: type: TNT_ASSG
# child LHS for node 43
# node 44: type: TNT_SYMBOL sym: x
# child RHS for node 43
# node 45: type: TNT_SYMBOL sym: x
# c-- exited with code: 0