
.data

  _str0:
    .asciiz " "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

.text

main:

  # |--------------------------------|
  # |              $a0               |
  # |--------------------------------| sp+40  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+36
  # |               c                |
  # |--------------------------------| sp+32
  # |               b                |
  # |--------------------------------| sp+28
  # |               a                |
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

  li $t0, 0
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 10
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 22
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 305419896
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 43981
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 4660
  li $t1, 22136
  addu $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 37121
  li $t1, 4385
  addu $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 4369
  sw $t0, 24($sp)
  li $t0, 8738
  sw $t0, 28($sp)
  li $t0, 13107
  sw $t0, 32($sp)
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  mul $t2, $t0, $t1
  lw $t0, 32($sp)
  sub $t1, $t2, $t0
  move $a0, $t1
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  sub $t1, $zero, $t0
  move $a0, $t1
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  sub $t1, $zero, $t0
  move $a0, $t1
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
