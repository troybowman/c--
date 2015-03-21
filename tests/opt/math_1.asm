
.data

  _y:
    .space 5
    .align 2

  _str0:
    .asciiz "\n"
    .align 2

.text

main:
  la $sp, -48($sp)
  sw $ra, 16($sp)

  li $t0, 0
  li $t1, 0
  sll $t2, $t1, 2
  la $t1, 24($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1
  li $t1, 0
  la $t2, _y
  add $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 1
  li $t1, 1
  sll $t2, $t1, 2
  la $t1, 24($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 2
  li $t1, 1
  la $t2, _y
  add $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 2
  li $t1, 2
  sll $t2, $t1, 2
  la $t1, 24($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 3
  li $t1, 2
  la $t2, _y
  add $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 3
  li $t1, 3
  sll $t2, $t1, 2
  la $t1, 24($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 4
  li $t1, 3
  la $t2, _y
  add $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 4
  li $t1, 4
  sll $t2, $t1, 2
  la $t1, 24($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 55
  li $t1, 4
  la $t2, _y
  add $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 0
  sll $t1, $t0, 2
  la $t0, 24($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 0
  la $t2, _y
  add $t3, $t2, $t1
  lb $t1, ($t3)
  add $t2, $t0, $t1
  sw $t2, 44($sp)
  li $t0, 1
  sll $t1, $t0, 2
  la $t0, 24($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 44($sp)
  add $t2, $t0, $t1
  sw $t2, 44($sp)
  lw $t0, 44($sp)
  la $t1, _y
  add $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 3
  sll $t2, $t1, 2
  la $t1, 24($sp)
  add $t3, $t1, $t2
  lw $t1, ($t3)
  mul $t2, $t0, $t1
  sw $t2, 44($sp)
  lw $t0, 44($sp)
  li $t1, 2
  sll $t2, $t1, 2
  la $t1, 24($sp)
  add $t3, $t1, $t2
  lw $t1, ($t3)
  div $t2, $t0, $t1
  sw $t2, 44($sp)
  lw $t0, 44($sp)
  la $t1, _y
  add $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 0
  sll $t2, $t1, 2
  la $t1, 24($sp)
  add $t3, $t1, $t2
  lw $t1, ($t3)
  sub $t2, $t0, $t1
  sw $t2, 44($sp)
  lw $t0, 44($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $ra, 16($sp)
  la $sp, 48($sp)
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
