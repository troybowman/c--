
.data

  _str0:
    .asciiz " "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

.text

main:
  la $sp, -40($sp)
  sw $ra, 16($sp)

  li $t0, 1
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L0
  li $t0, 1111
  sw $t0, 32($sp)
  j _L1
_L0:
  li $t0, 2222
  sw $t0, 32($sp)
_L1:
  li $t0, 1
  sw $t0, 24($sp)
  li $t0, 1
  sub $t1, $zero, $t0
  sw $t1, 28($sp)
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L2
  li $t0, 3333
  sw $t0, 36($sp)
  j _L3
_L2:
  li $t0, 4444
  sw $t0, 36($sp)
_L3:
  lw $t0, 32($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $ra, 16($sp)
  la $sp, 40($sp)
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
