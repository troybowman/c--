#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 4
# sym: f1
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       none
#     is_extern: no
# sym: f2
#   line: 4
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       none
#     is_extern: no
# sym: f3
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_INT
#     params:
#       none
#     is_extern: no
# sym: main
#   line: 7
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
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_INTCON val: 1
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f2
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f2
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_INTCON val: 2
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f3
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f3
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_INTCON val: 3
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 1
# sym: x
#   line: 9
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
# node 5: type: TNT_INTCON val: 1
# child IF_BODY for node 2
# node 6: type: TNT_IF
# child IF_COND for node 6
# node 7: type: TNT_EQ
# child LHS for node 7
# node 8: type: TNT_SYMBOL sym: x
# child RHS for node 7
# node 9: type: TNT_INTCON val: 2
# child IF_BODY for node 6
# node 10: type: TNT_IF
# child IF_COND for node 10
# node 11: type: TNT_EQ
# child LHS for node 11
# node 12: type: TNT_SYMBOL sym: x
# child RHS for node 11
# node 13: type: TNT_INTCON val: 3
# child IF_BODY for node 10
# node 14: type: TNT_IF
# child IF_COND for node 14
# node 15: type: TNT_EQ
# child LHS for node 15
# node 16: type: TNT_SYMBOL sym: x
# child RHS for node 15
# node 17: type: TNT_INTCON val: 4
# child IF_BODY for node 14
# node 18: type: TNT_IF
# child IF_COND for node 18
# node 19: type: TNT_EQ
# child LHS for node 19
# node 20: type: TNT_SYMBOL sym: x
# child RHS for node 19
# node 21: type: TNT_INTCON val: 5
# child IF_BODY for node 18
# node 22: type: TNT_STMT
# child SEQ_CUR for node 22
# node 23: type: TNT_IF
# child IF_COND for node 23
# node 24: type: TNT_EQ
# child LHS for node 24
# node 25: type: TNT_SYMBOL sym: x
# child RHS for node 24
# node 26: type: TNT_INTCON val: 6
# child IF_BODY for node 23
# node 27: type: TNT_IF
# child IF_COND for node 27
# node 28: type: TNT_EQ
# child LHS for node 28
# node 29: type: TNT_SYMBOL sym: x
# child RHS for node 28
# node 30: type: TNT_INTCON val: 7
# child IF_BODY for node 27
# node 31: type: TNT_IF
# child IF_COND for node 31
# node 32: type: TNT_EQ
# child LHS for node 32
# node 33: type: TNT_SYMBOL sym: x
# child RHS for node 32
# node 34: type: TNT_INTCON val: 8
# child IF_BODY for node 31
# node 35: type: TNT_ASSG
# child LHS for node 35
# node 36: type: TNT_SYMBOL sym: x
# child RHS for node 35
# node 37: type: TNT_CALL sym: f1
# child SEQ_NEXT for node 22
# node 38: type: TNT_STMT
# child SEQ_CUR for node 38
# node 39: type: TNT_ASSG
# child LHS for node 39
# node 40: type: TNT_SYMBOL sym: x
# child RHS for node 39
# node 41: type: TNT_CALL sym: f2
# child IF_ELSE for node 18
# node 42: type: TNT_STMT
# child SEQ_CUR for node 42
# node 43: type: TNT_IF
# child IF_COND for node 43
# node 44: type: TNT_EQ
# child LHS for node 44
# node 45: type: TNT_SYMBOL sym: x
# child RHS for node 44
# node 46: type: TNT_INTCON val: 9
# child IF_BODY for node 43
# node 47: type: TNT_IF
# child IF_COND for node 47
# node 48: type: TNT_EQ
# child LHS for node 48
# node 49: type: TNT_SYMBOL sym: x
# child RHS for node 48
# node 50: type: TNT_INTCON val: 10
# child IF_BODY for node 47
# node 51: type: TNT_IF
# child IF_COND for node 51
# node 52: type: TNT_EQ
# child LHS for node 52
# node 53: type: TNT_SYMBOL sym: x
# child RHS for node 52
# node 54: type: TNT_INTCON val: 11
# child IF_BODY for node 51
# node 55: type: TNT_ASSG
# child LHS for node 55
# node 56: type: TNT_SYMBOL sym: x
# child RHS for node 55
# node 57: type: TNT_CALL sym: f1
# child SEQ_NEXT for node 42
# node 58: type: TNT_STMT
# child SEQ_CUR for node 58
# node 59: type: TNT_ASSG
# child LHS for node 59
# node 60: type: TNT_SYMBOL sym: x
# child RHS for node 59
# node 61: type: TNT_CALL sym: f2
# child SEQ_NEXT for node 1
# node 62: type: TNT_STMT
# child SEQ_CUR for node 62
# node 63: type: TNT_ASSG
# child LHS for node 63
# node 64: type: TNT_SYMBOL sym: x
# child RHS for node 63
# node 65: type: TNT_CALL sym: f3
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f1
#-----------------------------------------------------------------------------
# temps used:    1
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
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f2
#-----------------------------------------------------------------------------
# temps used:    1
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f3
#-----------------------------------------------------------------------------
# temps used:    1
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMPORARY (0)
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
# src1 -> ST_INTCON (1)
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
# dest -> ST_LABEL (3)
# src1 -> ST_TEMPORARY (2)
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
# dest -> ST_LABEL (3)
# src1 -> ST_TEMPORARY (2)
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
# src1 -> ST_INTCON (3)
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
# dest -> ST_LABEL (3)
# src1 -> ST_TEMPORARY (2)
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
# src1 -> ST_INTCON (4)
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
# dest -> ST_LABEL (3)
# src1 -> ST_TEMPORARY (2)
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
# src1 -> ST_INTCON (5)
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
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (6)
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
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (7)
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
# CNT_LW
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (1)
# src1 -> ST_INTCON (8)
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
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (f1)
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
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (f2)
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
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (3)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (1)
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
# src1 -> ST_INTCON (9)
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
# dest -> ST_LABEL (2)
# src1 -> ST_TEMPORARY (2)
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
# src1 -> ST_INTCON (10)
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
# dest -> ST_LABEL (2)
# src1 -> ST_TEMPORARY (2)
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
# src1 -> ST_INTCON (11)
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
# dest -> ST_LABEL (2)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (f1)
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
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (2)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (f2)
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
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (3)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (f3)
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
