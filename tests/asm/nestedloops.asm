#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 5
# sym: dub
#   line: 1
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: half
#   line: 2
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#     is_extern: no
# sym: sum
#   line: 4
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: y
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#       2: z
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: sumchars
#   line: 6
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: string
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: len
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: main
#   line: 15
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: argc
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: argv
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: dub
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 1
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
# LOCAL SYMBOLS FOR FUNCTION: half
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 2
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
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
# LOCAL SYMBOLS FOR FUNCTION: sum
#-----------------------------------------------------------------------------
# size: 3
# sym: x
#   line: 4
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: y
#   line: 4
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: z
#   line: 4
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
# node 4: type: TNT_PLUS
# child LHS for node 4
# node 5: type: TNT_SYMBOL sym: x
# child RHS for node 4
# node 6: type: TNT_SYMBOL sym: y
# child RHS for node 3
# node 7: type: TNT_SYMBOL sym: z
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: sumchars
#-----------------------------------------------------------------------------
# size: 4
# sym: string
#   line: 6
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: len
#   line: 6
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: i
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: sum
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: sumchars
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: sum
# child RHS for node 2
# node 4: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_FOR
# child FOR_INIT for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_SYMBOL sym: i
# child RHS for node 7
# node 9: type: TNT_INTCON val: 0
# child FOR_COND for node 6
# node 10: type: TNT_LT
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: i
# child RHS for node 10
# node 12: type: TNT_SYMBOL sym: len
# child FOR_INC for node 6
# node 13: type: TNT_ASSG
# child LHS for node 13
# node 14: type: TNT_SYMBOL sym: i
# child RHS for node 13
# node 15: type: TNT_PLUS
# child LHS for node 15
# node 16: type: TNT_SYMBOL sym: i
# child RHS for node 15
# node 17: type: TNT_INTCON val: 1
# child FOR_BODY for node 6
# node 18: type: TNT_ASSG
# child LHS for node 18
# node 19: type: TNT_SYMBOL sym: sum
# child RHS for node 18
# node 20: type: TNT_PLUS
# child LHS for node 20
# node 21: type: TNT_SYMBOL sym: sum
# child RHS for node 20
# node 22: type: TNT_ARRAY_LOOKUP sym: string
# child AL_OFFSET for node 22
# node 23: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 5
# node 24: type: TNT_STMT
# child SEQ_CUR for node 24
# node 25: type: TNT_RET
# child RET_EXPR for node 25
# node 26: type: TNT_SYMBOL sym: sum
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 4
# sym: argc
#   line: 15
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: argv
#   line: 15
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: x
#   line: 17
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xa
# sym: y
#   line: 18
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_FOR
# child FOR_BODY for node 2
# node 3: type: TNT_FOR
# child FOR_COND for node 3
# node 4: type: TNT_EQ
# child LHS for node 4
# node 5: type: TNT_INTCON val: 0
# child RHS for node 4
# node 6: type: TNT_INTCON val: 0
# child FOR_BODY for node 3
# node 7: type: TNT_FOR
# child FOR_BODY for node 7
# node 8: type: TNT_WHILE
# child WHILE_COND for node 8
# node 9: type: TNT_EQ
# child LHS for node 9
# node 10: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 10
# node 11: type: TNT_SYMBOL sym: y
# child RHS for node 9
# node 12: type: TNT_CALL sym: dub
# child CALL_ARGS for node 12
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_PLUS
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: y
# child RHS for node 14
# node 16: type: TNT_INTCON val: 111
# child WHILE_BODY for node 8
# node 17: type: TNT_WHILE
# child WHILE_COND for node 17
# node 18: type: TNT_LT
# child LHS for node 18
# node 19: type: TNT_CALL sym: sumchars
# child CALL_ARGS for node 19
# node 20: type: TNT_ARG
# child SEQ_CUR for node 20
# node 21: type: TNT_STRCON str: "abcdefg"
# child SEQ_NEXT for node 20
# node 22: type: TNT_ARG
# child SEQ_CUR for node 22
# node 23: type: TNT_INTCON val: 222
# child RHS for node 18
# node 24: type: TNT_CALL sym: sumchars
# child CALL_ARGS for node 24
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_SYMBOL sym: argv
# child SEQ_NEXT for node 25
# node 27: type: TNT_ARG
# child SEQ_CUR for node 27
# node 28: type: TNT_INTCON val: 333
# child WHILE_BODY for node 17
# node 29: type: TNT_FOR
# child FOR_INIT for node 29
# node 30: type: TNT_ASSG
# child LHS for node 30
# node 31: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 31
# node 32: type: TNT_INTCON val: 444
# child RHS for node 30
# node 33: type: TNT_PLUS
# child LHS for node 33
# node 34: type: TNT_PLUS
# child LHS for node 34
# node 35: type: TNT_CALL sym: dub
# child CALL_ARGS for node 35
# node 36: type: TNT_ARG
# child SEQ_CUR for node 36
# node 37: type: TNT_INTCON val: 555
# child RHS for node 34
# node 38: type: TNT_CALL sym: dub
# child CALL_ARGS for node 38
# node 39: type: TNT_ARG
# child SEQ_CUR for node 39
# node 40: type: TNT_INTCON val: 666
# child RHS for node 33
# node 41: type: TNT_CALL sym: dub
# child CALL_ARGS for node 41
# node 42: type: TNT_ARG
# child SEQ_CUR for node 42
# node 43: type: TNT_CALL sym: dub
# child CALL_ARGS for node 43
# node 44: type: TNT_ARG
# child SEQ_CUR for node 44
# node 45: type: TNT_CALL sym: sumchars
# child CALL_ARGS for node 45
# node 46: type: TNT_ARG
# child SEQ_CUR for node 46
# node 47: type: TNT_STRCON str: "hey"
# child SEQ_NEXT for node 46
# node 48: type: TNT_ARG
# child SEQ_CUR for node 48
# node 49: type: TNT_INTCON val: 777
# child FOR_COND for node 29
# node 50: type: TNT_OR
# child LHS for node 50
# node 51: type: TNT_AND
# child LHS for node 51
# node 52: type: TNT_EQ
# child LHS for node 52
# node 53: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 53
# node 54: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 54
# node 55: type: TNT_INTCON val: 888
# child RHS for node 52
# node 56: type: TNT_CALL sym: half
# child CALL_ARGS for node 56
# node 57: type: TNT_ARG
# child SEQ_CUR for node 57
# node 58: type: TNT_CALL sym: sum
# child CALL_ARGS for node 58
# node 59: type: TNT_ARG
# child SEQ_CUR for node 59
# node 60: type: TNT_SYMBOL sym: y
# child SEQ_NEXT for node 59
# node 61: type: TNT_ARG
# child SEQ_CUR for node 61
# node 62: type: TNT_SYMBOL sym: y
# child SEQ_NEXT for node 61
# node 63: type: TNT_ARG
# child SEQ_CUR for node 63
# node 64: type: TNT_SYMBOL sym: y
# child RHS for node 51
# node 65: type: TNT_LT
# child LHS for node 65
# node 66: type: TNT_CALL sym: half
# child CALL_ARGS for node 66
# node 67: type: TNT_ARG
# child SEQ_CUR for node 67
# node 68: type: TNT_SYMBOL sym: y
# child RHS for node 65
# node 69: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 69
# node 70: type: TNT_SYMBOL sym: y
# child RHS for node 50
# node 71: type: TNT_NEQ
# child LHS for node 71
# node 72: type: TNT_PLUS
# child LHS for node 72
# node 73: type: TNT_SYMBOL sym: y
# child RHS for node 72
# node 74: type: TNT_MULT
# child LHS for node 74
# node 75: type: TNT_SYMBOL sym: y
# child RHS for node 74
# node 76: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 76
# node 77: type: TNT_INTCON val: 999
# child RHS for node 71
# node 78: type: TNT_INTCON val: 1000
# child FOR_BODY for node 29
# node 79: type: TNT_STMT
# child SEQ_CUR for node 79
# node 80: type: TNT_WHILE
# child WHILE_COND for node 80
# node 81: type: TNT_EQ
# child LHS for node 81
# node 82: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 82
# node 83: type: TNT_INTCON val: 0
# child RHS for node 81
# node 84: type: TNT_INTCON val: 1001
# child WHILE_BODY for node 80
# node 85: type: TNT_ASSG
# child LHS for node 85
# node 86: type: TNT_SYMBOL sym: y
# child RHS for node 85
# node 87: type: TNT_MINUS
# child LHS for node 87
# node 88: type: TNT_SYMBOL sym: y
# child RHS for node 87
# node 89: type: TNT_INTCON val: 1002
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
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (2)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: half
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (2)
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
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (1)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: sumchars
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (sum)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (len)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (sum)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (string)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (sum)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (i)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (i)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (sum)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    6
# svregs used:   2
# stktemps used: 0
# regargs used:  3
# stkargs used:  0
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (13)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SEQ
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (12)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (11)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (3)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_SVTEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (111)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (2)
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
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SEQ
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (10)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (4)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("abcdefg")
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (222)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sumchars)
# |
# >
# CNT_MOV
# -------
# dest -> ST_SVTEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (argv)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (333)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sumchars)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (9)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (555)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
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
# dest -> ST_SVTEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (666)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
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
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ADD
# -------
# dest -> ST_SVTEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("hey")
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (777)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (sumchars)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
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
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
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
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_SVTEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (444)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (5)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (888)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_SVTEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (2)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
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
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (half)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SEQ
# -------
# dest -> ST_SVTEMP (1)
# src1 -> ST_SVTEMP (0)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (half)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (3)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_AND
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_SVTEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_INTCON (999)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (3)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (5)
# src1 -> ST_TEMP (3)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (5)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (4)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1000)
# |
# >
# CNT_SNE
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_OR
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (3)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (8)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (6)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1001)
# |
# >
# CNT_SEQ
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (7)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (y)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1002)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (y)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (6)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (7)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (5)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (8)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (4)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (9)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (3)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (10)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (2)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (11)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (1)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (12)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (0)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (13)

.data

  _str0:
    .asciiz "abcdefg"
    .align 2

  _str1:
    .asciiz "hey"
    .align 2

.text

_dub:

  # |--------------------------------|
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack
  la $sp, -0($sp)

  move $t0, $a0
  li $t1, 2
  mul $t2, $t0, $t1
  move $v0, $t2
  j __leave_dub

__leave_dub:
  la $sp, 0($sp)
  jr $ra

_half:

  # |--------------------------------|
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack
  la $sp, -0($sp)

  move $t0, $a0
  li $t1, 2
  div $t2, $t0, $t1
  move $v0, $t2
  j __leave_half

__leave_half:
  la $sp, 0($sp)
  jr $ra

_sum:

  # |--------------------------------|
  # |         <z is in $a2>          |
  # |--------------------------------| sp+8
  # |         <y is in $a1>          |
  # |--------------------------------| sp+4
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's stack
  la $sp, -0($sp)

  move $t0, $a0
  move $t1, $a1
  addu $t2, $t0, $t1
  move $t0, $a2
  addu $t1, $t2, $t0
  move $v0, $t1
  j __leave_sum

__leave_sum:
  la $sp, 0($sp)
  jr $ra

_sumchars:

  # |--------------------------------|
  # |        <len is in $a1>         |
  # |--------------------------------| sp+12
  # |       <string is in $a0>       |
  # |--------------------------------| sp+8  <-- start of caller's stack
  # |              sum               |
  # |--------------------------------| sp+4
  # |               i                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  li $t0, 0
  sw $t0, 4($sp)
  li $t0, 0
  sw $t0, 0($sp)
_L0:
  lw $t0, 0($sp)
  move $t1, $a1
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  move $t2, $a0
  addu $t3, $t2, $t1
  lb $t1, ($t3)
  addu $t2, $t0, $t1
  sw $t2, 4($sp)
  lw $t0, 0($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 0($sp)
  j _L0
_L1:
  lw $t0, 4($sp)
  move $v0, $t0
  j __leave_sumchars

__leave_sumchars:
  la $sp, 8($sp)
  jr $ra

main:

  # |--------------------------------|
  # |              argv              |
  # |--------------------------------| sp+84
  # |              argc              |
  # |--------------------------------| sp+80  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+76
  # |               y                |
  # |--------------------------------| sp+72
  # |               x                |
  # |--------------------------------| sp+32
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |              $ra               |
  # |--------------------------------| sp+24
  # |              $s1               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -80($sp)
  sw $ra, 24($sp)
  sw $a0, 80($sp)
  sw $a1, 84($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)

_L2:
  li $t0, 1
  beq $t0, $zero, _L15
_L3:
  li $t0, 0
  li $t1, 0
  seq $t2, $t0, $t1
  beq $t2, $zero, _L14
_L4:
  li $t0, 1
  beq $t0, $zero, _L13
_L5:
  lb $t0, 72($sp)
  sll $t1, $t0, 2
  la $t0, 32($sp)
  addu $t2, $t0, $t1
  lw $s0, ($t2)
  lb $t0, 72($sp)
  li $t1, 111
  addu $t2, $t0, $t1
  move $a0, $t2
  jal _dub
  move $t0, $v0
  seq $t1, $s0, $t0
  beq $t1, $zero, _L12
_L6:
  la $t0, _str0
  li $t1, 222
  move $a1, $t1
  move $a0, $t0
  jal _sumchars
  move $s0, $v0
  lw $t0, 84($sp)
  li $t1, 333
  move $a1, $t1
  move $a0, $t0
  jal _sumchars
  move $t0, $v0
  slt $t1, $s0, $t0
  beq $t1, $zero, _L11
  li $t0, 555
  move $a0, $t0
  jal _dub
  move $s0, $v0
  li $t0, 666
  move $a0, $t0
  jal _dub
  move $t0, $v0
  addu $s1, $s0, $t0
  la $t0, _str1
  li $t1, 777
  move $a1, $t1
  move $a0, $t0
  jal _sumchars
  move $t0, $v0
  move $a0, $t0
  jal _dub
  move $t0, $v0
  move $a0, $t0
  jal _dub
  move $t0, $v0
  addu $t1, $s1, $t0
  li $t0, 444
  sll $t2, $t0, 2
  la $t0, 32($sp)
  addu $t3, $t0, $t2
  sw $t1, ($t3)
_L7:
  li $t0, 888
  sll $t1, $t0, 2
  la $t0, 32($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sll $t1, $t0, 2
  la $t0, 32($sp)
  addu $t2, $t0, $t1
  lw $s0, ($t2)
  lb $t0, 72($sp)
  lb $t1, 72($sp)
  lb $t2, 72($sp)
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _sum
  move $t0, $v0
  move $a0, $t0
  jal _half
  move $t0, $v0
  seq $s1, $s0, $t0
  lb $t0, 72($sp)
  move $a0, $t0
  jal _half
  move $t0, $v0
  lb $t1, 72($sp)
  sll $t2, $t1, 2
  la $t1, 32($sp)
  addu $t3, $t1, $t2
  lw $t1, ($t3)
  slt $t2, $t0, $t1
  and $t0, $s1, $t2
  lb $t1, 72($sp)
  lb $t2, 72($sp)
  li $t3, 999
  sll $t4, $t3, 2
  la $t3, 32($sp)
  addu $t5, $t3, $t4
  lw $t3, ($t5)
  mul $t4, $t2, $t3
  addu $t2, $t1, $t4
  li $t1, 1000
  sne $t3, $t2, $t1
  or $t1, $t0, $t3
  beq $t1, $zero, _L10
_L8:
  li $t0, 0
  sll $t1, $t0, 2
  la $t0, 32($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 1001
  seq $t2, $t0, $t1
  beq $t2, $zero, _L9
  lb $t0, 72($sp)
  li $t1, 1002
  sub $t2, $t0, $t1
  sb $t2, 72($sp)
  j _L8
_L9:
  j _L7
_L10:
  j _L6
_L11:
  j _L5
_L12:
  j _L4
_L13:
  j _L3
_L14:
  j _L2
_L15:

__leavemain:
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  lw $ra, 24($sp)
  la $sp, 80($sp)
  jal __exit

__print_string:
  li $v0, 4
  syscall
  jr $ra

__print_int:
  li $v0, 1
  syscall
  jr $ra

__print_char:
  li $v0, 11
  syscall
  jr $ra

__print_hex:
  li $v0, 34
  syscall
  jr $ra

__exit:
  li $v0, 10
  syscall
  jr $ra
