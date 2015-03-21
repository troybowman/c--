
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

main:
  la $sp, -72($sp)
  sw $ra, 16($sp)

  li $t0, 4321
  li $t1, 5
  sll $t2, $t1, 2
  la $t1, 24($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 5
  sll $t1, $t0, 2
  la $t0, 24($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 64($sp)
  lw $t0, 64($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $ra, 16($sp)
  la $sp, 72($sp)
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
