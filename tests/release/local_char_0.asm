
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

main:
  la $sp, -32($sp)
  sw $ra, 16($sp)

  li $t0, 'Q'
  sb $t0, 24($sp)
  lb $t0, 24($sp)
  move $a0, $t0
  jal __print_char
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
