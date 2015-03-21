
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

main:
  la $sp, -32($sp)
  sw $ra, 16($sp)

  li $t0, 0
  sw $t0, 24($sp)
  li $t0, 0
  sw $t0, 28($sp)
_L0:
  lw $t0, 24($sp)
  li $t1, 10
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 28($sp)
  lw $t1, 24($sp)
  add $t2, $t0, $t1
  sw $t2, 28($sp)
  lw $t0, 24($sp)
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L0
_L1:
  li $t0, 0
  sw $t0, 24($sp)
_L2:
  lw $t0, 24($sp)
  li $t1, 10
  slt $t2, $t0, $t1
  beq $t2, $zero, _L3
  lw $t0, 28($sp)
  lw $t1, 24($sp)
  add $t2, $t0, $t1
  sw $t2, 28($sp)
  lw $t0, 24($sp)
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L2
_L3:
  li $t0, 0
  sw $t0, 24($sp)
_L4:
  li $t0, 1
  beq $t0, $zero, _L6
  lw $t0, 28($sp)
  lw $t1, 24($sp)
  add $t2, $t0, $t1
  sw $t2, 28($sp)
  lw $t0, 24($sp)
  li $t1, 10
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L5
  lw $t0, 28($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  j __leavemain
_L5:
  lw $t0, 24($sp)
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L4
_L6:

__leavemain:
  lw $ra, 16($sp)
  la $sp, 32($sp)
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
