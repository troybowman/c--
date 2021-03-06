
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

_f:

  # |--------------------------------|
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  li $t1, 1
  addu $t2, $t0, $t1
  move $v0, $t2
  j __leave_f

__leave_f:
  jr $ra

main:

  # |--------------------------------|
  # |              $a0               |
  # |--------------------------------| sp+32  <-- start of caller's frame
  # |               y                |
  # |--------------------------------| sp+28
  # |               x                |
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

  li $t0, 1
  sb $t0, 28($sp)
  lb $t0, 28($sp)
  move $a0, $t0
  jal _f
  move $t0, $v0
  sw $t0, 24($sp)
  lw $s0, 24($sp)
  lw $t0, 24($sp)
  move $a0, $t0
  jal _f
  move $t0, $v0
  addu $t1, $s0, $t0
  sb $t1, 28($sp)
  lb $s0, 28($sp)
  li $t0, 'Q'
  move $a0, $t0
  jal _f
  move $t0, $v0
  addu $t1, $s0, $t0
  sw $t1, 24($sp)
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
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
