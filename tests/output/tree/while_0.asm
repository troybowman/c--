#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 1
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
# size: 1
# sym: x
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_WHILE
# child WHILE_COND for node 2
# node 3: type: TNT_GT
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: x
# child RHS for node 3
# node 5: type: TNT_INTCON val: 0
# child WHILE_BODY for node 2
# node 6: type: TNT_CALL sym: main
# child SEQ_NEXT for node 1
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_WHILE
# child WHILE_COND for node 8
# node 9: type: TNT_OR
# child LHS for node 9
# node 10: type: TNT_EQ
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: x
# child RHS for node 10
# node 12: type: TNT_INTCON val: 0
# child RHS for node 9
# node 13: type: TNT_EQ
# child LHS for node 13
# node 14: type: TNT_SYMBOL sym: x
# child RHS for node 13
# node 15: type: TNT_INTCON val: 6
# child WHILE_BODY for node 8
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_IF
# child IF_COND for node 17
# node 18: type: TNT_LT
# child LHS for node 18
# node 19: type: TNT_SYMBOL sym: x
# child RHS for node 18
# node 20: type: TNT_INTCON val: 1
# child IF_BODY for node 17
# node 21: type: TNT_WHILE
# child WHILE_COND for node 21
# node 22: type: TNT_EQ
# child LHS for node 22
# node 23: type: TNT_INTCON val: 4
# child RHS for node 22
# node 24: type: TNT_INTCON val: 5
# child WHILE_BODY for node 21
# node 25: type: TNT_RET
