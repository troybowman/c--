#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# temps used:    4
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (5)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (g1)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_CHARCON ('a')
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (0)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_ARRAY (g2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (2)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_SB
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (5555)
# |
# >
# CNT_SW
# ------
# dest -> ST_PRIMITIVE (l1)
# src1 -> ST_TEMP (0)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (3)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (g2)
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
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (10)
# |
# >
# CNT_SLL
# ------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (1)
# src2 -> ST_INTCON (2)
# |
# >
# CNT_LEA
# -------
# dest -> ST_TEMP (1)
# src1 -> ST_ARRAY (l2)
# |
# >
# CNT_ADD
# -------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (1)
# src2 -> ST_TEMP (2)
# |
# >
# CNT_SW
# ------
# dest -> ST_TEMP (3)
# src1 -> ST_TEMP (0)

.data

  _g1:
    .space 4

  _g2:
    .space 10
    .align 2

.text

main:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+44
  # |               l2               |
  # |--------------------------------| sp+4
  # |               l1               |
  # |--------------------------------| sp+0
  la $sp, -48($sp)

  li $t0, 5
  sw $t0, _g1
  li $t0, 'a'
  li $t1, 0
  la $t2, _g2
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 5555
  sw $t0, 0($sp)
  li $t0, 3
  la $t1, _g2
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 10
  sll $t2, $t1, 2
  la $t1, 4($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)

__leavemain:
  la $sp, 48($sp)
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
