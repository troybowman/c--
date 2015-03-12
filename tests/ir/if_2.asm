#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 5
# sym: f1
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
# sym: f2
#   line: 4
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
# sym: f3
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
# sym: f4
#   line: 6
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
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
# LOCAL SYMBOLS FOR FUNCTION: f1
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f1
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f2
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f2
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f3
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f3
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f4
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f4
#-----------------------------------------------------------------------------
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
# node 2: type: TNT_IF
# child IF_COND for node 2
# node 3: type: TNT_EQ
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: x
# child RHS for node 3
# node 5: type: TNT_INTCON val: 0
# child IF_BODY for node 2
# node 6: type: TNT_CALL sym: f1
# child IF_ELSE for node 2
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_IF
# child IF_COND for node 8
# node 9: type: TNT_EQ
# child LHS for node 9
# node 10: type: TNT_SYMBOL sym: x
# child RHS for node 9
# node 11: type: TNT_INTCON val: 2
# child IF_BODY for node 8
# node 12: type: TNT_CALL sym: f1
# child IF_ELSE for node 8
# node 13: type: TNT_CALL sym: f2
# child SEQ_NEXT for node 7
# node 14: type: TNT_STMT
# child SEQ_CUR for node 14
# node 15: type: TNT_CALL sym: f3
# child SEQ_NEXT for node 1
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_CALL sym: f4
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f1
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f2
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f3
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f4
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
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
# src1 -> ST_INTCON (0)
# |
# >
# CNT_SEQ
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (0)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f1)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (3)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
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
# CNT_SEQ
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (1)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f1)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (2)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f2)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f3)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (3)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f4)
