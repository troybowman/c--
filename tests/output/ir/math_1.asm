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
# size: 6
# sym: x1
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: x2
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: x3
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: x4
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: x5
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: x6
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: x1
# child RHS for node 2
# node 4: type: TNT_PLUS
# child LHS for node 4
# node 5: type: TNT_PLUS
# child LHS for node 5
# node 6: type: TNT_PLUS
# child LHS for node 6
# node 7: type: TNT_INTCON val: 1
# child RHS for node 6
# node 8: type: TNT_INTCON val: 2
# child RHS for node 5
# node 9: type: TNT_INTCON val: 3
# child RHS for node 4
# node 10: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 1
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_ASSG
# child LHS for node 12
# node 13: type: TNT_SYMBOL sym: x2
# child RHS for node 12
# node 14: type: TNT_PLUS
# child LHS for node 14
# node 15: type: TNT_PLUS
# child LHS for node 15
# node 16: type: TNT_INTCON val: 1
# child RHS for node 15
# node 17: type: TNT_INTCON val: 2
# child RHS for node 14
# node 18: type: TNT_PLUS
# child LHS for node 18
# node 19: type: TNT_INTCON val: 3
# child RHS for node 18
# node 20: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 11
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_ASSG
# child LHS for node 22
# node 23: type: TNT_SYMBOL sym: x3
# child RHS for node 22
# node 24: type: TNT_PLUS
# child LHS for node 24
# node 25: type: TNT_INTCON val: 1
# child RHS for node 24
# node 26: type: TNT_PLUS
# child LHS for node 26
# node 27: type: TNT_INTCON val: 2
# child RHS for node 26
# node 28: type: TNT_PLUS
# child LHS for node 28
# node 29: type: TNT_INTCON val: 3
# child RHS for node 28
# node 30: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 21
# node 31: type: TNT_STMT
# child SEQ_CUR for node 31
# node 32: type: TNT_ASSG
# child LHS for node 32
# node 33: type: TNT_SYMBOL sym: x4
# child RHS for node 32
# node 34: type: TNT_PLUS
# child LHS for node 34
# node 35: type: TNT_PLUS
# child LHS for node 35
# node 36: type: TNT_PLUS
# child LHS for node 36
# node 37: type: TNT_INTCON val: 1
# child RHS for node 36
# node 38: type: TNT_INTCON val: 2
# child RHS for node 35
# node 39: type: TNT_INTCON val: 3
# child RHS for node 34
# node 40: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 31
# node 41: type: TNT_STMT
# child SEQ_CUR for node 41
# node 42: type: TNT_ASSG
# child LHS for node 42
# node 43: type: TNT_SYMBOL sym: x5
# child RHS for node 42
# node 44: type: TNT_MINUS
# child LHS for node 44
# node 45: type: TNT_PLUS
# child LHS for node 45
# node 46: type: TNT_INTCON val: 1
# child RHS for node 45
# node 47: type: TNT_DIV
# child LHS for node 47
# node 48: type: TNT_INTCON val: 2
# child RHS for node 47
# node 49: type: TNT_MULT
# child LHS for node 49
# node 50: type: TNT_INTCON val: 3
# child RHS for node 49
# node 51: type: TNT_INTCON val: 4
# child RHS for node 44
# node 52: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 41
# node 53: type: TNT_STMT
# child SEQ_CUR for node 53
# node 54: type: TNT_ASSG
# child LHS for node 54
# node 55: type: TNT_SYMBOL sym: x6
# child RHS for node 54
# node 56: type: TNT_MINUS
# child LHS for node 56
# node 57: type: TNT_DIV
# child LHS for node 57
# node 58: type: TNT_PLUS
# child LHS for node 58
# node 59: type: TNT_INTCON val: 1
# child RHS for node 58
# node 60: type: TNT_INTCON val: 2
# child RHS for node 57
# node 61: type: TNT_MULT
# child LHS for node 61
# node 62: type: TNT_INTCON val: 3
# child RHS for node 61
# node 63: type: TNT_INTCON val: 4
# child RHS for node 56
# node 64: type: TNT_INTCON val: 5
#-----------------------------------------------------------------------------
# STRING CONSTANTS
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:   5
# svtemps used: 0
# args used:    0
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_MOV
# -------
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
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x1)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_MOV
# -------
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
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (3)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x2)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (4)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (4)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x3)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_MOV
# -------
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
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x4)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMPORARY (4)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (3)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (4)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (2)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_SUB
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x5)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_MOV
# -------
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
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_MUL
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_DIV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (3)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (5)
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
# dest -> ST_PRIMITIVE (x6)
# src1 -> ST_TEMPORARY (2)
