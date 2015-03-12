#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 5
# sym: c
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: get5
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       none
#     is_extern: no
# sym: getc
#   line: 7
#   type: ST_FUNCTION
#     rt_type: PRIM_CHAR
#     params:
#       none
#     is_extern: no
# sym: print_int
#   line: 9
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: main
#   line: 11
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: get5
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: get5
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_INTCON val: 5
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: getc
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: getc
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_CHARCON str: 'c'
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: x
# child RHS for node 2
# node 4: type: TNT_CALL sym: get5
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: c
# child RHS for node 6
# node 8: type: TNT_CALL sym: getc
# child SEQ_NEXT for node 5
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_ASSG
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: c
# child RHS for node 10
# node 12: type: TNT_CALL sym: get5
# child SEQ_NEXT for node 9
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_ASSG
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: x
# child RHS for node 14
# node 16: type: TNT_CALL sym: getc
# child SEQ_NEXT for node 13
# node 17: type: TNT_STMT
# child SEQ_CUR for node 17
# node 18: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 18
# node 19: type: TNT_ARG
# child SEQ_CUR for node 19
# node 20: type: TNT_CALL sym: get5
# child SEQ_NEXT for node 17
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 22
# node 23: type: TNT_ARG
# child SEQ_CUR for node 23
# node 24: type: TNT_CALL sym: getc
# child SEQ_NEXT for node 21
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_RET
# child RET_EXPR for node 26
# node 27: type: TNT_INTCON val: 0
