
.data

  _str0:
    .asciiz "array[2] = "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

  _str2:
    .asciiz "hey look at me"
    .align 2

.text

_strlen:

  # |--------------------------------|
  # |       <string is in $a0>       |
  # |--------------------------------| sp+8  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+4
  # |               i                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  li $t0, 0
  sw $t0, 0($sp)
_L0:
  lw $t0, 0($sp)
  move $t1, $a0
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 0
  sne $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 0($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 0($sp)
  j _L0
_L1:
  lw $t0, 0($sp)
  move $v0, $t0
  j __leave_strlen

__leave_strlen:
  la $sp, 8($sp)
  jr $ra

_func1:

  # |--------------------------------|
  # |       <strlen is in $a2>       |
  # |--------------------------------| sp+8
  # |       <string is in $a1>       |
  # |--------------------------------| sp+4
  # |       <array is in $a0>        |
  # |--------------------------------| sp+0  <-- start of caller's frame

  li $t0, 5
  li $t1, 2
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)

__leave_func1:
  jr $ra

_func2:

  # |--------------------------------|
  # |              $a2               |
  # |--------------------------------| sp+80
  # |              $a1               |
  # |--------------------------------| sp+76
  # |             string             |
  # |--------------------------------| sp+72  <-- start of caller's frame
  # |             array              |
  # |--------------------------------| sp+32
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |              $ra               |
  # |--------------------------------| sp+24
  # |              $s1               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -72($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)
  sw $ra, 24($sp)
  sw $a0, 72($sp)
  sw $a1, 76($sp)
  sw $a2, 80($sp)

  la $s0, 32($sp)
  lw $s1, 72($sp)
  lw $t0, 72($sp)
  move $a0, $t0
  jal _strlen
  move $t0, $v0
  move $a2, $t0
  move $a1, $s1
  move $a0, $s0
  jal _func1
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 2
  sll $t1, $t0, 2
  la $t0, 32($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

__leave_func2:
  lw $a2, 80($sp)
  lw $a1, 76($sp)
  lw $a0, 72($sp)
  lw $ra, 24($sp)
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  la $sp, 72($sp)
  jr $ra

main:

  # |--------------------------------|
  # |              $a0               |
  # |--------------------------------| sp+24  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)

  la $t0, _str2
  move $a0, $t0
  jal _func2

__leavemain:
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
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
