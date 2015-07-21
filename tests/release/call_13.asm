
.data

  _str0:
    .asciiz "hello world"
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

.text

_sum:
  la $sp, -24($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $a1, 28($sp)
  sw $s0, 16($sp)

  lw $t0, 28($sp)
  lw $t1, 24($sp)
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 0
  seq $t2, $t0, $t1
  beq $t2, $zero, _L0
  li $t0, 0
  move $v0, $t0
  j __leave_sum
  j _L1
_L0:
  lw $t0, 28($sp)
  lw $t1, 24($sp)
  addu $t2, $t1, $t0
  lb $s0, ($t2)
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  li $t2, 1
  addu $t3, $t1, $t2
  move $a1, $t3
  move $a0, $t0
  jal _sum
  move $t0, $v0
  addu $t1, $s0, $t0
  move $v0, $t1
  j __leave_sum
_L1:

__leave_sum:
  lw $s0, 16($sp)
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 20($sp)
  la $sp, 24($sp)
  jr $ra

main:
  la $sp, -32($sp)
  sw $ra, 16($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)

  la $t0, _str0
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _sum
  move $t0, $v0
  sw $t0, 24($sp)
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a1, 36($sp)
  lw $a0, 32($sp)
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
