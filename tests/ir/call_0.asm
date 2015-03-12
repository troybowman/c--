#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 4
# sym: empty1
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
# sym: empty2
#   line: 4
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
# sym: gimme5
#   line: 6
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       none
#     is_extern: no
# sym: main
#   line: 8
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: empty1
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: empty1
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: empty2
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: empty2
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: gimme5
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: gimme5
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_INTCON val: 5
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 10
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: empty1
# child SEQ_NEXT for node 1
# node 3: type: TNT_STMT
# child SEQ_CUR for node 3
# node 4: type: TNT_CALL sym: empty2
# child SEQ_NEXT for node 3
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: x
# child RHS for node 6
# node 8: type: TNT_CALL sym: gimme5
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: empty1
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: empty2
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_RET
# -------
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: gimme5
#-----------------------------------------------------------------------------
# temps used:    1
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    1
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (empty1)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (empty2)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (gimme5)
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
