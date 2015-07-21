
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

main:
  la $sp, -40($sp)
  sw $ra, 16($sp)
  sw $a0, 40($sp)

  li $t0, 0
  sw $t0, 36($sp)
  li $t0, 0
  sw $t0, 24($sp)
_L0:
  lw $t0, 24($sp)
  li $t1, 5
  slt $t2, $t0, $t1
  beq $t2, $zero, _L5
  li $t0, 0
  sw $t0, 28($sp)
_L1:
  lw $t0, 28($sp)
  li $t1, 10
  slt $t2, $t0, $t1
  beq $t2, $zero, _L4
  li $t0, 0
  sw $t0, 32($sp)
_L2:
  lw $t0, 32($sp)
  li $t1, 15
  slt $t2, $t0, $t1
  beq $t2, $zero, _L3
  lw $t0, 36($sp)
  lw $t1, 24($sp)
  lw $t2, 28($sp)
  addu $t3, $t1, $t2
  lw $t1, 32($sp)
  addu $t2, $t3, $t1
  li $t1, 3
  div $t3, $t2, $t1
  addu $t1, $t0, $t3
  sw $t1, 36($sp)
  lw $t0, 32($sp)
  li $t1, 3
  addu $t2, $t0, $t1
  sw $t2, 32($sp)
  j _L2
_L3:
  lw $t0, 28($sp)
  li $t1, 2
  addu $t2, $t0, $t1
  sw $t2, 28($sp)
  j _L1
_L4:
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L0
_L5:
  lw $t0, 36($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a0, 40($sp)
  lw $ra, 16($sp)
  la $sp, 40($sp)
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
