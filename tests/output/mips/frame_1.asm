#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 15
# sym: f0
#   line: 1
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: one
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: f1
#   line: 2
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: f2
#   line: 3
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: one
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: two
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: f3
#   line: 4
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: f4
#   line: 5
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: one
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: two
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       2: three
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: f5
#   line: 6
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: f6
#   line: 7
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: one
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: two
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       2: three
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       3: four
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: f7
#   line: 8
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: f8
#   line: 9
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: one
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: two
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       2: three
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       3: four
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       4: five
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: f9
#   line: 10
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: f10
#   line: 11
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: one
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: two
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       2: three
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       3: four
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       4: five
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       5: six
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: f11
#   line: 12
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: f12
#   line: 13
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: one
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       1: two
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       2: three
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       3: four
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       4: five
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       5: six
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#       6: seven
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: f13
#   line: 14
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: main
#   line: 15
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f0
#-----------------------------------------------------------------------------
# size: 1
# sym: one
#   line: 1
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f0
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f1
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f1
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: f0
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_INTCON val: 1
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f2
#-----------------------------------------------------------------------------
# size: 2
# sym: one
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: two
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
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
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: f2
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 3
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_INTCON val: 2
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f4
#-----------------------------------------------------------------------------
# size: 3
# sym: one
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: two
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: three
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
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
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: f4
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 3
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 5
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_INTCON val: 3
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f6
#-----------------------------------------------------------------------------
# size: 4
# sym: one
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: two
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: three
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: four
#   line: 7
#   type: ST_PRIMITIVE
#     base: PRIM_INT
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
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: f6
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 3
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 5
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 7
# node 9: type: TNT_ARG
# child SEQ_CUR for node 9
# node 10: type: TNT_INTCON val: 4
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f8
#-----------------------------------------------------------------------------
# size: 5
# sym: one
#   line: 9
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: two
#   line: 9
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: three
#   line: 9
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: four
#   line: 9
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: five
#   line: 9
#   type: ST_PRIMITIVE
#     base: PRIM_INT
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
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: f8
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 3
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 5
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 7
# node 9: type: TNT_ARG
# child SEQ_CUR for node 9
# node 10: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 9
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_INTCON val: 5
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f10
#-----------------------------------------------------------------------------
# size: 6
# sym: one
#   line: 11
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: two
#   line: 11
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: three
#   line: 11
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: four
#   line: 11
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: five
#   line: 11
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: six
#   line: 11
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f10
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f11
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f11
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: f10
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 3
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 5
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 7
# node 9: type: TNT_ARG
# child SEQ_CUR for node 9
# node 10: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 9
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 11
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_INTCON val: 6
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f12
#-----------------------------------------------------------------------------
# size: 7
# sym: one
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: two
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: three
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: four
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: five
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: six
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: seven
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f12
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: f13
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: f13
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: f12
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 3
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 5
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 7
# node 9: type: TNT_ARG
# child SEQ_CUR for node 9
# node 10: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 9
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 11
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_INTCON val: 6
# child SEQ_NEXT for node 13
# node 15: type: TNT_ARG
# child SEQ_CUR for node 15
# node 16: type: TNT_INTCON val: 7
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f0
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f1
#-----------------------------------------------------------------------------
# temps used:   1
# svtemps used: 0
# args used:    1
# CNT_LI
# ------
# dest -> ST_TEMPORARY (0)
# src1 -> ST_INTCON (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f2
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f3
#-----------------------------------------------------------------------------
# temps used:   2
# svtemps used: 0
# args used:    2
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
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (1)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f2)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f4
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f5
#-----------------------------------------------------------------------------
# temps used:   3
# svtemps used: 0
# args used:    3
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
# CNT_LI
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (2)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (1)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f4)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f6
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f7
#-----------------------------------------------------------------------------
# temps used:   4
# svtemps used: 0
# args used:    4
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
# CNT_LI
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (3)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (2)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (1)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f6)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f8
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f9
#-----------------------------------------------------------------------------
# temps used:   5
# svtemps used: 0
# args used:    5
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
# CNT_LI
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (4)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (4)
# src1 -> ST_TEMPORARY (4)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (3)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (2)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (1)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f8)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f10
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f11
#-----------------------------------------------------------------------------
# temps used:   6
# svtemps used: 0
# args used:    6
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
# CNT_LI
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (4)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (5)
# src1 -> ST_INTCON (6)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (5)
# src1 -> ST_TEMPORARY (5)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (4)
# src1 -> ST_TEMPORARY (4)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (3)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (2)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (1)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f10)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f12
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f13
#-----------------------------------------------------------------------------
# temps used:   7
# svtemps used: 0
# args used:    7
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
# CNT_LI
# ------
# dest -> ST_TEMPORARY (2)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (3)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMPORARY (4)
# src1 -> ST_INTCON (5)
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
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (6)
# src1 -> ST_TEMPORARY (6)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (5)
# src1 -> ST_TEMPORARY (5)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (4)
# src1 -> ST_TEMPORARY (4)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (3)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (2)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (1)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f12)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:   0
# svtemps used: 0
# args used:    0

.data

.text

_f0:

  # STACK FRAME SUMMARY:
  # |--------------------------------|
  # |        <one is in $a0>         |
  # |--------------------------------| sp+0
  la $sp, -0($sp)

__leave_f0:
  la $sp, 0($sp)
  jr $ra

_f1:

  # STACK FRAME SUMMARY:
  # |--------------------------------|
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -20($sp)
  sw $ra, 16($sp)

__leave_f1:
  lw $ra, 16($sp)
  la $sp, 20($sp)
  jr $ra

_f2:

  # STACK FRAME SUMMARY:
  # |--------------------------------|
  # |        <two is in $a1>         |
  # |--------------------------------| sp+4
  # |        <one is in $a0>         |
  # |--------------------------------| sp+0
  la $sp, -0($sp)

__leave_f2:
  la $sp, 0($sp)
  jr $ra

_f3:

  # STACK FRAME SUMMARY:
  # |--------------------------------|
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -20($sp)
  sw $ra, 16($sp)

__leave_f3:
  lw $ra, 16($sp)
  la $sp, 20($sp)
  jr $ra

_f4:

  # STACK FRAME SUMMARY:
  # |--------------------------------|
  # |       <three is in $a2>        |
  # |--------------------------------| sp+8
  # |        <two is in $a1>         |
  # |--------------------------------| sp+4
  # |        <one is in $a0>         |
  # |--------------------------------| sp+0
  la $sp, -0($sp)

__leave_f4:
  la $sp, 0($sp)
  jr $ra

_f5:

  # STACK FRAME SUMMARY:
  # |--------------------------------|
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -20($sp)
  sw $ra, 16($sp)

__leave_f5:
  lw $ra, 16($sp)
  la $sp, 20($sp)
  jr $ra

_f6:

  # STACK FRAME SUMMARY:
  # |--------------------------------|
  # |        <four is in $a3>        |
  # |--------------------------------| sp+12
  # |       <three is in $a2>        |
  # |--------------------------------| sp+8
  # |        <two is in $a1>         |
  # |--------------------------------| sp+4
  # |        <one is in $a0>         |
  # |--------------------------------| sp+0
  la $sp, -0($sp)

__leave_f6:
  la $sp, 0($sp)
  jr $ra

_f7:

  # STACK FRAME SUMMARY:
  # |--------------------------------|
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -20($sp)
  sw $ra, 16($sp)

__leave_f7:
  lw $ra, 16($sp)
  la $sp, 20($sp)
  jr $ra

_f8:

  # STACK FRAME SUMMARY:
  # |--------------------------------|
  # |              five              |
  # |--------------------------------| sp+16
  # |        <four is in $a3>        |
  # |--------------------------------| sp+12
  # |       <three is in $a2>        |
  # |--------------------------------| sp+8
  # |        <two is in $a1>         |
  # |--------------------------------| sp+4
  # |        <one is in $a0>         |
  # |--------------------------------| sp+0
  la $sp, -0($sp)

__leave_f8:
  la $sp, 0($sp)
  jr $ra

_f9:

  # STACK FRAME SUMMARY:
  # |--------------------------------|
  # |              $ra               |
  # |--------------------------------| sp+20
  # |             <arg4>             |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 20($sp)

__leave_f9:
  lw $ra, 20($sp)
  la $sp, 24($sp)
  jr $ra

_f10:

  # STACK FRAME SUMMARY:
  # |--------------------------------|
  # |              six               |
  # |--------------------------------| sp+20
  # |              five              |
  # |--------------------------------| sp+16
  # |        <four is in $a3>        |
  # |--------------------------------| sp+12
  # |       <three is in $a2>        |
  # |--------------------------------| sp+8
  # |        <two is in $a1>         |
  # |--------------------------------| sp+4
  # |        <one is in $a0>         |
  # |--------------------------------| sp+0
  la $sp, -0($sp)

__leave_f10:
  la $sp, 0($sp)
  jr $ra

_f11:

  # STACK FRAME SUMMARY:
  # |--------------------------------|
  # |              $ra               |
  # |--------------------------------| sp+24
  # |             <arg5>             |
  # |--------------------------------| sp+20
  # |             <arg4>             |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -28($sp)
  sw $ra, 24($sp)

__leave_f11:
  lw $ra, 24($sp)
  la $sp, 28($sp)
  jr $ra

_f12:

  # STACK FRAME SUMMARY:
  # |--------------------------------|
  # |             seven              |
  # |--------------------------------| sp+24
  # |              six               |
  # |--------------------------------| sp+20
  # |              five              |
  # |--------------------------------| sp+16
  # |        <four is in $a3>        |
  # |--------------------------------| sp+12
  # |       <three is in $a2>        |
  # |--------------------------------| sp+8
  # |        <two is in $a1>         |
  # |--------------------------------| sp+4
  # |        <one is in $a0>         |
  # |--------------------------------| sp+0
  la $sp, -0($sp)

__leave_f12:
  la $sp, 0($sp)
  jr $ra

_f13:

  # STACK FRAME SUMMARY:
  # |--------------------------------|
  # |              $ra               |
  # |--------------------------------| sp+28
  # |             <arg6>             |
  # |--------------------------------| sp+24
  # |             <arg5>             |
  # |--------------------------------| sp+20
  # |             <arg4>             |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 28($sp)

__leave_f13:
  lw $ra, 28($sp)
  la $sp, 32($sp)
  jr $ra

_main:

  # STACK FRAME SUMMARY:
  # |--------------------------------|
  la $sp, -0($sp)

__leave_main:
  la $sp, 0($sp)
  jr $ra
