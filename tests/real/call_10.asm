
.data

  _x:
    .space 4

  _str0:
    .asciiz "\n"
    .align 2

.text

_f:

  # |--------------------------------|
  # |         <i is in $a0>          |
  # |--------------------------------| sp+8  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+4
  # |               y                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  li $t0, 1
  sw $t0, 0($sp)
_L0:
  move $t0, $a0
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, _x
  move $t1, $a0
  mul $t2, $t0, $t1
  sw $t2, _x
  li $t0, 2
  lw $t1, 0($sp)
  mul $t2, $t0, $t1
  sw $t2, 0($sp)
  move $t0, $a0
  li $t1, 1
  sub $t2, $t0, $t1
  move $a0, $t2
  j _L0
_L1:
  lw $t0, 0($sp)
  move $v0, $t0
  j __leave_f

__leave_f:
  la $sp, 8($sp)
  jr $ra

main:

  # |--------------------------------|
  # |              $a0               |
  # |--------------------------------| sp+32  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |               a                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 16($sp)
  sw $a0, 32($sp)

  li $t0, 1
  sw $t0, _x
  li $t0, 6
  move $a0, $t0
  jal _f
  move $t0, $v0
  sw $t0, 24($sp)
  lw $t0, 24($sp)
  lw $t1, _x
  addu $t2, $t0, $t1
  sw $t2, _x
  lw $t0, _x
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a0, 32($sp)
  lw $ra, 16($sp)
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
