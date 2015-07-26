
.data

  _str0:
    .asciiz "sum: "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

.text

_id:

  move $t0, $a0
  move $v0, $t0
  j __leave_id

__leave_id:
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
  addu $t2, $t0, $t1
  move $t0, $a2
  addu $t1, $t2, $t0
  move $t0, $a3
  addu $t2, $t1, $t0
  lw $t0, 40($sp)
  addu $t1, $t2, $t0
  lw $t0, 44($sp)
  addu $t2, $t1, $t0
  lw $t0, 48($sp)
  addu $t1, $t2, $t0
  lw $t0, 52($sp)
  addu $t2, $t1, $t0
  lw $t0, 56($sp)
  addu $t1, $t2, $t0
  lw $t0, 60($sp)
  addu $t2, $t1, $t0
  lw $t0, 64($sp)
  addu $t1, $t2, $t0
  lw $t0, 68($sp)
  addu $t2, $t1, $t0
  lw $t0, 72($sp)
  addu $t1, $t2, $t0
  lw $t0, 76($sp)
  addu $t2, $t1, $t0
  lw $t0, 80($sp)
  addu $t1, $t2, $t0
  lw $t0, 84($sp)
  addu $t2, $t1, $t0
  lw $t0, 88($sp)
  addu $t1, $t2, $t0
  lw $t0, 92($sp)
  addu $t2, $t1, $t0
  lw $t0, 96($sp)
  addu $t1, $t2, $t0
  lw $t0, 100($sp)
  addu $t2, $t1, $t0
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

__leave_sum:
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

main:
  la $sp, -256($sp)
  sw $s0, 80($sp)
  sw $s1, 84($sp)
  sw $s2, 88($sp)
  sw $s3, 92($sp)
  sw $s4, 96($sp)
  sw $s5, 100($sp)
  sw $s6, 104($sp)
  sw $s7, 108($sp)
  sw $ra, 216($sp)
  sw $a0, 256($sp)
  sw $a1, 260($sp)
  sw $a2, 264($sp)
  sw $a3, 268($sp)

  li $t0, 1
  sw $t0, 224($sp)
  li $t0, 0
  li $t1, 0
  sll $t2, $t1, 2
  la $t1, 228($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1
  li $t1, 1
  sll $t2, $t1, 2
  la $t1, 228($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 2
  li $t1, 2
  sll $t2, $t1, 2
  la $t1, 228($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 3
  li $t1, 3
  sll $t2, $t1, 2
  la $t1, 228($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 4
  li $t1, 4
  sll $t2, $t1, 2
  la $t1, 228($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 'b'
  sb $t0, 248($sp)
  li $s0, 1
  li $s1, 2
  li $s2, 3
  li $s3, 4
  li $s4, 5
  lw $s5, 224($sp)
  lw $t0, 224($sp)
  lw $t1, 224($sp)
  mul $s6, $t0, $t1
  lw $t0, 224($sp)
  lw $t1, 224($sp)
  addu $t2, $t0, $t1
  lw $t0, 224($sp)
  addu $s7, $t2, $t0
  lw $t0, 224($sp)
  move $a0, $t0
  jal _id
  move $t0, $v0
  lw $t1, 224($sp)
  div $t9, $t0, $t1
  sw $t9, 112($sp)
  li $t0, 3
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  sw $v0, 116($sp)
  li $t0, 3
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  sw $v0, 120($sp)
  li $t0, 3
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  move $t0, $v0
  lw $t7, 120($sp)
  addu $t9, $t7, $t0
  sw $t9, 124($sp)
  lb $t0, 248($sp)
  lb $t1, 248($sp)
  div $t2, $t0, $t1
  lb $t0, 248($sp)
  div $t9, $t2, $t0
  sw $t9, 120($sp)
  lw $t0, 224($sp)
  lb $t1, 248($sp)
  addu $t9, $t0, $t1
  sw $t9, 128($sp)
  lw $t9, 224($sp)
  sw $t9, 132($sp)
  lb $t0, 248($sp)
  move $a0, $t0
  jal _id
  move $t0, $v0
  lw $t7, 132($sp)
  mul $t9, $t7, $t0
  sw $t9, 136($sp)
  li $t0, 3
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 3
  sll $t2, $t1, 2
  la $t1, 228($sp)
  addu $t3, $t1, $t2
  lw $t1, ($t3)
  addu $t2, $t0, $t1
  li $t0, 3
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t3, $t0, $t1
  lw $t0, ($t3)
  addu $t9, $t2, $t0
  sw $t9, 132($sp)
  lw $t0, 224($sp)
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t9, ($t2)
  sw $t9, 140($sp)
  lw $t0, 224($sp)
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t9, ($t2)
  sw $t9, 144($sp)
  li $t0, 4
  sll $t1, $t0, 2
  la $t0, 228($sp)
  addu $t2, $t0, $t1
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
  la $t0, 228($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  move $t0, $v0
  move $a0, $t0
  jal _id
  sw $v0, 144($sp)
  lw $t0, 224($sp)
  lb $t1, 248($sp)
  addu $t9, $t0, $t1
  sw $t9, 152($sp)
  lw $t9, 224($sp)
  sw $t9, 156($sp)
  lw $t9, 224($sp)
  sw $t9, 160($sp)
  lw $t9, 224($sp)
  sw $t9, 164($sp)
  lw $t9, 224($sp)
  sw $t9, 168($sp)
  lw $t9, 224($sp)
  sw $t9, 172($sp)
  lw $t9, 224($sp)
  sw $t9, 176($sp)
  lw $t9, 224($sp)
  sw $t9, 180($sp)
  lw $t9, 224($sp)
  sw $t9, 184($sp)
  lw $t9, 224($sp)
  sw $t9, 188($sp)
  lw $t9, 224($sp)
  sw $t9, 192($sp)
  lw $t9, 224($sp)
  sw $t9, 196($sp)
  lw $t9, 224($sp)
  sw $t9, 200($sp)
  lw $t9, 224($sp)
  sw $t9, 204($sp)
  lw $t9, 224($sp)
  sw $t9, 208($sp)
  lw $t9, 224($sp)
  sw $t9, 212($sp)
  lw $t0, 224($sp)
  move $a0, $t0
  jal _id
  move $t0, $v0
  lw $t7, 212($sp)
  sub $t1, $t7, $t0
  lw $t7, 208($sp)
  mul $t0, $t7, $t1
  lw $t7, 204($sp)
  mul $t1, $t7, $t0
  lw $t7, 200($sp)
  sub $t0, $t7, $t1
  lw $t7, 196($sp)
  addu $t1, $t7, $t0
  lw $t7, 192($sp)
  addu $t0, $t7, $t1
  lw $t7, 188($sp)
  addu $t1, $t7, $t0
  lw $t7, 184($sp)
  addu $t0, $t7, $t1
  lw $t7, 180($sp)
  addu $t1, $t7, $t0
  lw $t7, 176($sp)
  addu $t0, $t7, $t1
  lw $t7, 172($sp)
  addu $t1, $t7, $t0
  lw $t7, 168($sp)
  addu $t0, $t7, $t1
  lw $t7, 164($sp)
  addu $t1, $t7, $t0
  lw $t7, 160($sp)
  addu $t0, $t7, $t1
  lw $t7, 156($sp)
  addu $t1, $t7, $t0
  sw $t1, 76($sp)
  lw $t7, 152($sp)
  sw $t7, 72($sp)
  lw $t7, 144($sp)
  sw $t7, 68($sp)
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
  lw $a3, 268($sp)
  lw $a2, 264($sp)
  lw $a1, 260($sp)
  lw $a0, 256($sp)
  lw $ra, 216($sp)
  lw $s7, 108($sp)
  lw $s6, 104($sp)
  lw $s5, 100($sp)
  lw $s4, 96($sp)
  lw $s3, 92($sp)
  lw $s2, 88($sp)
  lw $s1, 84($sp)
  lw $s0, 80($sp)
  la $sp, 256($sp)
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
