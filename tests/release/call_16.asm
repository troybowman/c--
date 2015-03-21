
.data

  _u:
    .space 4

  _str0:
    .asciiz "\n"
    .align 2

.text

_f:
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)

  lw $t0, 24($sp)
  li $t1, 0
  seq $t2, $t0, $t1
  beq $t2, $zero, _L0
  li $t0, 1
  move $v0, $t0
  j __leave_f
  j _L1
_L0:
  lw $t0, 24($sp)
  move $a0, $t0
  jal _incr
  lw $t0, 24($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  move $a0, $t2
  jal _f
  move $t0, $v0
  move $v0, $t0
  j __leave_f
_L1:

__leave_f:
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

_incr:
  la $sp, -0($sp)

  move $t0, $a0
  lw $t1, _u
  add $t2, $t0, $t1
  sw $t2, _u

__leave_incr:
  la $sp, 0($sp)
  jr $ra

main:
  la $sp, -32($sp)
  sw $ra, 16($sp)

  li $t0, 1
  sw $t0, _u
  li $t0, 6
  move $a0, $t0
  jal _f
  move $t0, $v0
  sw $t0, 24($sp)
  lw $t0, _u
  lw $t1, 24($sp)
  add $t2, $t0, $t1
  sw $t2, 24($sp)
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

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
