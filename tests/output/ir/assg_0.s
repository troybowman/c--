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
# size: 1
# sym: x
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
# node 3: type: TNT_SYMBOL sym: x
# child RHS for node 2
# node 4: type: TNT_INTCON val: 5
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# CNT_MOV
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_IMMEDIATE_INT (5)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (x)
# src1 -> ST_TEMPORARY (0)
# c-- exited with code: 0
