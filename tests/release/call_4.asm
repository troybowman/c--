
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

_fact:
  la $sp, -24($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $s0, 16($sp)

  lw $t0, 24($sp)
  li $t1, 0
  seq $t2, $t0, $t1
  beq $t2, $zero, _L0
  li $t0, 1
  move $v0, $t0
  j __leave_fact
  j _L1
_L0:
  lw $s0, 24($sp)
  lw $t0, 24($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  move $a0, $t2
  jal _fact
  move $t0, $v0
  mul $t1, $s0, $t0
  move $v0, $t1
  j __leave_fact
_L1:

__leave_fact:
  lw $s0, 16($sp)
  lw $ra, 20($sp)
  la $sp, 24($sp)
  jr $ra

main:
  la $sp, -24($sp)
  sw $ra, 16($sp)

  li $t0, 7
  move $a0, $t0
  jal _fact
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str0
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
