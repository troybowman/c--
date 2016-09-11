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
# INTERMEDIATE CODE FOR FUNCTION: f5
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f6
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f7
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f8
#-----------------------------------------------------------------------------
# temps used:    0
# svregs used:   0
# stktemps used: 0
# regargs used:  0
# stkargs used:  0
#-----------------------------------------------------------------------------
# INTERMEDIATE CODE FOR FUNCTION: f9
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (111)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (222)
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (333)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (444)
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (555)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (666)
# |
# >
# CNT_SNE
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (3)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f4)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (6)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (3)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (777)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (888)
# |
# >
# CNT_SGE
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (4)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f5)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (6)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (4)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (999)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1000)
# |
# >
# CNT_SLE
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (5)
# src1 -> ST_TEMP (2)
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
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1001)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1002)
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
# dest -> ST_LABEL (7)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f8)
# |
# >
# CNT_JUMP
# --------
# dest -> ST_LABEL (8)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (7)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (0)
# src1 -> ST_INTCON (1003)
# |
# >
# CNT_LI
# ------
# dest -> ST_TEMP (1)
# src1 -> ST_INTCON (1004)
# |
# >
# CNT_SNE
# -------
# dest -> ST_TEMP (2)
# src1 -> ST_TEMP (0)
# src2 -> ST_TEMP (1)
# |
# >
# CNT_CNDJMP
# ----------
# dest -> ST_LABEL (8)
# src1 -> ST_TEMP (2)
# |
# >
# CNT_CALL
# --------
# src1 -> ST_FUNCTION (f9)
# |
# >
# CNT_LABEL
# ---------
# src1 -> ST_LABEL (8)

.data

.text

_f1:

  # |--------------------------------|


__leave_f1:
  jr $ra

_f2:

  # |--------------------------------|


__leave_f2:
  jr $ra

_f3:

  # |--------------------------------|


__leave_f3:
  jr $ra

_f4:

  # |--------------------------------|


__leave_f4:
  jr $ra

_f5:

  # |--------------------------------|


__leave_f5:
  jr $ra

_f6:

  # |--------------------------------|


__leave_f6:
  jr $ra

_f7:

  # |--------------------------------|


__leave_f7:
  jr $ra

_f8:

  # |--------------------------------|


__leave_f8:
  jr $ra

_f9:

  # |--------------------------------|


__leave_f9:
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

  li $t0, 111
  li $t1, 222
  slt $t2, $t0, $t1
  beq $t2, $zero, _L0
  jal _f1
_L0:
  li $t0, 333
  li $t1, 444
  seq $t2, $t0, $t1
  beq $t2, $zero, _L1
  jal _f2
  j _L2
_L1:
  jal _f3
_L2:
  li $t0, 555
  li $t1, 666
  sne $t2, $t0, $t1
  beq $t2, $zero, _L3
  jal _f4
  j _L6
_L3:
  li $t0, 777
  li $t1, 888
  sge $t2, $t0, $t1
  beq $t2, $zero, _L4
  jal _f5
  j _L6
_L4:
  li $t0, 999
  li $t1, 1000
  sle $t2, $t0, $t1
  beq $t2, $zero, _L5
  jal _f6
  j _L6
_L5:
  jal _f7
_L6:
  li $t0, 1001
  li $t1, 1002
  seq $t2, $t0, $t1
  beq $t2, $zero, _L7
  jal _f8
  j _L8
_L7:
  li $t0, 1003
  li $t1, 1004
  sne $t2, $t0, $t1
  beq $t2, $zero, _L8
  jal _f9
_L8:

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
