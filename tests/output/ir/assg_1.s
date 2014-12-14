#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 2
# sym: main
#   line: 5
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: x
#   line: 3
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0xa
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 2
# sym: y
#   line: 7
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x14
# sym: z
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: z
# child RHS for node 2
# node 4: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 4
# node 5: type: TNT_SYMBOL sym: z
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 8
# node 9: type: TNT_SYMBOL sym: z
# child RHS for node 7
# node 10: type: TNT_SYMBOL sym: z
# child SEQ_NEXT for node 6
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_ASSG
# child LHS for node 12
# node 13: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 13
# node 14: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 14
# node 15: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 15
# node 16: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 16
# node 17: type: TNT_SYMBOL sym: z
# child RHS for node 12
# node 18: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 18
# node 19: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 19
# node 20: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 20
# node 21: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 21
# node 22: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 22
# node 23: type: TNT_INTCON val: 3
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# max temps: 4
# CNT_LB
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_LEA
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (1)
# src2 -> ST_TEMPORARY (0)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (z)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMPORARY (4)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMPORARY (5)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_LEA
# ------
# dest -> ST_TEMPORARY (6)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# ------
# dest -> ST_TEMPORARY (7)
# src1 -> ST_TEMPORARY (6)
# src2 -> ST_TEMPORARY (5)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMPORARY (7)
# src1 -> ST_TEMPORARY (4)
# |
# >
# CNT_MOV
# ------
# dest -> ST_TEMPORARY (8)
# src1 -> ST_IMMEDIATE_INT (3)
# |
# >
# CNT_LEA
# ------
# dest -> ST_TEMPORARY (9)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# ------
# dest -> ST_TEMPORARY (10)
# src1 -> ST_TEMPORARY (9)
# src2 -> ST_TEMPORARY (8)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMPORARY (11)
# src1 -> ST_TEMPORARY (10)
# |
# >
# CNT_LEA
# ------
# dest -> ST_TEMPORARY (12)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# ------
# dest -> ST_TEMPORARY (13)
# src1 -> ST_TEMPORARY (12)
# src2 -> ST_TEMPORARY (11)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (14)
# src1 -> ST_TEMPORARY (13)
# |
# >
# CNT_LEA
# ------
# dest -> ST_TEMPORARY (15)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# ------
# dest -> ST_TEMPORARY (16)
# src1 -> ST_TEMPORARY (15)
# src2 -> ST_TEMPORARY (14)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (17)
# src1 -> ST_TEMPORARY (16)
# |
# >
# CNT_LEA
# ------
# dest -> ST_TEMPORARY (18)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# ------
# dest -> ST_TEMPORARY (19)
# src1 -> ST_TEMPORARY (18)
# src2 -> ST_TEMPORARY (17)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (20)
# src1 -> ST_TEMPORARY (19)
# |
# >
# CNT_LEA
# ------
# dest -> ST_TEMPORARY (21)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# ------
# dest -> ST_TEMPORARY (22)
# src1 -> ST_TEMPORARY (21)
# src2 -> ST_TEMPORARY (20)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (23)
# src1 -> ST_TEMPORARY (22)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMPORARY (24)
# src1 -> ST_PRIMITIVE (z)
# |
# >
# CNT_LEA
# ------
# dest -> ST_TEMPORARY (25)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# ------
# dest -> ST_TEMPORARY (26)
# src1 -> ST_TEMPORARY (25)
# src2 -> ST_TEMPORARY (24)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (27)
# src1 -> ST_TEMPORARY (26)
# |
# >
# CNT_LEA
# ------
# dest -> ST_TEMPORARY (28)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# ------
# dest -> ST_TEMPORARY (29)
# src1 -> ST_TEMPORARY (28)
# src2 -> ST_TEMPORARY (27)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMPORARY (30)
# src1 -> ST_TEMPORARY (29)
# |
# >
# CNT_LEA
# ------
# dest -> ST_TEMPORARY (31)
# src1 -> ST_ARRAY (x)
# |
# >
# CNT_ADD
# ------
# dest -> ST_TEMPORARY (32)
# src1 -> ST_TEMPORARY (31)
# src2 -> ST_TEMPORARY (30)
# |
# >
# CNT_LW
# ------
# dest -> ST_TEMPORARY (33)
# src1 -> ST_TEMPORARY (32)
# |
# >
# CNT_LEA
# ------
# dest -> ST_TEMPORARY (34)
# src1 -> ST_ARRAY (y)
# |
# >
# CNT_ADD
# ------
# dest -> ST_TEMPORARY (35)
# src1 -> ST_TEMPORARY (34)
# src2 -> ST_TEMPORARY (33)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMPORARY (35)
# src1 -> ST_TEMPORARY (23)
# c-- exited with code: 0
