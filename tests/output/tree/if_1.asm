#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 1
# sym: main
#   line: 3
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: arg
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 2
# sym: arg
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: x
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_IF
# child IF_COND for node 2
# node 3: type: TNT_EQ
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: arg
# child RHS for node 3
# node 5: type: TNT_INTCON val: 1
# child IF_BODY for node 2
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: x
# child RHS for node 6
# node 8: type: TNT_CHARCON str: 'a'
# child IF_ELSE for node 2
# node 9: type: TNT_IF
# child IF_COND for node 9
# node 10: type: TNT_EQ
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: arg
# child RHS for node 10
# node 12: type: TNT_INTCON val: 2
# child IF_BODY for node 9
# node 13: type: TNT_ASSG
# child LHS for node 13
# node 14: type: TNT_SYMBOL sym: x
# child RHS for node 13
# node 15: type: TNT_CHARCON str: 'b'
# child IF_ELSE for node 9
# node 16: type: TNT_IF
# child IF_COND for node 16
# node 17: type: TNT_EQ
# child LHS for node 17
# node 18: type: TNT_SYMBOL sym: arg
# child RHS for node 17
# node 19: type: TNT_INTCON val: 3
# child IF_BODY for node 16
# node 20: type: TNT_ASSG
# child LHS for node 20
# node 21: type: TNT_SYMBOL sym: x
# child RHS for node 20
# node 22: type: TNT_CHARCON str: 'c'
# child IF_ELSE for node 16
# node 23: type: TNT_ASSG
# child LHS for node 23
# node 24: type: TNT_SYMBOL sym: x
# child RHS for node 23
# node 25: type: TNT_CHARCON str: 'z'
# child SEQ_NEXT for node 1
# node 26: type: TNT_STMT
# child SEQ_CUR for node 26
# node 27: type: TNT_IF
# child IF_COND for node 27
# node 28: type: TNT_EQ
# child LHS for node 28
# node 29: type: TNT_SYMBOL sym: arg
# child RHS for node 28
# node 30: type: TNT_INTCON val: 1
# child IF_BODY for node 27
# node 31: type: TNT_ASSG
# child LHS for node 31
# node 32: type: TNT_SYMBOL sym: x
# child RHS for node 31
# node 33: type: TNT_CHARCON str: 'a'
# child IF_ELSE for node 27
# node 34: type: TNT_STMT
# child SEQ_CUR for node 34
# node 35: type: TNT_IF
# child IF_COND for node 35
# node 36: type: TNT_EQ
# child LHS for node 36
# node 37: type: TNT_SYMBOL sym: arg
# child RHS for node 36
# node 38: type: TNT_INTCON val: 2
# child IF_BODY for node 35
# node 39: type: TNT_ASSG
# child LHS for node 39
# node 40: type: TNT_SYMBOL sym: x
# child RHS for node 39
# node 41: type: TNT_CHARCON str: 'b'
# child IF_ELSE for node 35
# node 42: type: TNT_STMT
# child SEQ_CUR for node 42
# node 43: type: TNT_IF
# child IF_COND for node 43
# node 44: type: TNT_EQ
# child LHS for node 44
# node 45: type: TNT_SYMBOL sym: arg
# child RHS for node 44
# node 46: type: TNT_INTCON val: 3
# child IF_BODY for node 43
# node 47: type: TNT_ASSG
# child LHS for node 47
# node 48: type: TNT_SYMBOL sym: x
# child RHS for node 47
# node 49: type: TNT_CHARCON str: 'c'
# child IF_ELSE for node 43
# node 50: type: TNT_STMT
# child SEQ_CUR for node 50
# node 51: type: TNT_ASSG
# child LHS for node 51
# node 52: type: TNT_SYMBOL sym: x
# child RHS for node 51
# node 53: type: TNT_CHARCON str: 'z'
# c-- exited with code: 0
