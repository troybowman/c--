
.data

  _x:
    .space 40

  _str0:
    .asciiz "\n"
    .align 2

.text

main:
  la $sp, -32($sp)
  sw $ra, 16($sp)

  li $t0, 3142
  li $t1, 7
  sll $t2, $t1, 2
  la $t1, _x
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 7
  sll $t1, $t0, 2
  la $t0, _x
  add $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 24($sp)
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $ra, 16($sp)
  la $sp, 32($sp)
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
