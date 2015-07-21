
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
  sw $a0, 48($sp)

  li $t0, 0
  li $t1, 0
  sll $t2, $t1, 2
  la $t1, 24($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1
  li $t1, 0
  la $t2, _y
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 1
  li $t1, 1
  sll $t2, $t1, 2
  la $t1, 24($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 2
  li $t1, 1
  la $t2, _y
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 2
  li $t1, 2
  sll $t2, $t1, 2
  la $t1, 24($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 3
  li $t1, 2
  la $t2, _y
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 3
  li $t1, 3
  sll $t2, $t1, 2
  la $t1, 24($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 4
  li $t1, 3
  la $t2, _y
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 4
  li $t1, 4
  sll $t2, $t1, 2
  la $t1, 24($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 55
  li $t1, 4
  la $t2, _y
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 2
  li $t1, 1
  sll $t2, $t1, 2
  la $t1, 24($sp)
  addu $t3, $t1, $t2
  lw $t1, ($t3)
  mul $t2, $t0, $t1
  li $t0, 1
  sub $t1, $t2, $t0
  sll $t0, $t1, 2
  la $t1, 24($sp)
  addu $t2, $t1, $t0
  lw $t0, ($t2)
  li $t1, 4
  la $t2, _y
  addu $t3, $t2, $t1
  lb $t1, ($t3)
  li $t2, 2
  sll $t3, $t2, 2
  la $t2, 24($sp)
  addu $t4, $t2, $t3
  lw $t2, ($t4)
  li $t3, 0
  la $t4, _y
  addu $t5, $t4, $t3
  lb $t3, ($t5)
  addu $t4, $t2, $t3
  la $t2, _y
  addu $t3, $t2, $t4
  lb $t2, ($t3)
  li $t3, 1
  sll $t4, $t3, 2
  la $t3, 24($sp)
  addu $t5, $t3, $t4
  lw $t3, ($t5)
  addu $t4, $t2, $t3
  div $t2, $t1, $t4
  addu $t1, $t0, $t2
  sw $t1, 44($sp)
  lw $t0, 44($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a0, 48($sp)
  lw $ra, 16($sp)
  la $sp, 48($sp)
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
