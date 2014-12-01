#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 2
# sym: getint
#   line: 3
#   type: ST_FUNCTION
#     rt_type: RT_INT
#     params:
#       none
#     is_extern: no
# sym: nest
#   line: 4
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: getint
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: getint
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_INTCON val: 4
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: nest
#-----------------------------------------------------------------------------
# size: 2
# sym: x
#   line: 6
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xa
# sym: y
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: nest
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_IF
# child IF_COND for node 2
# node 3: type: TNT_EQ
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: y
# child RHS for node 3
# node 5: type: TNT_INTCON val: 6
# child IF_ELSE for node 2
# node 6: type: TNT_IF
# child IF_COND for node 6
# node 7: type: TNT_NOT
# child RHS for node 7
# node 8: type: TNT_NOT
# child RHS for node 8
# node 9: type: TNT_NOT
# child RHS for node 9
# node 10: type: TNT_LT
# child LHS for node 10
# node 11: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 11
# node 12: type: TNT_INTCON val: 10
# child RHS for node 10
# node 13: type: TNT_INTCON val: 3
# child IF_ELSE for node 6
# node 14: type: TNT_IF
# child IF_COND for node 14
# node 15: type: TNT_NOT
# child RHS for node 15
# node 16: type: TNT_NOT
# child RHS for node 16
# node 17: type: TNT_NOT
# child RHS for node 17
# node 18: type: TNT_NOT
# child RHS for node 18
# node 19: type: TNT_EQ
# child LHS for node 19
# node 20: type: TNT_SYMBOL sym: y
# child RHS for node 19
# node 21: type: TNT_INTCON val: 6
# child SEQ_NEXT for node 1
# node 22: type: TNT_STMT
# child SEQ_CUR for node 22
# node 23: type: TNT_IF
# child IF_COND for node 23
# node 24: type: TNT_AND
# child LHS for node 24
# node 25: type: TNT_AND
# child LHS for node 25
# node 26: type: TNT_AND
# child LHS for node 26
# node 27: type: TNT_LT
# child LHS for node 27
# node 28: type: TNT_SYMBOL sym: y
# child RHS for node 27
# node 29: type: TNT_INTCON val: 4
# child RHS for node 26
# node 30: type: TNT_GT
# child LHS for node 30
# node 31: type: TNT_SYMBOL sym: y
# child RHS for node 30
# node 32: type: TNT_INTCON val: 5
# child RHS for node 25
# node 33: type: TNT_EQ
# child LHS for node 33
# node 34: type: TNT_SYMBOL sym: y
# child RHS for node 33
# node 35: type: TNT_INTCON val: 6
# child RHS for node 24
# node 36: type: TNT_EQ
# child LHS for node 36
# node 37: type: TNT_SYMBOL sym: y
# child RHS for node 36
# node 38: type: TNT_INTCON val: 7
# child SEQ_NEXT for node 22
# node 39: type: TNT_STMT
# child SEQ_CUR for node 39
# node 40: type: TNT_IF
# child IF_COND for node 40
# node 41: type: TNT_AND
# child LHS for node 41
# node 42: type: TNT_LT
# child LHS for node 42
# node 43: type: TNT_SYMBOL sym: y
# child RHS for node 42
# node 44: type: TNT_INTCON val: 4
# child RHS for node 41
# node 45: type: TNT_AND
# child LHS for node 45
# node 46: type: TNT_GT
# child LHS for node 46
# node 47: type: TNT_SYMBOL sym: y
# child RHS for node 46
# node 48: type: TNT_INTCON val: 5
# child RHS for node 45
# node 49: type: TNT_AND
# child LHS for node 49
# node 50: type: TNT_EQ
# child LHS for node 50
# node 51: type: TNT_SYMBOL sym: y
# child RHS for node 50
# node 52: type: TNT_INTCON val: 6
# child RHS for node 49
# node 53: type: TNT_NOT
# child RHS for node 53
# node 54: type: TNT_EQ
# child LHS for node 54
# node 55: type: TNT_SYMBOL sym: y
# child RHS for node 54
# node 56: type: TNT_INTCON val: 7
# c-- exited with code: 0
