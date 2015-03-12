#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 8
# sym: right_back
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: num_at
#   line: 4
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       0: array
#         type: ST_ARRAY
#           base: PRIM_INT
#       1: idx
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: char_at
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_CHAR
#     params:
#       0: string
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: idx
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: bunch
#   line: 16
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: one
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: two
#         type: ST_ARRAY
#           base: PRIM_INT
#       2: three
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#       3: four
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       4: five
#         type: ST_ARRAY
#           base: PRIM_INT
#       5: six
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       6: seven
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       7: eight
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#       8: nine
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       9: ten
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#     is_extern: no
# sym: blip
#   line: 18
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: gint
#   line: 20
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: gchar
#   line: 21
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: stuff
#   line: 23
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: right_back
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: right_back
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_SYMBOL sym: x
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: num_at
#-----------------------------------------------------------------------------
# size: 2
# sym: array
#   line: 4
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
# sym: idx
#   line: 4
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: num_at
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: array
# child AL_OFFSET for node 3
# node 4: type: TNT_SYMBOL sym: idx
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: char_at
#-----------------------------------------------------------------------------
# size: 2
# sym: string
#   line: 5
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: idx
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: char_at
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: string
# child AL_OFFSET for node 3
# node 4: type: TNT_SYMBOL sym: idx
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: bunch
#-----------------------------------------------------------------------------
# size: 10
# sym: one
#   line: 7
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: two
#   line: 8
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
# sym: three
#   line: 9
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: four
#   line: 10
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: five
#   line: 11
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xffffffff
# sym: six
#   line: 12
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: seven
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: eight
#   line: 14
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: nine
#   line: 15
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: ten
#   line: 16
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: bunch
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: blip
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 18
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: blip
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: stuff
#-----------------------------------------------------------------------------
# size: 2
# sym: larray
#   line: 25
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x1f4
# sym: lint
#   line: 26
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: stuff
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: gint
# child RHS for node 2
# node 4: type: TNT_CALL sym: right_back
# child CALL_ARGS for node 4
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 1
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_ASSG
# child LHS for node 8
# node 9: type: TNT_SYMBOL sym: gint
# child RHS for node 8
# node 10: type: TNT_CALL sym: right_back
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_CHARCON str: 'a'
# child SEQ_NEXT for node 7
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_ASSG
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: lint
# child RHS for node 14
# node 16: type: TNT_CALL sym: num_at
# child CALL_ARGS for node 16
# node 17: type: TNT_ARG
# child SEQ_CUR for node 17
# node 18: type: TNT_SYMBOL sym: larray
# child SEQ_NEXT for node 17
# node 19: type: TNT_ARG
# child SEQ_CUR for node 19
# node 20: type: TNT_INTCON val: 6
# child SEQ_NEXT for node 13
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_ASSG
# child LHS for node 22
# node 23: type: TNT_SYMBOL sym: gchar
# child RHS for node 22
# node 24: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 24
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_STRCON str: "hello"
# child SEQ_NEXT for node 25
# node 27: type: TNT_ARG
# child SEQ_CUR for node 27
# node 28: type: TNT_INTCON val: 16
# child SEQ_NEXT for node 21
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_CALL sym: bunch
# child CALL_ARGS for node 30
# node 31: type: TNT_ARG
# child SEQ_CUR for node 31
# node 32: type: TNT_STRCON str: "one"
# child SEQ_NEXT for node 31
# node 33: type: TNT_ARG
# child SEQ_CUR for node 33
# node 34: type: TNT_SYMBOL sym: larray
# child SEQ_NEXT for node 33
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_CHARCON str: '3'
# child SEQ_NEXT for node 35
# node 37: type: TNT_ARG
# child SEQ_CUR for node 37
# node 38: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 37
# node 39: type: TNT_ARG
# child SEQ_CUR for node 39
# node 40: type: TNT_SYMBOL sym: larray
# child SEQ_NEXT for node 39
# node 41: type: TNT_ARG
# child SEQ_CUR for node 41
# node 42: type: TNT_INTCON val: 6
# child SEQ_NEXT for node 41
# node 43: type: TNT_ARG
# child SEQ_CUR for node 43
# node 44: type: TNT_INTCON val: 7
# child SEQ_NEXT for node 43
# node 45: type: TNT_ARG
# child SEQ_CUR for node 45
# node 46: type: TNT_CHARCON str: '8'
# child SEQ_NEXT for node 45
# node 47: type: TNT_ARG
# child SEQ_CUR for node 47
# node 48: type: TNT_STRCON str: "nine"
# child SEQ_NEXT for node 47
# node 49: type: TNT_ARG
# child SEQ_CUR for node 49
# node 50: type: TNT_INTCON val: 10
# child SEQ_NEXT for node 29
# node 51: type: TNT_STMT
# child SEQ_CUR for node 51
# node 52: type: TNT_CALL sym: blip
# child CALL_ARGS for node 52
# node 53: type: TNT_ARG
# child SEQ_CUR for node 53
# node 54: type: TNT_INTCON val: 500000
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: right_back
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
# INTERMEDIATE CODE FOR FUNCTION: num_at
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (idx)
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
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: char_at
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (idx)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_ARRAY (string)
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
# dest -> ST_TEMPORARY (0)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: bunch
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: blip
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: stuff
#-----------------------------------------------------------------------------
# temps used:    7
# svregs used:   3
# stktemps used: 0
# regargs used:  4
# stkargs used:  6
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (5)
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
# src1 -> ST_FUNCTION (right_back)
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
# dest -> ST_PRIMITIVE (gint)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_CHARCON ('a')
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
# src1 -> ST_FUNCTION (right_back)
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
# dest -> ST_PRIMITIVE (gint)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_ARRAY (larray)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (6)
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
# src1 -> ST_FUNCTION (num_at)
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
# dest -> ST_PRIMITIVE (lint)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON ("hello")
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (16)
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
# src1 -> ST_FUNCTION (char_at)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (gchar)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_STRCON ("one")
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_ARRAY (larray)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_CHARCON ('3')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (4)
# src1 -> ST_ARRAY (larray)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (5)
# src1 -> ST_INTCON (6)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (6)
# src1 -> ST_INTCON (7)
# |
# >
# CNT_LI
# ------
# dest -> ST_SAVED_TEMPORARY (0)
# src1 -> ST_CHARCON ('8')
# |
# >
# CNT_LEA
# -------
# dest -> ST_SAVED_TEMPORARY (1)
# src1 -> ST_STRCON ("nine")
# |
# >
# CNT_LI
# ------
# dest -> ST_SAVED_TEMPORARY (2)
# src1 -> ST_INTCON (10)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STACK_ARGUMENT (5)
# src1 -> ST_SAVED_TEMPORARY (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STACK_ARGUMENT (4)
# src1 -> ST_SAVED_TEMPORARY (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STACK_ARGUMENT (3)
# src1 -> ST_SAVED_TEMPORARY (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STACK_ARGUMENT (2)
# src1 -> ST_TEMPORARY (6)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STACK_ARGUMENT (1)
# src1 -> ST_TEMPORARY (5)
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
# src1 -> ST_FUNCTION (bunch)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (500000)
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
# src1 -> ST_FUNCTION (blip)
