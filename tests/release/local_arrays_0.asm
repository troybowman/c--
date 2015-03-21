
.data

  _str0:
    .asciiz "\n"
    .align 2

  _str1:
    .asciiz ", "
    .align 2

.text

main:
  la $sp, -112($sp)
  sw $ra, 16($sp)

  li $t0, 1111
  li $t1, 4
  sll $t2, $t1, 2
  la $t1, 24($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 2222
  li $t1, 5
  sll $t2, $t1, 2
  la $t1, 24($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 3333
  li $t1, 6
  sll $t2, $t1, 2
  la $t1, 24($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 4444
  li $t1, 7
  sll $t2, $t1, 2
  la $t1, 64($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 5555
  li $t1, 8
  sll $t2, $t1, 2
  la $t1, 64($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 6666
  li $t1, 9
  sll $t2, $t1, 2
  la $t1, 64($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 4
  sll $t1, $t0, 2
  la $t0, 24($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 104($sp)
  lw $t0, 104($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 5
  sll $t1, $t0, 2
  la $t0, 24($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 104($sp)
  lw $t0, 104($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 6
  sll $t1, $t0, 2
  la $t0, 24($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 104($sp)
  lw $t0, 104($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 7
  sll $t1, $t0, 2
  la $t0, 64($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 104($sp)
  lw $t0, 104($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 8
  sll $t1, $t0, 2
  la $t0, 64($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 104($sp)
  lw $t0, 104($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 9
  sll $t1, $t0, 2
  la $t0, 64($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 104($sp)
  lw $t0, 104($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 4
  sll $t1, $t0, 2
  la $t0, 24($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 5
  sll $t1, $t0, 2
  la $t0, 24($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 6
  sll $t1, $t0, 2
  la $t0, 24($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 7
  sll $t1, $t0, 2
  la $t0, 64($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 8
  sll $t1, $t0, 2
  la $t0, 64($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 9
  sll $t1, $t0, 2
  la $t0, 64($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $ra, 16($sp)
  la $sp, 112($sp)
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
