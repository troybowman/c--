
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

_f:
  la $sp, -24($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $s0, 16($sp)

  lw $t0, 24($sp)
  li $t1, 1
  sle $t2, $t0, $t1
  beq $t2, $zero, _L0
  li $t0, 1
  move $v0, $t0
  j __leave_f
  j _L1
_L0:
  lw $t0, 24($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  move $a0, $t2
  jal _g
  move $s0, $v0
  lw $t0, 24($sp)
  li $t1, 2
  sub $t2, $t0, $t1
  move $a0, $t2
  jal _f
  move $t0, $v0
  add $t1, $s0, $t0
  move $v0, $t1
  j __leave_f
_L1:

__leave_f:
  lw $s0, 16($sp)
  lw $ra, 20($sp)
  la $sp, 24($sp)
  jr $ra

_g:
  la $sp, -24($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $s0, 16($sp)

  lw $t0, 24($sp)
  li $t1, 1
  sle $t2, $t0, $t1
  beq $t2, $zero, _L2
  li $t0, 1
  move $v0, $t0
  j __leave_g
  j _L3
_L2:
  lw $t0, 24($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  move $a0, $t2
  jal _f
  move $s0, $v0
  lw $t0, 24($sp)
  li $t1, 2
  sub $t2, $t0, $t1
  move $a0, $t2
  jal _g
  move $t0, $v0
  add $t1, $s0, $t0
  move $v0, $t1
  j __leave_g
_L3:

__leave_g:
  lw $s0, 16($sp)
  lw $ra, 20($sp)
  la $sp, 24($sp)
  jr $ra

main:
  la $sp, -24($sp)
  sw $ra, 16($sp)

  li $t0, 5
  move $a0, $t0
  jal _f
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
