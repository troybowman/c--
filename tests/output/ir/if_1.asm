#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 10
# sym: f1
#   line: 3
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: f2
#   line: 4
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: f3
#   line: 5
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: f4
#   line: 6
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: f5
#   line: 7
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: f6
#   line: 8
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: f7
#   line: 9
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: f8
#   line: 10
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: f9
#   line: 11
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: main
#   line: 13
#   type: ST_FUNCTION
#     rt_type: RT_VOID
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
# LOCAL SYMBOLS FOR FUNCTION: f5
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f5
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f6
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f6
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f7
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f7
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f8
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f8
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f9
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f9
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_IF
# child IF_COND for node 2
# node 3: type: TNT_LT
# child LHS for node 3
# node 4: type: TNT_INTCON val: 111
# child RHS for node 3
# node 5: type: TNT_INTCON val: 222
# child IF_BODY for node 2
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_CALL sym: f1
# child SEQ_NEXT for node 1
# node 8: type: TNT_STMT
# child SEQ_CUR for node 8
# node 9: type: TNT_IF
# child IF_COND for node 9
# node 10: type: TNT_EQ
# child LHS for node 10
# node 11: type: TNT_INTCON val: 333
# child RHS for node 10
# node 12: type: TNT_INTCON val: 444
# child IF_BODY for node 9
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_CALL sym: f2
# child IF_ELSE for node 9
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_CALL sym: f3
# child SEQ_NEXT for node 8
# node 17: type: TNT_STMT
# child SEQ_CUR for node 17
# node 18: type: TNT_IF
# child IF_COND for node 18
# node 19: type: TNT_NEQ
# child LHS for node 19
# node 20: type: TNT_INTCON val: 555
# child RHS for node 19
# node 21: type: TNT_INTCON val: 666
# child IF_BODY for node 18
# node 22: type: TNT_CALL sym: f4
# child IF_ELSE for node 18
# node 23: type: TNT_STMT
# child SEQ_CUR for node 23
# node 24: type: TNT_IF
# child IF_COND for node 24
# node 25: type: TNT_GEQ
# child LHS for node 25
# node 26: type: TNT_INTCON val: 777
# child RHS for node 25
# node 27: type: TNT_INTCON val: 888
# child IF_BODY for node 24
# node 28: type: TNT_CALL sym: f5
# child IF_ELSE for node 24
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_IF
# child IF_COND for node 30
# node 31: type: TNT_LEQ
# child LHS for node 31
# node 32: type: TNT_INTCON val: 999
# child RHS for node 31
# node 33: type: TNT_INTCON val: 1000
# child IF_BODY for node 30
# node 34: type: TNT_CALL sym: f6
# child IF_ELSE for node 30
# node 35: type: TNT_STMT
# child SEQ_CUR for node 35
# node 36: type: TNT_CALL sym: f7
# child SEQ_NEXT for node 17
# node 37: type: TNT_STMT
# child SEQ_CUR for node 37
# node 38: type: TNT_IF
# child IF_COND for node 38
# node 39: type: TNT_EQ
# child LHS for node 39
# node 40: type: TNT_INTCON val: 1001
# child RHS for node 39
# node 41: type: TNT_INTCON val: 1002
# child IF_BODY for node 38
# node 42: type: TNT_CALL sym: f8
# child IF_ELSE for node 38
# node 43: type: TNT_STMT
# child SEQ_CUR for node 43
# node 44: type: TNT_IF
# child IF_COND for node 44
# node 45: type: TNT_NEQ
# child LHS for node 45
# node 46: type: TNT_INTCON val: 1003
# child RHS for node 45
# node 47: type: TNT_INTCON val: 1004
# child IF_BODY for node 44
# node 48: type: TNT_CALL sym: f9
#-----------------------------------------------------------------------------
# STRING CONSTANTS
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f1
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f2
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f3
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f4
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f5
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f6
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f7
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f8
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f9
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:   3
# svtemps used: 0
# args used:    0
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (111)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (222)
# |
# >
# CNT_SLT
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
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (333)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (444)
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
# src1 -> ST_FUNCTION (f2)
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
# src1 -> ST_FUNCTION (f3)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (2)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (555)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (666)
# |
# >
# CNT_SNE
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (3)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f4)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (8)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (3)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (777)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (888)
# |
# >
# CNT_SGE
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (4)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f5)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (7)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (4)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (999)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1000)
# |
# >
# CNT_SLE
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (5)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f6)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (6)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (5)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f7)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (6)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (7)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (8)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1001)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1002)
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
# dest -> ST_LABEL (9)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f8)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (11)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (9)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1003)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (1004)
# |
# >
# CNT_SNE
# -------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_TEMPORARY (0)
# src2 -> ST_TEMPORARY (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (10)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f9)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (10)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (11)