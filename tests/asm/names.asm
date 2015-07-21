#-----------------------------------------------------------------------------
# GLOBAL SYMBOL TABLE
#-----------------------------------------------------------------------------
# size: 9
# sym: print_int
#   line: 1
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       0: x
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: yes
# sym: char_at
#   line: 3
#   type: ST_FUNCTION
#     rt_type: PRIM_CHAR
#     params:
#       0: string
#         type: ST_ARRAY
#           base: PRIM_CHAR
#       1: idx
#         type: ST_PRIMITIVE
#           base: PRIM_INT
#     is_extern: no
# sym: L0
#   line: 5
#   type: ST_FUNCTION
#     rt_type: PRIM_CHAR
#     params:
#       0: string
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
# sym: L2
#   line: 6
#   type: ST_FUNCTION
#     rt_type: PRIM_CHAR
#     params:
#       0: string
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
# sym: L4
#   line: 7
#   type: ST_FUNCTION
#     rt_type: PRIM_CHAR
#     params:
#       0: string
#         type: ST_ARRAY
#           base: PRIM_CHAR
#     is_extern: no
# sym: str1
#   line: 9
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: str3
#   line: 10
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: str5
#   line: 11
#   type: ST_PRIMITIVE
#     base: PRIM_CHAR
# sym: main
#   line: 13
#   type: ST_FUNCTION
#     rt_type: PRIM_VOID
#     params:
#       none
#     is_extern: no
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: char_at
#-----------------------------------------------------------------------------
# size: 2
# sym: string
#   line: 3
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
# sym: idx
#   line: 3
#   type: ST_PRIMITIVE
#     base: PRIM_INT
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: char_at
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: string
# child AL_OFFSET for node 3
# node 4: type: TNT_SYMBOL sym: idx
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: L0
#-----------------------------------------------------------------------------
# size: 1
# sym: string
#   line: 5
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: L0
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 3
# node 4: type: TNT_ARG
# child SEQ_CUR for node 4
# node 5: type: TNT_SYMBOL sym: string
# child SEQ_NEXT for node 4
# node 6: type: TNT_ARG
# child SEQ_CUR for node 6
# node 7: type: TNT_INTCON val: 0
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: L2
#-----------------------------------------------------------------------------
# size: 1
# sym: string
#   line: 6
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: L2
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 3
# node 4: type: TNT_ARG
# child SEQ_CUR for node 4
# node 5: type: TNT_SYMBOL sym: string
# child SEQ_NEXT for node 4
# node 6: type: TNT_ARG
# child SEQ_CUR for node 6
# node 7: type: TNT_INTCON val: 2
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: L4
#-----------------------------------------------------------------------------
# size: 1
# sym: string
#   line: 7
#   type: ST_ARRAY
#     base: PRIM_CHAR
#     size: 0xffffffff
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: L4
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 3
# node 4: type: TNT_ARG
# child SEQ_CUR for node 4
# node 5: type: TNT_SYMBOL sym: string
# child SEQ_NEXT for node 4
# node 6: type: TNT_ARG
# child SEQ_CUR for node 6
# node 7: type: TNT_INTCON val: 4
#-----------------------------------------------------------------------------
# LOCAL SYMBOLS FOR FUNCTION: main
#-----------------------------------------------------------------------------
# size: 0
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: str1
# child RHS for node 2
# node 4: type: TNT_CALL sym: L0
# child CALL_ARGS for node 4
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_STRCON str: "test one"
# child SEQ_NEXT for node 1
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_ASSG
# child LHS for node 8
# node 9: type: TNT_SYMBOL sym: str3
# child RHS for node 8
# node 10: type: TNT_CALL sym: L2
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_STRCON str: "test two"
# child SEQ_NEXT for node 7
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_ASSG
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: str5
# child RHS for node 14
# node 16: type: TNT_CALL sym: L4
# child CALL_ARGS for node 16
# node 17: type: TNT_ARG
# child SEQ_CUR for node 17
# node 18: type: TNT_STRCON str: "test three"
# child SEQ_NEXT for node 13
# node 19: type: TNT_STMT
# child SEQ_CUR for node 19
# node 20: type: TNT_IF
# child IF_COND for node 20
# node 21: type: TNT_LT
# child LHS for node 21
# node 22: type: TNT_SYMBOL sym: str1
# child RHS for node 21
# node 23: type: TNT_SYMBOL sym: str3
# child IF_BODY for node 20
# node 24: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 24
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_SYMBOL sym: str1
# child IF_ELSE for node 20
# node 27: type: TNT_IF
# child IF_COND for node 27
# node 28: type: TNT_EQ
# child LHS for node 28
# node 29: type: TNT_SYMBOL sym: str5
# child RHS for node 28
# node 30: type: TNT_INTCON val: 16
# child IF_BODY for node 27
# node 31: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 31
# node 32: type: TNT_ARG
# child SEQ_CUR for node 32
# node 33: type: TNT_SYMBOL sym: str3
# child IF_ELSE for node 27
# node 34: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 34
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_SYMBOL sym: str5
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: char_at
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (idx)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (string)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: L0
#-----------------------------------------------------------------------------
# temps used:    2
# svregs used:   0
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (string)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (char_at)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: L2
#-----------------------------------------------------------------------------
# temps used:    2
# svregs used:   0
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (string)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (char_at)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: L4
#-----------------------------------------------------------------------------
# temps used:    2
# svregs used:   0
# stktemps used: 0
# regargs used:  2
# stkargs used:  0
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (string)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (1)
# src1 -> ST_TEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (char_at)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    3
# svregs used:   0
# stktemps used: 0
# regargs used:  1
# stkargs used:  0
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("test one")
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (L0)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (str1)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("test two")
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (L2)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (str3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("test three")
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# dest -> ST_RETVAL
# src1 -> ST_FUNCTION (L4)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (str5)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (str1)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_PRIMITIVE (str3)
# |
# >
# CNT_SLT
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (0)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (str1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (print_int)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (2)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (0)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (str5)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (16)
# |
# >
# CNT_SEQ
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (1)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (str3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (print_int)
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
# CNT_LB
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (str5)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (0)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (print_int)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (2)

.data

  _str1:
    .space 1
    .align 2

  _str3:
    .space 1
    .align 2

  _str5:
    .space 1
    .align 2

  _str0:
    .asciiz "test one"
    .align 2

  _str2:
    .asciiz "test two"
    .align 2

  _str4:
    .asciiz "test three"
    .align 2

.text

_char_at:

  # |--------------------------------|
  # |        <idx is in $a1>         |
  # |--------------------------------| sp+4
  # |       <string is in $a0>       |
  # |--------------------------------| sp+0  <-- start of caller's stack
  la $sp, -0($sp)

  move $t0, $a1
  move $t1, $a0
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  move $v0, $t0
  j __leave_char_at

__leave_char_at:
  la $sp, 0($sp)
  jr $ra

_L0:

  # |--------------------------------|
  # |             string             |
  # |--------------------------------| sp+24  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)

  lw $t0, 24($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _char_at
  move $t0, $v0
  move $v0, $t0
  j __leave_L0

__leave_L0:
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

_L2:

  # |--------------------------------|
  # |             string             |
  # |--------------------------------| sp+24  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)

  lw $t0, 24($sp)
  li $t1, 2
  move $a1, $t1
  move $a0, $t0
  jal _char_at
  move $t0, $v0
  move $v0, $t0
  j __leave_L2

__leave_L2:
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

_L4:

  # |--------------------------------|
  # |             string             |
  # |--------------------------------| sp+24  <-- start of caller's stack
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)

  lw $t0, 24($sp)
  li $t1, 4
  move $a1, $t1
  move $a0, $t0
  jal _char_at
  move $t0, $v0
  move $v0, $t0
  j __leave_L4

__leave_L4:
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

main:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 16($sp)

  la $t0, _str0
  move $a0, $t0
  jal _L0
  move $t0, $v0
  sb $t0, _str1
  la $t0, _str2
  move $a0, $t0
  jal _L2
  move $t0, $v0
  sb $t0, _str3
  la $t0, _str4
  move $a0, $t0
  jal _L4
  move $t0, $v0
  sb $t0, _str5
  lb $t0, _str1
  lb $t1, _str3
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lb $t0, _str1
  move $a0, $t0
  jal _print_int
  j _L5
_L1:
  lb $t0, _str5
  li $t1, 16
  seq $t2, $t0, $t1
  beq $t2, $zero, _L3
  lb $t0, _str3
  move $a0, $t0
  jal _print_int
  j _L5
_L3:
  lb $t0, _str5
  move $a0, $t0
  jal _print_int
_L5:

__leavemain:
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jal __exit

__print_string:
  li $v0, 4
  syscall
  jr $ra

__print_int:
  li $v0, 1
  syscall
  jr $ra

__print_char:
  li $v0, 11
  syscall
  jr $ra

__print_hex:
  li $v0, 34
  syscall
  jr $ra

__exit:
  li $v0, 10
  syscall
  jr $ra
