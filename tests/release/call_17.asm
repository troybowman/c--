
.data

  _u:
    .space 4

  _str0:
    .asciiz "hello world"
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

.text

_f:
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)
  sw $a1, 28($sp)

  lw $t0, 28($sp)
  lw $t1, 24($sp)
  add $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 0
  seq $t2, $t0, $t1
  beq $t2, $zero, _L0
  j __leave_f
  j _L1
_L0:
  lw $t0, _u
  lw $t1, 28($sp)
  lw $t2, 24($sp)
  add $t3, $t2, $t1
  lb $t1, ($t3)
  add $t2, $t0, $t1
  sw $t2, _u
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  li $t2, 1
  add $t3, $t1, $t2
  move $a1, $t3
  move $a0, $t0
  jal _f
_L1:

__leave_f:
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

main:
  la $sp, -24($sp)
  sw $ra, 16($sp)

  la $t0, _str0
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _f
  lw $t0, _u
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

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
