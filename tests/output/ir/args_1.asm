#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 6
# sym: sum
#   line: 3
#   type: ST_FUNCTION
#     rt_type: RT_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: y
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: diff
#   line: 4
#   type: ST_FUNCTION
#     rt_type: RT_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: y
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: dub
#   line: 5
#   type: ST_FUNCTION
#     rt_type: RT_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: lots
#   line: 7
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: one
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: two
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       2: three
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       3: four
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       4: five
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: x
#   line: 9
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: main
#   line: 11
#   type: ST_FUNCTION
#     rt_type: RT_VOID
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
# LOCAL SYMBOLS FOR FUNCTION: diff
#-----------------------------------------------------------------------------
# size: 2
# sym: x
#   line: 4
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 4
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: diff
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_MINUS
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: x
# child RHS for node 3
# node 5: type: TNT_SYMBOL sym: y
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: dub
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: dub
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_MULT
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: x
# child RHS for node 3
# node 5: type: TNT_INTCON val: 2
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: lots
#-----------------------------------------------------------------------------
# size: 5
# sym: one
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: two
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: three
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: four
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: five
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: lots
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 1
# sym: y
#   line: 13
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x5
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: x
# child RHS for node 2
# node 4: type: TNT_CALL sym: sum
# child CALL_ARGS for node 4
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_CALL sym: dub
# child CALL_ARGS for node 6
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_INTCON val: 333
# child SEQ_NEXT for node 5
# node 9: type: TNT_ARG
# child SEQ_CUR for node 9
# node 10: type: TNT_CALL sym: dub
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_INTCON val: 444
# child SEQ_NEXT for node 1
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_CALL sym: lots
# child CALL_ARGS for node 14
# node 15: type: TNT_ARG
# child SEQ_CUR for node 15
# node 16: type: TNT_CALL sym: dub
# child CALL_ARGS for node 16
# node 17: type: TNT_ARG
# child SEQ_CUR for node 17
# node 18: type: TNT_INTCON val: 555
# child SEQ_NEXT for node 15
# node 19: type: TNT_ARG
# child SEQ_CUR for node 19
# node 20: type: TNT_CALL sym: sum
# child CALL_ARGS for node 20
# node 21: type: TNT_ARG
# child SEQ_CUR for node 21
# node 22: type: TNT_INTCON val: 666
# child SEQ_NEXT for node 21
# node 23: type: TNT_ARG
# child SEQ_CUR for node 23
# node 24: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 19
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_CALL sym: diff
# child CALL_ARGS for node 26
# node 27: type: TNT_ARG
# child SEQ_CUR for node 27
# node 28: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 27
# node 29: type: TNT_ARG
# child SEQ_CUR for node 29
# node 30: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 25
# node 31: type: TNT_ARG
# child SEQ_CUR for node 31
# node 32: type: TNT_CALL sym: dub
# child CALL_ARGS for node 32
# node 33: type: TNT_ARG
# child SEQ_CUR for node 33
# node 34: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 34
# node 35: type: TNT_INTCON val: 777
# child SEQ_NEXT for node 31
# node 36: type: TNT_ARG
# child SEQ_CUR for node 36
# node 37: type: TNT_CALL sym: diff
# child CALL_ARGS for node 37
# node 38: type: TNT_ARG
# child SEQ_CUR for node 38
# node 39: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 39
# node 40: type: TNT_INTCON val: 888
# child SEQ_NEXT for node 38
# node 41: type: TNT_ARG
# child SEQ_CUR for node 41
# node 42: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 42
# node 43: type: TNT_INTCON val: 999
# child SEQ_NEXT for node 13
# node 44: type: TNT_STMT
# child SEQ_CUR for node 44
# node 45: type: TNT_ASSG
# child LHS for node 45
# node 46: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 46
# node 47: type: TNT_INTCON val: 4
# child RHS for node 45
# node 48: type: TNT_CALL sym: dub
# child CALL_ARGS for node 48
# node 49: type: TNT_ARG
# child SEQ_CUR for node 49
# node 50: type: TNT_CALL sym: dub
# child CALL_ARGS for node 50
# node 51: type: TNT_ARG
# child SEQ_CUR for node 51
# node 52: type: TNT_CALL sym: dub
# child CALL_ARGS for node 52
# node 53: type: TNT_ARG
# child SEQ_CUR for node 53
# node 54: type: TNT_CALL sym: dub
# child CALL_ARGS for node 54
# node 55: type: TNT_ARG
# child SEQ_CUR for node 55
# node 56: type: TNT_CALL sym: diff
# child CALL_ARGS for node 56
# node 57: type: TNT_ARG
# child SEQ_CUR for node 57
# node 58: type: TNT_INTCON val: 1000
# child SEQ_NEXT for node 57
# node 59: type: TNT_ARG
# child SEQ_CUR for node 59
# node 60: type: TNT_INTCON val: 1001
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: sum
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (2)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: diff
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (2)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: dub
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (2)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: lots
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    7
# svregs used:   1
# stktemps used: 0
# regargs used:  4
# stkargs used:  1
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (333)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (dub)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (444)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (dub)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_RETVAL
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (1)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sum)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (555)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (dub)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (666)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (1)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sum)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_RETVAL
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (1)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (diff)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_RETVAL
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_INTCON (777)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (4)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (5)
# src1 -> ST_TEMPORARY (4)
# src2 -> ST_TEMPORARY (3)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (5)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (dub)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_RETVAL
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (4)
# src1 -> ST_INTCON (888)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (5)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (6)
# src1 -> ST_TEMPORARY (5)
# src2 -> ST_TEMPORARY (4)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMPORARY (4)
# src1 -> ST_TEMPORARY (6)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (5)
# src1 -> ST_INTCON (999)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (6)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_TEMPORARY (6)
# src2 -> ST_TEMPORARY (5)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMPORARY (5)
# src1 -> ST_SAVED_TEMPORARY (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (1)
# src1 -> ST_TEMPORARY (5)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (4)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (diff)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (4)
# src1 -> ST_RETVAL
# |
# >
# CNT_ARG
# -------
# dest -> ST_STACK_ARGUMENT (0)
# src1 -> ST_TEMPORARY (4)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (3)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (2)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (1)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (lots)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1000)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1001)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (1)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (diff)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (dub)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (dub)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (dub)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (dub)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (0)
