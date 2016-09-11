
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
  # |--------------------------------| sp+64  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+60
  # |               a2               |
  # |--------------------------------| sp+40
  # |               a1               |
  # |--------------------------------| sp+32
  # |               j                |
  # |--------------------------------| sp+28
  # |               i                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -64($sp)
  sw $ra, 16($sp)
  sw $a0, 64($sp)

  li $t0, 'h'
  li $t1, 0
  la $t2, 32($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'e'
  li $t1, 1
  la $t2, 32($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'l'
  li $t1, 2
  la $t2, 32($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'l'
  li $t1, 3
  la $t2, 32($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'o'
  li $t1, 4
  la $t2, 32($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'w'
  li $t1, 0
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 1
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 2
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 3
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'o'
  li $t1, 4
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 5
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 6
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 7
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'r'
  li $t1, 8
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 9
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 10
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 11
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'l'
  li $t1, 12
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 13
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 14
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'X'
  li $t1, 15
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'd'
  li $t1, 16
  la $t2, 40($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 0
  sw $t0, 24($sp)
  li $t0, 0
  sw $t0, 28($sp)
_L0:
  lw $t0, 24($sp)
  li $t1, 5
  slt $t2, $t0, $t1
  lw $t0, 28($sp)
  li $t1, 17
  slt $t3, $t0, $t1
  and $t0, $t2, $t3
  beq $t0, $zero, _L1
  lw $t0, 24($sp)
  la $t1, 32($sp)
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  move $a0, $t0
  jal __print_char
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  la $t1, 40($sp)
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  move $a0, $t0
  jal __print_char
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  lw $t0, 28($sp)
  li $t1, 4
  addu $t2, $t0, $t1
  sw $t2, 28($sp)
  j _L0
_L1:

__leavemain:
  lw $a0, 64($sp)
  lw $ra, 16($sp)
  la $sp, 64($sp)
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
