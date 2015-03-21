
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

_id:
  la $sp, -0($sp)

  move $t0, $a0
  move $v0, $t0
  j __leave_id

__leave_id:
  la $sp, 0($sp)
  jr $ra

main:
  la $sp, -32($sp)
  sw $ra, 16($sp)

  li $t0, 1
  sw $t0, 28($sp)
  li $t0, 7
  sw $t0, 24($sp)
_L0:
  lw $t0, 24($sp)
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 24($sp)
  move $a0, $t0
  jal _id
  move $t0, $v0
  lw $t1, 28($sp)
  mul $t2, $t0, $t1
  sw $t2, 28($sp)
  lw $t0, 24($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L0
_L1:
  lw $t0, 28($sp)
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
