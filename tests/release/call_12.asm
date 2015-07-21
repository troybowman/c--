
.data

  _x:
    .space 15
    .align 2

  _str0:
    .asciiz "hello world"
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

.text

_copy:
  la $sp, -8($sp)

  li $t0, 0
  sw $t0, 0($sp)
  li $t0, 0
  sw $t0, 0($sp)
_L0:
  lw $t0, 0($sp)
  move $t1, $a0
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 0($sp)
  move $t1, $a0
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  lw $t1, 0($sp)
  move $t2, $a1
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 0($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 0($sp)
  j _L0
_L1:
  li $t0, 0
  lw $t1, 0($sp)
  move $t2, $a1
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 0($sp)
  move $v0, $t0
  j __leave_copy

__leave_copy:
  la $sp, 8($sp)
  jr $ra

_sum:
  la $sp, -8($sp)

  li $t0, 0
  sw $t0, 0($sp)
  li $t0, 0
  sw $t0, 4($sp)
_L2:
  lw $t0, 0($sp)
  move $t1, $a0
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L3
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  move $t2, $a0
  addu $t3, $t2, $t1
  lb $t1, ($t3)
  addu $t2, $t0, $t1
  sw $t2, 4($sp)
  lw $t0, 0($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 0($sp)
  j _L2
_L3:
  lw $t0, 4($sp)
  move $v0, $t0
  j __leave_sum

__leave_sum:
  la $sp, 8($sp)
  jr $ra

main:
  la $sp, -32($sp)
  sw $ra, 20($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)
  sw $s0, 16($sp)

  la $t0, _str0
  la $t1, _x
  move $a1, $t1
  move $a0, $t0
  jal _copy
  move $t0, $v0
  sw $t0, 24($sp)
  lw $s0, 24($sp)
  la $t0, _x
  move $a0, $t0
  jal _sum
  move $t0, $v0
  addu $t1, $s0, $t0
  sw $t1, 24($sp)
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $s0, 16($sp)
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 20($sp)
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
