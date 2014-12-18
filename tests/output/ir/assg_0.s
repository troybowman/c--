#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 3
# sym: g1
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: g2
#   line: 4
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xa
# sym: main
#   line: 6
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 2
# sym: l1
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: l2
#   line: 8
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xa
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: g1
# child RHS for node 2
# node 4: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_ARRAY_LOOKUP sym: g2
# child AL_OFFSET for node 7
# node 8: type: TNT_INTCON val: 0
# child RHS for node 6
# node 9: type: TNT_CHARCON str: 'a'
# child SEQ_NEXT for node 5
# node 10: type: TNT_STMT
# child SEQ_CUR for node 10
# node 11: type: TNT_ASSG
# child LHS for node 11
# node 12: type: TNT_SYMBOL sym: l1
# child RHS for node 11
# node 13: type: TNT_INTCON val: 5555
# child SEQ_NEXT for node 10
# node 14: type: TNT_STMT
# child SEQ_CUR for node 14
# node 15: type: TNT_ASSG
# child LHS for node 15
# node 16: type: TNT_ARRAY_LOOKUP sym: l2
# child AL_OFFSET for node 16
# node 17: type: TNT_INTCON val: 10
# child RHS for node 15
# node 18: type: TNT_ARRAY_LOOKUP sym: g2
# child AL_OFFSET for node 18
# node 19: type: TNT_INTCON val: 3
#-----------------------------------------------------------------------------
# STRING CONSTANTS
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:   4
# svtemps used: 0
# args used:    0
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_IMMEDIATE_INT (5)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (g1)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_IMMEDIATE_CHAR ('a')
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_IMMEDIATE_INT (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_ARRAY (g2)
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
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_IMMEDIATE_INT (5555)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (l1)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_IMMEDIATE_INT (3)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_ARRAY (g2)
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
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_IMMEDIATE_INT (10)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_ARRAY (l2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (2)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (0)
# c-- exited with code: 0
