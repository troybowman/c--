#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 1
# sym: main
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: argc
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 3
# sym: argc
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: string
#   line: 5
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x5
# sym: x
#   line: 6
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
# node 6: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 1
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_ASSG
# child LHS for node 8
# node 9: type: TNT_SYMBOL sym: x
# child RHS for node 8
# node 10: type: TNT_DIV
# child LHS for node 10
# node 11: type: TNT_INTCON val: 2
# child RHS for node 10
# node 12: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 7
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_ASSG
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: x
# child RHS for node 14
# node 16: type: TNT_MULT
# child LHS for node 16
# node 17: type: TNT_INTCON val: 50
# child RHS for node 16
# node 18: type: TNT_INTCON val: 100
# child SEQ_NEXT for node 13
# node 19: type: TNT_STMT
# child SEQ_CUR for node 19
# node 20: type: TNT_ASSG
# child LHS for node 20
# node 21: type: TNT_SYMBOL sym: x
# child RHS for node 20
# node 22: type: TNT_MINUS
# child LHS for node 22
# node 23: type: TNT_INTCON val: 137
# child RHS for node 22
# node 24: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 19
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_ASSG
# child LHS for node 26
# node 27: type: TNT_ARRAY_LOOKUP sym: string
# child AL_OFFSET for node 27
# node 28: type: TNT_INTCON val: 0
# child RHS for node 26
# node 29: type: TNT_PLUS
# child LHS for node 29
# node 30: type: TNT_CHARCON str: 'a'
# child RHS for node 29
# node 31: type: TNT_CHARCON str: 'b'
# child SEQ_NEXT for node 25
# node 32: type: TNT_STMT
# child SEQ_CUR for node 32
# node 33: type: TNT_ASSG
# child LHS for node 33
# node 34: type: TNT_ARRAY_LOOKUP sym: string
# child AL_OFFSET for node 34
# node 35: type: TNT_INTCON val: 1
# child RHS for node 33
# node 36: type: TNT_PLUS
# child LHS for node 36
# node 37: type: TNT_ARRAY_LOOKUP sym: string
# child AL_OFFSET for node 37
# node 38: type: TNT_INTCON val: 2
# child RHS for node 36
# node 39: type: TNT_ARRAY_LOOKUP sym: string
# child AL_OFFSET for node 39
# node 40: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 32
# node 41: type: TNT_STMT
# child SEQ_CUR for node 41
# node 42: type: TNT_ASSG
# child LHS for node 42
# node 43: type: TNT_SYMBOL sym: argc
# child RHS for node 42
# node 44: type: TNT_PLUS
# child LHS for node 44
# node 45: type: TNT_SYMBOL sym: x
# child RHS for node 44
# node 46: type: TNT_SYMBOL sym: argc
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (2)
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
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (50)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (100)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (137)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_CHARCON ('a')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_CHARCON ('b')
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
# src1 -> ST_INTCON (0)
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
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (2)
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
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_ARRAY (string)
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
# src1 -> ST_INTCON (1)
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
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_PRIMITIVE (argc)
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
# dest -> ST_PRIMITIVE (argc)
# src1 -> ST_TEMPORARY (2)
