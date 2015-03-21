
.data

  _i:
    .space 4

  _str0:
    .asciiz "\n"
    .align 2

.text

main:
  la $sp, -24($sp)
  sw $ra, 16($sp)

  li $t0, 0
  sw $t0, _i
_L0:
  lw $t0, _i
  li $t1, 100
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, _i
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, _i
  lw $t1, _i
  add $t2, $t0, $t1
  li $t0, 1
  add $t1, $t2, $t0
  sw $t1, _i
  j _L0
_L1:

__leavemain:
  lw $ra, 16($sp)
  la $sp, 24($sp)
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
