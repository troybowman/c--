
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

_f:
  la $sp, -0($sp)

  move $t0, $a0
  move $t1, $a1
  move $t2, $a2
  move $t3, $a3
  lw $t4, 16($sp)
  mul $t5, $t3, $t4
  add $t3, $t2, $t5
  mul $t2, $t1, $t3
  add $t1, $t0, $t2
  move $v0, $t1
  j __leave_f

__leave_f:
  la $sp, 0($sp)
  jr $ra

main:
  la $sp, -32($sp)
  sw $ra, 20($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  li $t4, 5
  sw $t4, 16($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _f
  move $t0, $v0
  sw $t0, 24($sp)
  lw $t0, 24($sp)
  lw $t1, 24($sp)
  lw $t2, 24($sp)
  lw $t3, 24($sp)
  lw $t4, 24($sp)
  sw $t4, 16($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _f
  move $t0, $v0
  sw $t0, 24($sp)
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $ra, 20($sp)
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