
.data

  _str0:
    .asciiz ""
    .align 2

.text

main:
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)

  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a0, 24($sp)
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
