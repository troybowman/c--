
.data

.text

main:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |               x                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 16($sp)

_L0:
  lw $t0, 24($sp)
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L1
  jal main
  j _L0
_L1:
_L2:
  lw $t0, 24($sp)
  li $t1, 0
  seq $t2, $t0, $t1
  lw $t0, 24($sp)
  li $t1, 6
  seq $t3, $t0, $t1
  or $t0, $t2, $t3
  beq $t0, $zero, _L6
  lw $t0, 24($sp)
  li $t1, 1
  slt $t2, $t0, $t1
  beq $t2, $zero, _L5
_L3:
  li $t0, 4
  li $t1, 5
  seq $t2, $t0, $t1
  beq $t2, $zero, _L4
  j __leavemain
  j _L3
_L4:
_L5:
  j _L2
_L6:

__leavemain:
  lw $ra, 16($sp)
  la $sp, 32($sp)
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
