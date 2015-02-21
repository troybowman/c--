#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 4
# sym: func
#   line: 1
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
# sym: simple
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
#     is_extern: no
# sym: another
#   line: 13
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       0: one
#         type: ST_PRIMITIVE
#           base: PRIM_CHAR
#       1: two
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
# sym: main
#   line: 20
#   type: ST_FUNCTION
#     rt_type: RT_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: func
#-----------------------------------------------------------------------------
# size: 10
# sym: this
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: is
#   line: 4
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: a
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: test
#   line: 5
#   type: ST_PRIMITIVE
#     base: PRIM_INT
# sym: of
#   line: 5
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x6
# sym: our
#   line: 6
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: local
#   line: 6
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xb
# sym: var
#   line: 6
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: frame
#   line: 7
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x5
# sym: section
#   line: 8
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: func
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: simple
#-----------------------------------------------------------------------------
# size: 4
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
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: simple
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: another
#-----------------------------------------------------------------------------
# size: 6
# sym: one
#   line: 13
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: two
#   line: 13
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: array
#   line: 15
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0x3
# sym: array1
#   line: 16
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x1
# sym: array2
#   line: 16
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x0
# sym: array3
#   line: 16
#   type: ST_ARRAY
#     base: PRIM_INT
#     size: 0x3
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: another
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: simple
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
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: func
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: simple
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: another
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  4
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
# dest -> ST_REG_ARGUMENT (3)
# src1 -> ST_TEMPORARY (3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (2)
# src1 -> ST_TEMPORARY (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (1)
# src1 -> ST_TEMPORARY (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REG_ARGUMENT (0)
# src1 -> ST_TEMPORARY (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (simple)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0

.data

.text

_func:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+84
  # |            section             |
  # |--------------------------------| sp+80
  # |             frame              |
  # |--------------------------------| sp+60
  # |              var               |
  # |--------------------------------| sp+56
  # |             local              |
  # |--------------------------------| sp+44
  # |              our               |
  # |--------------------------------| sp+40
  # |               of               |
  # |--------------------------------| sp+16
  # |              test              |
  # |--------------------------------| sp+12
  # |               a                |
  # |--------------------------------| sp+8
  # |               is               |
  # |--------------------------------| sp+4
  # |              this              |
  # |--------------------------------| sp+0
  la $sp, -88($sp)


__leave_func:
  la $sp, 88($sp)
  jr $ra

_simple:

  # |--------------------------------|
  # |        <four is in $a3>        |
  # |--------------------------------| sp+12
  # |       <three is in $a2>        |
  # |--------------------------------| sp+8
  # |        <two is in $a1>         |
  # |--------------------------------| sp+4
  # |        <one is in $a0>         |
  # |--------------------------------| sp+0  <-- start of caller's stack
  la $sp, -0($sp)


__leave_simple:
  la $sp, 0($sp)
  jr $ra

_another:

  # |--------------------------------|
  # |              two               |
  # |--------------------------------| sp+52
  # |              one               |
  # |--------------------------------| sp+48  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+44
  # |             array3             |
  # |--------------------------------| sp+32
  # |             array2             |
  # |--------------------------------| sp+32
  # |             array1             |
  # |--------------------------------| sp+28
  # |             array              |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -48($sp)
  sw $ra, 16($sp)
  sw $a0, 48($sp)
  sw $a1, 52($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _simple

__leave_another:
  lw $ra, 16($sp)
  la $sp, 48($sp)
  jr $ra

main:

  # |--------------------------------|
  la $sp, -0($sp)


__leavemain:
  la $sp, 0($sp)
  jr $ra
