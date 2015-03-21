
.data

  _str0:
    .asciiz "sum: "
    .align 2

  _str1:
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

_sum:
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)

  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $t1, $a1
  add $t2, $t0, $t1
  move $t0, $a2
  add $t1, $t2, $t0
  move $t0, $a3
  add $t2, $t1, $t0
  lw $t0, 40($sp)
  add $t1, $t2, $t0
  lw $t0, 44($sp)
  add $t2, $t1, $t0
  lw $t0, 48($sp)
  add $t1, $t2, $t0
  lw $t0, 52($sp)
  add $t2, $t1, $t0
  lw $t0, 56($sp)
  add $t1, $t2, $t0
  lw $t0, 60($sp)
  add $t2, $t1, $t0
  lw $t0, 64($sp)
  add $t1, $t2, $t0
  lw $t0, 68($sp)
  add $t2, $t1, $t0
  lw $t0, 72($sp)
  add $t1, $t2, $t0
  lw $t0, 76($sp)
  add $t2, $t1, $t0
  lw $t0, 80($sp)
  add $t1, $t2, $t0
  lw $t0, 84($sp)
  add $t2, $t1, $t0
  lw $t0, 88($sp)
  add $t1, $t2, $t0
  lw $t0, 92($sp)
  add $t2, $t1, $t0
  lw $t0, 96($sp)
  add $t1, $t2, $t0
  lw $t0, 100($sp)
  add $t2, $t1, $t0
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

__leave_sum:
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

main:
  la $sp, -192($sp)
  sw $ra, 152($sp)
  sw $s0, 80($sp)
  sw $s1, 84($sp)
  sw $s2, 88($sp)
  sw $s3, 92($sp)
  sw $s4, 96($sp)
  sw $s5, 100($sp)
  sw $s6, 104($sp)
  sw $s7, 108($sp)

  li $t0, 1
  sw $t0, 160($sp)
  li $t0, 0
  li $t1, 0
  sll $t2, $t1, 2
  la $t1, 164($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1
  li $t1, 1
  sll $t2, $t1, 2
  la $t1, 164($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 2
  li $t1, 2
  sll $t2, $t1, 2
  la $t1, 164($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 3
  li $t1, 3
  sll $t2, $t1, 2
  la $t1, 164($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 4
  li $t1, 4
  sll $t2, $t1, 2
  la $t1, 164($sp)
  add $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 'b'
  sb $t0, 184($sp)
  li $s0, 1
  li $s1, 2
  li $s2, 3
  li $s3, 4
  li $s4, 5
  lw $s5, 160($sp)
  lw $t0, 160($sp)
  lw $t1, 160($sp)
  mul $s6, $t0, $t1
  lw $t0, 160($sp)
  lw $t1, 160($sp)
  add $t2, $t0, $t1
  lw $t0, 160($sp)
  add $s7, $t2, $t0
  lw $t0, 160($sp)
  move $a0, $t0
  jal _id
  move $t0, $v0
  lw $t1, 160($sp)
  div $t9, $t0, $t1
  sw $t9, 112($sp)
  li $t0, 3
  sll $t1, $t0, 2
  la $t0, 164($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  sw $v0, 116($sp)
  li $t0, 3
  sll $t1, $t0, 2
  la $t0, 164($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  sw $v0, 120($sp)
  li $t0, 3
  sll $t1, $t0, 2
  la $t0, 164($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  move $t0, $v0
  lw $t7, 120($sp)
  add $t9, $t7, $t0
  sw $t9, 124($sp)
  lb $t0, 184($sp)
  lb $t1, 184($sp)
  div $t2, $t0, $t1
  lb $t0, 184($sp)
  div $t9, $t2, $t0
  sw $t9, 120($sp)
  lw $t0, 160($sp)
  lb $t1, 184($sp)
  add $t9, $t0, $t1
  sw $t9, 128($sp)
  lw $t9, 160($sp)
  sw $t9, 132($sp)
  lb $t0, 184($sp)
  move $a0, $t0
  jal _id
  move $t0, $v0
  lw $t7, 132($sp)
  mul $t9, $t7, $t0
  sw $t9, 136($sp)
  li $t0, 3
  sll $t1, $t0, 2
  la $t0, 164($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 3
  sll $t2, $t1, 2
  la $t1, 164($sp)
  add $t3, $t1, $t2
  lw $t1, ($t3)
  add $t2, $t0, $t1
  li $t0, 3
  sll $t1, $t0, 2
  la $t0, 164($sp)
  add $t3, $t0, $t1
  lw $t0, ($t3)
  add $t9, $t2, $t0
  sw $t9, 132($sp)
  lw $t0, 160($sp)
  sll $t1, $t0, 2
  la $t0, 164($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  sll $t1, $t0, 2
  la $t0, 164($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  sll $t1, $t0, 2
  la $t0, 164($sp)
  add $t2, $t0, $t1
  lw $t9, ($t2)
  sw $t9, 140($sp)
  lw $t0, 160($sp)
  sll $t1, $t0, 2
  la $t0, 164($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  sll $t1, $t0, 2
  la $t0, 164($sp)
  add $t2, $t0, $t1
  lw $t9, ($t2)
  sw $t9, 144($sp)
  li $t0, 4
  sll $t1, $t0, 2
  la $t0, 164($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  move $t0, $v0
  lw $t7, 144($sp)
  mul $t9, $t7, $t0
  sw $t9, 148($sp)
  li $t0, 2
  move $a0, $t0
  jal _id
  move $t0, $v0
  sll $t1, $t0, 2
  la $t0, 164($sp)
  add $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $t0, $v0
  lw $t1, 160($sp)
  lb $t2, 184($sp)
  add $t3, $t1, $t2
  lw $t1, 160($sp)
  sll $t2, $t1, 2
  la $t1, 164($sp)
  add $t4, $t1, $t2
  lw $t1, ($t4)
  sw $t1, 76($sp)
  sw $t3, 72($sp)
  sw $t0, 68($sp)
  lw $t7, 148($sp)
  sw $t7, 64($sp)
  lw $t7, 140($sp)
  sw $t7, 60($sp)
  lw $t7, 132($sp)
  sw $t7, 56($sp)
  lw $t7, 136($sp)
  sw $t7, 52($sp)
  lw $t7, 128($sp)
  sw $t7, 48($sp)
  lw $t7, 120($sp)
  sw $t7, 44($sp)
  lw $t7, 124($sp)
  sw $t7, 40($sp)
  lw $t7, 116($sp)
  sw $t7, 36($sp)
  lw $t7, 112($sp)
  sw $t7, 32($sp)
  sw $s7, 28($sp)
  sw $s6, 24($sp)
  sw $s5, 20($sp)
  sw $s4, 16($sp)
  move $a3, $s3
  move $a2, $s2
  move $a1, $s1
  move $a0, $s0
  jal _sum

__leavemain:
  lw $s7, 108($sp)
  lw $s6, 104($sp)
  lw $s5, 100($sp)
  lw $s4, 96($sp)
  lw $s3, 92($sp)
  lw $s2, 88($sp)
  lw $s1, 84($sp)
  lw $s0, 80($sp)
  lw $ra, 152($sp)
  la $sp, 192($sp)
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
