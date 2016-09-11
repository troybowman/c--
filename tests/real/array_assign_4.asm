
.data

  _str0:
    .asciiz "x: "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

  _str2:
    .asciiz "a: "
    .align 2

  _str3:
    .asciiz ", "
    .align 2

.text

main:

  # |--------------------------------|
  # |              $a0               |
  # |--------------------------------| sp+40  <-- start of caller's frame
  # |               a                |
  # |--------------------------------| sp+28
  # |               x                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -40($sp)
  sw $ra, 16($sp)
  sw $a0, 40($sp)

  li $t0, 1
  sw $t0, 24($sp)
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  sw $t2, 24($sp)
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 3
  mul $t2, $t0, $t1
  sw $t2, 24($sp)
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 3
  div $t2, $t0, $t1
  sw $t2, 24($sp)
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 0
  li $t1, 0
  sll $t2, $t1, 2
  la $t1, 28($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 0
  li $t1, 1
  sll $t2, $t1, 2
  la $t1, 28($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 255
  li $t1, 2
  sll $t2, $t1, 2
  la $t1, 28($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  li $t0, 0
  sll $t1, $t0, 2
  la $t0, 28($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  li $t0, 1
  sll $t1, $t0, 2
  la $t0, 28($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  li $t0, 2
  sll $t1, $t0, 2
  la $t0, 28($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 0
  sll $t1, $t0, 2
  la $t0, 28($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 255
  and $t2, $t0, $t1
  li $t0, 0
  sll $t1, $t0, 2
  la $t0, 28($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 1
  sll $t1, $t0, 2
  la $t0, 28($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 255
  or $t2, $t0, $t1
  li $t0, 1
  sll $t1, $t0, 2
  la $t0, 28($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 2
  sll $t1, $t0, 2
  la $t0, 28($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 43
  xor $t2, $t0, $t1
  li $t0, 2
  sll $t1, $t0, 2
  la $t0, 28($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  li $t0, 0
  sll $t1, $t0, 2
  la $t0, 28($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  li $t0, 1
  sll $t1, $t0, 2
  la $t0, 28($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  li $t0, 2
  sll $t1, $t0, 2
  la $t0, 28($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a0, 40($sp)
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
