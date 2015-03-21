
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

_f:
  la $sp, -0($sp)

  move $t0, $a0
  li $t1, 1
  add $t2, $t0, $t1
  move $v0, $t2
  j __leave_f

__leave_f:
  la $sp, 0($sp)
  jr $ra

main:
  la $sp, -32($sp)
  sw $ra, 20($sp)
  sw $s0, 16($sp)

  li $t0, 1
  sb $t0, 28($sp)
  lb $t0, 28($sp)
  move $a0, $t0
  jal _f
  move $t0, $v0
  sw $t0, 24($sp)
  lw $s0, 24($sp)
  lw $t0, 24($sp)
  move $a0, $t0
  jal _f
  move $t0, $v0
  add $t1, $s0, $t0
  sb $t1, 28($sp)
  lb $s0, 28($sp)
  li $t0, 'Q'
  move $a0, $t0
  jal _f
  move $t0, $v0
  add $t1, $s0, $t0
  sw $t1, 24($sp)
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $s0, 16($sp)
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
