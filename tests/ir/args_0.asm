#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: right_back
#-----------------------------------------------------------------------------
# temps used:    1
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LW
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_PRIMITIVE (x)
# |
# >
# CNT_RET
# -------
# dest -> ST_RETVAL
# src1 -> ST_TEMP (0)
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: num_at
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
# CNT_SLL
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_TEMP (0)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (array)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_LW
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
# INTERMEDIATE CODE FOR FUNCTION: bunch
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: blip
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: stuff
#-----------------------------------------------------------------------------
# temps used:    7
# svregs used:   3
# stktemps used: 0
# regargs used:  4
# stkargs used:  6
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (5)
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
# src1 -> ST_FUNCTION (right_back)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (gint)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('a')
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
# src1 -> ST_FUNCTION (right_back)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (gint)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_ARRAY (larray)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (6)
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
# src1 -> ST_FUNCTION (num_at)
# |
# >
# CNT_MOV
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_RETVAL
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (lint)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("hello")
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (16)
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
# CNT_SB
# ------
# dest -> ST_PRIMITIVE (gchar)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (0)
# src1 -> ST_STRCON ("one")
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (larray)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_CHARCON ('3')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_INTCON (4)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (4)
# src1 -> ST_ARRAY (larray)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (5)
# src1 -> ST_INTCON (6)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (6)
# src1 -> ST_INTCON (7)
# |
# >
# CNT_LI
# ------
# dest -> ST_SVTEMP (0)
# src1 -> ST_CHARCON ('8')
# |
# >
# CNT_LEA
# -------
# dest -> ST_SVTEMP (1)
# src1 -> ST_STRCON ("nine")
# |
# >
# CNT_LI
# ------
# dest -> ST_SVTEMP (2)
# src1 -> ST_INTCON (10)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (5)
# src1 -> ST_SVTEMP (2)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (4)
# src1 -> ST_SVTEMP (1)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (3)
# src1 -> ST_SVTEMP (0)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (2)
# src1 -> ST_TEMP (6)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (1)
# src1 -> ST_TEMP (5)
# |
# >
# CNT_ARG
# -------
# dest -> ST_STKARG (0)
# src1 -> ST_TEMP (4)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (3)
# src1 -> ST_TEMP (3)
# |
# >
# CNT_ARG
# -------
# dest -> ST_REGARG (2)
# src1 -> ST_TEMP (2)
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
# src1 -> ST_FUNCTION (bunch)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (500000)
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
# src1 -> ST_FUNCTION (blip)

.data

  _gint:
    .space 4

  _gchar:
    .space 1
    .align 2

  _str0:
    .asciiz "hello"
    .align 2

  _str1:
    .asciiz "one"
    .align 2

  _str2:
    .asciiz "nine"
    .align 2

.text

_right_back:

  # |--------------------------------|
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  move $v0, $t0
  j __leave_right_back

__leave_right_back:
  jr $ra

_num_at:

  # |--------------------------------|
  # |        <idx is in $a1>         |
  # |--------------------------------| sp+4
  # |       <array is in $a0>        |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a1
  sll $t1, $t0, 2
  move $t0, $a0
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $v0, $t0
  j __leave_num_at

__leave_num_at:
  jr $ra

_char_at:

  # |--------------------------------|
  # |        <idx is in $a1>         |
  # |--------------------------------| sp+4
  # |       <string is in $a0>       |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a1
  move $t1, $a0
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  move $v0, $t0
  j __leave_char_at

__leave_char_at:
  jr $ra

_bunch:

  # |--------------------------------|
  # |              ten               |
  # |--------------------------------| sp+36
  # |              nine              |
  # |--------------------------------| sp+32
  # |             eight              |
  # |--------------------------------| sp+28
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
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_bunch:
  jr $ra

_blip:

  # |--------------------------------|
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_blip:
  jr $ra

_stuff:

  # |--------------------------------|
  # |              $a3               |
  # |--------------------------------| sp+2076
  # |              $a2               |
  # |--------------------------------| sp+2072
  # |              $a1               |
  # |--------------------------------| sp+2068
  # |              $a0               |
  # |--------------------------------| sp+2064  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+2060
  # |              lint              |
  # |--------------------------------| sp+2056
  # |             larray             |
  # |--------------------------------| sp+56
  # |              $ra               |
  # |--------------------------------| sp+52
  # |              $s2               |
  # |--------------------------------| sp+48
  # |              $s1               |
  # |--------------------------------| sp+44
  # |              $s0               |
  # |--------------------------------| sp+40
  # |           <stkarg 5>           |
  # |--------------------------------| sp+36
  # |           <stkarg 4>           |
  # |--------------------------------| sp+32
  # |           <stkarg 3>           |
  # |--------------------------------| sp+28
  # |           <stkarg 2>           |
  # |--------------------------------| sp+24
  # |           <stkarg 1>           |
  # |--------------------------------| sp+20
  # |           <stkarg 0>           |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -2064($sp)
  sw $s0, 40($sp)
  sw $s1, 44($sp)
  sw $s2, 48($sp)
  sw $ra, 52($sp)
  sw $a0, 2064($sp)
  sw $a1, 2068($sp)
  sw $a2, 2072($sp)
  sw $a3, 2076($sp)

  li $t0, 5
  move $a0, $t0
  jal _right_back
  move $t0, $v0
  sw $t0, _gint
  li $t0, 'a'
  move $a0, $t0
  jal _right_back
  move $t0, $v0
  sw $t0, _gint
  la $t0, 56($sp)
  li $t1, 6
  move $a1, $t1
  move $a0, $t0
  jal _num_at
  move $t0, $v0
  sw $t0, 2056($sp)
  la $t0, _str0
  li $t1, 16
  move $a1, $t1
  move $a0, $t0
  jal _char_at
  move $t0, $v0
  sb $t0, _gchar
  la $t0, _str1
  la $t1, 56($sp)
  li $t2, '3'
  li $t3, 4
  la $t4, 56($sp)
  li $t5, 6
  li $t6, 7
  li $s0, '8'
  la $s1, _str2
  li $s2, 10
  sw $s2, 36($sp)
  sw $s1, 32($sp)
  sw $s0, 28($sp)
  sw $t6, 24($sp)
  sw $t5, 20($sp)
  sw $t4, 16($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _bunch
  li $t0, 500000
  move $a0, $t0
  jal _blip

__leave_stuff:
  lw $a3, 2076($sp)
  lw $a2, 2072($sp)
  lw $a1, 2068($sp)
  lw $a0, 2064($sp)
  lw $ra, 52($sp)
  lw $s2, 48($sp)
  lw $s1, 44($sp)
  lw $s0, 40($sp)
  la $sp, 2064($sp)
  jr $ra

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
