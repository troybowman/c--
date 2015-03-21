
.data

  _str0:
    .asciiz "x: "
    .align 2

  _str1:
    .asciiz ", i: "
    .align 2

  _str2:
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
  sw $ra, 20($sp)
  sw $s0, 16($sp)

  li $t0, 123
  sw $t0, 24($sp)
  li $t0, 3
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $s0, $v0
  li $t0, 4
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $t0, $v0
  sgt $t1, $s0, $t0
  beq $t1, $zero, _L0
  li $t0, 321
  sw $t0, 24($sp)
_L0:
  li $t0, 12
  sw $t0, 28($sp)
_L1:
  lw $t0, 28($sp)
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $t0, $v0
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L2
  lw $t0, 24($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  sw $t2, 24($sp)
  lw $t0, 28($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  sw $t2, 28($sp)
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  j _L1
_L2:
  li $t0, 0
  move $a0, $t0
  jal _id
  move $t0, $v0
  sw $t0, 28($sp)
_L3:
  lw $t0, 28($sp)
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $t0, $v0
  li $t1, 6
  slt $t2, $t0, $t1
  beq $t2, $zero, _L4
  lw $t0, 24($sp)
  li $t1, 2
  add $t2, $t0, $t1
  sw $t2, 24($sp)
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  move $a0, $t0
  jal _id
  move $t0, $v0
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, 28($sp)
  j _L3
_L4:
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str2
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
