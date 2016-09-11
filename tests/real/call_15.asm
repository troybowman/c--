
.data

  _y:
    .space 4

  _str0:
    .asciiz "\n"
    .align 2

.text

_add:

  # |--------------------------------|
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  lw $t1, _y
  addu $t2, $t0, $t1
  sw $t2, _y
  j __leave_add

__leave_add:
  jr $ra

main:

  # |--------------------------------|
  # |              $a0               |
  # |--------------------------------| sp+32  <-- start of caller's frame
  # |               f                |
  # |--------------------------------| sp+28
  # |               i                |
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
  sw $t0, 28($sp)
  li $t0, 7
  sw $t0, 24($sp)
_L0:
  lw $t0, 24($sp)
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 24($sp)
  sw $t0, _y
  li $t0, 0
  move $a0, $t0
  jal _add
  li $t0, 1
  move $a0, $t0
  jal _add
  li $t0, 2
  move $a0, $t0
  jal _add
  li $t0, 5
  sub $t1, $zero, $t0
  move $a0, $t1
  jal _add
  li $t0, 2
  move $a0, $t0
  jal _add
  lw $t0, 28($sp)
  lw $t1, _y
  mul $t2, $t0, $t1
  sw $t2, 28($sp)
  lw $t0, 24($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L0
_L1:
  lw $t0, 28($sp)
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
