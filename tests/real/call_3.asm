
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

_add:

  # |--------------------------------|
  # |         <y is in $a1>          |
  # |--------------------------------| sp+4
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  move $t1, $a1
  addu $t2, $t0, $t1
  move $v0, $t2
  j __leave_add

__leave_add:
  jr $ra

_two:

  # |--------------------------------|

  li $t0, 2
  move $v0, $t0
  j __leave_two

__leave_two:
  jr $ra

main:

  # |--------------------------------|
  # |              $a1               |
  # |--------------------------------| sp+36
  # |              $a0               |
  # |--------------------------------| sp+32  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |               f                |
  # |--------------------------------| sp+24
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $s0, 16($sp)
  sw $ra, 20($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)

  li $s0, 1
  jal _two
  move $t0, $v0
  move $a1, $t0
  move $a0, $s0
  jal _add
  move $t0, $v0
  sw $t0, 24($sp)
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 20($sp)
  lw $s0, 16($sp)
  la $sp, 32($sp)
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
