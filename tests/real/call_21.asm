
.data

  _str0:
    .asciiz "z: "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

.text

_func1:

  # |--------------------------------|
  # |         <z is in $a2>          |
  # |--------------------------------| sp+8
  # |         <y is in $a1>          |
  # |--------------------------------| sp+4
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  li $t0, 1
  sub $t1, $zero, $t0
  move $a0, $t1
  li $t0, 1
  sub $t1, $zero, $t0
  move $a1, $t1
  li $t0, 1
  sub $t1, $zero, $t0
  move $a2, $t1

__leave_func1:
  jr $ra

_func2:

  # |--------------------------------|
  # |              $a2               |
  # |--------------------------------| sp+32
  # |               y                |
  # |--------------------------------| sp+28
  # |               x                |
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
  sw $a1, 28($sp)
  sw $a2, 32($sp)

  lw $t0, 24($sp)
  lw $t1, 28($sp)
  li $t2, 0
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _func1

__leave_func2:
  lw $a2, 32($sp)
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

_func3:

  # |--------------------------------|
  # |         <z is in $a2>          |
  # |--------------------------------| sp+32
  # |               y                |
  # |--------------------------------| sp+28
  # |               x                |
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
  sw $a1, 28($sp)

  lw $t0, 24($sp)
  lw $t1, 28($sp)
  move $a1, $t1
  move $a0, $t0
  jal _func2
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  move $t0, $a2
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

__leave_func3:
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

main:

  # |--------------------------------|
  # |              $a2               |
  # |--------------------------------| sp+32
  # |              $a1               |
  # |--------------------------------| sp+28
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
  sw $a1, 28($sp)
  sw $a2, 32($sp)

  li $t0, 5
  li $t1, 6
  li $t2, 7
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _func3

__leavemain:
  lw $a2, 32($sp)
  lw $a1, 28($sp)
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
