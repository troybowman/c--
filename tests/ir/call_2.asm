#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 5
# sym: checksum0
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: checksum1
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: array
#         type: ST_ARRAY
#           base: PRIM_INT
#     is_extern: no
# sym: checksum2
#   line: 7
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: array
#         type: ST_ARRAY
#           base: PRIM_INT
#       1: idx1
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       2: idx2
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       3: idx3
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: div
#   line: 12
#   type: ST_FUNCTION
#     rt_type: PRIM_CHAR
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: go
#   line: 14
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: array
#         type: ST_ARRAY
#           base: PRIM_INT
#       1: c
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: checksum0
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: checksum0
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_SYMBOL sym: x
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: checksum1
#-----------------------------------------------------------------------------
# size: 1
# sym: array
#   line: 5
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: checksum1
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_PLUS
# child LHS for node 3
# node 4: type: TNT_PLUS
# child LHS for node 4
# node 5: type: TNT_ARRAY_LOOKUP sym: array
# child AL_OFFSET for node 5
# node 6: type: TNT_INTCON val: 0
# child RHS for node 4
# node 7: type: TNT_ARRAY_LOOKUP sym: array
# child AL_OFFSET for node 7
# node 8: type: TNT_INTCON val: 1
# child RHS for node 3
# node 9: type: TNT_ARRAY_LOOKUP sym: array
# child AL_OFFSET for node 9
# node 10: type: TNT_INTCON val: 2
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: checksum2
#-----------------------------------------------------------------------------
# size: 4
# sym: array
#   line: 7
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
# sym: idx1
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: idx2
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: idx3
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: checksum2
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_DIV
# child LHS for node 3
# node 4: type: TNT_MULT
# child LHS for node 4
# node 5: type: TNT_ARRAY_LOOKUP sym: array
# child AL_OFFSET for node 5
# node 6: type: TNT_SYMBOL sym: idx1
# child RHS for node 4
# node 7: type: TNT_ARRAY_LOOKUP sym: array
# child AL_OFFSET for node 7
# node 8: type: TNT_SYMBOL sym: idx2
# child RHS for node 3
# node 9: type: TNT_ARRAY_LOOKUP sym: array
# child AL_OFFSET for node 9
# node 10: type: TNT_SYMBOL sym: idx3
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: div
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 12
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: div
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_DIV
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: x
# child RHS for node 3
# node 5: type: TNT_INTCON val: 5
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: go
#-----------------------------------------------------------------------------
# size: 4
# sym: array
#   line: 14
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
# sym: c
#   line: 14
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: s
#   line: 16
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xa
# sym: x
#   line: 17
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xa
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: go
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: c
# child RHS for node 2
# node 4: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 4
# node 5: type: TNT_CALL sym: div
# child CALL_ARGS for node 5
# node 6: type: TNT_ARG
# child SEQ_CUR for node 6
# node 7: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 1
# node 8: type: TNT_STMT
# child SEQ_CUR for node 8
# node 9: type: TNT_ASSG
# child LHS for node 9
# node 10: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 10
# node 11: type: TNT_CALL sym: div
# child CALL_ARGS for node 11
# node 12: type: TNT_ARG
# child SEQ_CUR for node 12
# node 13: type: TNT_SYMBOL sym: c
# child RHS for node 9
# node 14: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 8
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_ASSG
# child LHS for node 16
# node 17: type: TNT_SYMBOL sym: c
# child RHS for node 16
# node 18: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 18
# node 19: type: TNT_CALL sym: div
# child CALL_ARGS for node 19
# node 20: type: TNT_ARG
# child SEQ_CUR for node 20
# node 21: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 21
# node 22: type: TNT_CALL sym: div
# child CALL_ARGS for node 22
# node 23: type: TNT_ARG
# child SEQ_CUR for node 23
# node 24: type: TNT_INTCON val: 11
# child SEQ_NEXT for node 15
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_ASSG
# child LHS for node 26
# node 27: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 27
# node 28: type: TNT_CALL sym: div
# child CALL_ARGS for node 28
# node 29: type: TNT_ARG
# child SEQ_CUR for node 29
# node 30: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 30
# node 31: type: TNT_CALL sym: div
# child CALL_ARGS for node 31
# node 32: type: TNT_ARG
# child SEQ_CUR for node 32
# node 33: type: TNT_INTCON val: 22
# child RHS for node 26
# node 34: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 25
# node 35: type: TNT_STMT
# child SEQ_CUR for node 35
# node 36: type: TNT_ASSG
# child LHS for node 36
# node 37: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 37
# node 38: type: TNT_CALL sym: checksum0
# child CALL_ARGS for node 38
# node 39: type: TNT_ARG
# child SEQ_CUR for node 39
# node 40: type: TNT_CALL sym: checksum2
# child CALL_ARGS for node 40
# node 41: type: TNT_ARG
# child SEQ_CUR for node 41
# node 42: type: TNT_SYMBOL sym: array
# child SEQ_NEXT for node 41
# node 43: type: TNT_ARG
# child SEQ_CUR for node 43
# node 44: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 44
# node 45: type: TNT_INTCON val: 33
# child SEQ_NEXT for node 43
# node 46: type: TNT_ARG
# child SEQ_CUR for node 46
# node 47: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 47
# node 48: type: TNT_INTCON val: 44
# child SEQ_NEXT for node 46
# node 49: type: TNT_ARG
# child SEQ_CUR for node 49
# node 50: type: TNT_PLUS
# child LHS for node 50
# node 51: type: TNT_SYMBOL sym: c
# child RHS for node 50
# node 52: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 52
# node 53: type: TNT_CALL sym: div
# child CALL_ARGS for node 53
# node 54: type: TNT_ARG
# child SEQ_CUR for node 54
# node 55: type: TNT_INTCON val: 55
# child RHS for node 36
# node 56: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 56
# node 57: type: TNT_CALL sym: checksum2
# child CALL_ARGS for node 57
# node 58: type: TNT_ARG
# child SEQ_CUR for node 58
# node 59: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 58
# node 60: type: TNT_ARG
# child SEQ_CUR for node 60
# node 61: type: TNT_CALL sym: checksum1
# child CALL_ARGS for node 61
# node 62: type: TNT_ARG
# child SEQ_CUR for node 62
# node 63: type: TNT_SYMBOL sym: array
# child SEQ_NEXT for node 60
# node 64: type: TNT_ARG
# child SEQ_CUR for node 64
# node 65: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 65
# node 66: type: TNT_INTCON val: 77
# child SEQ_NEXT for node 64
# node 67: type: TNT_ARG
# child SEQ_CUR for node 67
# node 68: type: TNT_PLUS
# child LHS for node 68
# node 69: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 69
# node 70: type: TNT_CALL sym: div
# child CALL_ARGS for node 70
# node 71: type: TNT_ARG
# child SEQ_CUR for node 71
# node 72: type: TNT_INTCON val: 88
# child RHS for node 68
# node 73: type: TNT_SYMBOL sym: c
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: checksum0
#-----------------------------------------------------------------------------
# temps used:    1
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
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: checksum1
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_ARRAY (array)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_ARRAY (array)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_ARRAY (array)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (1)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: checksum2
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (idx1)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_ARRAY (array)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (idx2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_ARRAY (array)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (idx3)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_ARRAY (array)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (1)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: div
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
# src1 -> ST_INTCON (5)
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
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (2)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: go
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   4
# stktemps used: 0
# regargs used:  4
# stkargs used:  0
# CNT_LB
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (c)
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
# src1 -> ST_FUNCTION (div)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (c)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (c)
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
# src1 -> ST_FUNCTION (div)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_SAVED_TEMPORARY (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (11)
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
# src1 -> ST_FUNCTION (div)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_TEMPORARY (2)
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
# src1 -> ST_FUNCTION (div)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (c)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (22)
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
# src1 -> ST_FUNCTION (div)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_TEMPORARY (2)
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
# src1 -> ST_FUNCTION (div)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_SAVED_TEMPORARY (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_ARRAY (array)
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
# src1 -> ST_FUNCTION (checksum1)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (77)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_ARRAY (s)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_LB
# ------
# dest -> ST_SAVED_TEMPORARY (1)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (88)
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
# src1 -> ST_FUNCTION (div)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_RETVAL
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (2)
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
# src1 -> ST_SAVED_TEMPORARY (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (1)
# src1 -> ST_SAVED_TEMPORARY (0)
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
# src1 -> ST_FUNCTION (checksum2)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_ARRAY (s)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_ARRAY (array)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (33)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_SAVED_TEMPORARY (1)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (44)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_ARRAY (s)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_LB
# ------
# dest -> ST_SAVED_TEMPORARY (2)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_LB
# ------
# dest -> ST_SAVED_TEMPORARY (3)
# src1 -> ST_PRIMITIVE (c)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (55)
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
# src1 -> ST_FUNCTION (div)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_RETVAL
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_SAVED_TEMPORARY (3)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (3)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (2)
# src1 -> ST_SAVED_TEMPORARY (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (1)
# src1 -> ST_SAVED_TEMPORARY (1)
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
# src1 -> ST_FUNCTION (checksum2)
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
# src1 -> ST_FUNCTION (checksum0)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_SAVED_TEMPORARY (0)
