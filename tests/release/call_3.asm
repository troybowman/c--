
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

_add:
  la $sp, -0($sp)

  move $t0, $a0
  move $t1, $a1
  add $t2, $t0, $t1
  move $v0, $t2
  j __leave_add

__leave_add:
  la $sp, 0($sp)
  jr $ra

_two:
  la $sp, -0($sp)

  li $t0, 2
  move $v0, $t0
  j __leave_two

__leave_two:
  la $sp, 0($sp)
  jr $ra

main:
  la $sp, -32($sp)
  sw $ra, 20($sp)
  sw $s0, 16($sp)

  li $s0, 1
  jal _two
  move $t0, $v0
  move $a1, $t0
  move $a0, $s0
  jal _add
  move $t0, $v0
  sw $t0, 24($sp)
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
