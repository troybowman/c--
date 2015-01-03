#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 2
# sym: half
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
# LOCAL SYMBOLS FOR FUNCTION: half
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: half
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_DIV
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: x
# child RHS for node 3
# node 5: type: TNT_INTCON val: 2
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
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: x
# child RHS for node 2
# node 4: type: TNT_PLUS
# child LHS for node 4
# node 5: type: TNT_INTCON val: 1
# child RHS for node 4
# node 6: type: TNT_CALL sym: half
# child CALL_ARGS for node 6
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 1
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_ASSG
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: x
# child RHS for node 10
# node 12: type: TNT_PLUS
# child LHS for node 12
# node 13: type: TNT_PLUS
# child LHS for node 13
# node 14: type: TNT_PLUS
# child LHS for node 14
# node 15: type: TNT_PLUS
# child LHS for node 15
# node 16: type: TNT_INTCON val: 3
# child RHS for node 15
# node 17: type: TNT_CALL sym: half
# child CALL_ARGS for node 17
# node 18: type: TNT_ARG
# child SEQ_CUR for node 18
# node 19: type: TNT_INTCON val: 4
# child RHS for node 14
# node 20: type: TNT_CALL sym: half
# child CALL_ARGS for node 20
# node 21: type: TNT_ARG
# child SEQ_CUR for node 21
# node 22: type: TNT_INTCON val: 5
# child RHS for node 13
# node 23: type: TNT_CALL sym: half
# child CALL_ARGS for node 23
# node 24: type: TNT_ARG
# child SEQ_CUR for node 24
# node 25: type: TNT_INTCON val: 6
# child RHS for node 12
# node 26: type: TNT_CALL sym: half
# child CALL_ARGS for node 26
# node 27: type: TNT_ARG
# child SEQ_CUR for node 27
# node 28: type: TNT_INTCON val: 7
# child SEQ_NEXT for node 9
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_ASSG
# child LHS for node 30
# node 31: type: TNT_SYMBOL sym: x
# child RHS for node 30
# node 32: type: TNT_PLUS
# child LHS for node 32
# node 33: type: TNT_CALL sym: half
# child CALL_ARGS for node 33
# node 34: type: TNT_ARG
# child SEQ_CUR for node 34
# node 35: type: TNT_INTCON val: 8
# child RHS for node 32
# node 36: type: TNT_PLUS
# child LHS for node 36
# node 37: type: TNT_CALL sym: half
# child CALL_ARGS for node 37
# node 38: type: TNT_ARG
# child SEQ_CUR for node 38
# node 39: type: TNT_INTCON val: 9
# child RHS for node 36
# node 40: type: TNT_PLUS
# child LHS for node 40
# node 41: type: TNT_CALL sym: half
# child CALL_ARGS for node 41
# node 42: type: TNT_ARG
# child SEQ_CUR for node 42
# node 43: type: TNT_INTCON val: 10
# child RHS for node 40
# node 44: type: TNT_CALL sym: half
# child CALL_ARGS for node 44
# node 45: type: TNT_ARG
# child SEQ_CUR for node 45
# node 46: type: TNT_INTCON val: 11
# child SEQ_NEXT for node 29
# node 47: type: TNT_STMT
# child SEQ_CUR for node 47
# node 48: type: TNT_ASSG
# child LHS for node 48
# node 49: type: TNT_SYMBOL sym: x
# child RHS for node 48
# node 50: type: TNT_PLUS
# child LHS for node 50
# node 51: type: TNT_PLUS
# child LHS for node 51
# node 52: type: TNT_PLUS
# child LHS for node 52
# node 53: type: TNT_CALL sym: half
# child CALL_ARGS for node 53
# node 54: type: TNT_ARG
# child SEQ_CUR for node 54
# node 55: type: TNT_INTCON val: 12
# child RHS for node 52
# node 56: type: TNT_CALL sym: half
# child CALL_ARGS for node 56
# node 57: type: TNT_ARG
# child SEQ_CUR for node 57
# node 58: type: TNT_INTCON val: 13
# child RHS for node 51
# node 59: type: TNT_CALL sym: half
# child CALL_ARGS for node 59
# node 60: type: TNT_ARG
# child SEQ_CUR for node 60
# node 61: type: TNT_INTCON val: 14
# child RHS for node 50
# node 62: type: TNT_CALL sym: half
# child CALL_ARGS for node 62
# node 63: type: TNT_ARG
# child SEQ_CUR for node 63
# node 64: type: TNT_INTCON val: 15
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: half
#-----------------------------------------------------------------------------
# temps used:   3
# svtemps used: 0
# args used:    0
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETLOC
# src1 -> ST_TEMPORARY (2)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:   2
# svtemps used: 3
# args used:    1
# CNT_MOV
# -------
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETLOC
# src1 -> ST_FUNCTION (half)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETLOC
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_SAVED_TEMPORARY (0)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETLOC
# src1 -> ST_FUNCTION (half)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETLOC
# |
# >
# CNT_ADD
# -------
# dest -> ST_SAVED_TEMPORARY (1)
# src1 -> ST_SAVED_TEMPORARY (0)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETLOC
# src1 -> ST_FUNCTION (half)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETLOC
# |
# >
# CNT_ADD
# -------
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_SAVED_TEMPORARY (1)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (6)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETLOC
# src1 -> ST_FUNCTION (half)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETLOC
# |
# >
# CNT_ADD
# -------
# dest -> ST_SAVED_TEMPORARY (1)
# src1 -> ST_SAVED_TEMPORARY (0)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (7)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETLOC
# src1 -> ST_FUNCTION (half)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETLOC
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_SAVED_TEMPORARY (1)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (8)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETLOC
# src1 -> ST_FUNCTION (half)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_RETLOC
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (9)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETLOC
# src1 -> ST_FUNCTION (half)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SAVED_TEMPORARY (1)
# src1 -> ST_RETLOC
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (10)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETLOC
# src1 -> ST_FUNCTION (half)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SAVED_TEMPORARY (2)
# src1 -> ST_RETLOC
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (11)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETLOC
# src1 -> ST_FUNCTION (half)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETLOC
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_SAVED_TEMPORARY (2)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_SAVED_TEMPORARY (1)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_SAVED_TEMPORARY (0)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (12)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETLOC
# src1 -> ST_FUNCTION (half)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_RETLOC
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (13)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETLOC
# src1 -> ST_FUNCTION (half)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETLOC
# |
# >
# CNT_ADD
# -------
# dest -> ST_SAVED_TEMPORARY (1)
# src1 -> ST_SAVED_TEMPORARY (0)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (14)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETLOC
# src1 -> ST_FUNCTION (half)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETLOC
# |
# >
# CNT_ADD
# -------
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_SAVED_TEMPORARY (1)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (15)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETLOC
# src1 -> ST_FUNCTION (half)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETLOC
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_SAVED_TEMPORARY (0)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (1)
