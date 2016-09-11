
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

main:

  # |--------------------------------|
  # |              $a1               |
  # |--------------------------------| sp+68
  # |              $a0               |
  # |--------------------------------| sp+64  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+60
  # |               f                |
  # |--------------------------------| sp+56
  # |               i                |
  # |--------------------------------| sp+52
  # |               e                |
  # |--------------------------------| sp+48
  # |               d                |
  # |--------------------------------| sp+44
  # |               c                |
  # |--------------------------------| sp+40
  # |               b                |
  # |--------------------------------| sp+36
  # |               a                |
  # |--------------------------------| sp+32
  # |              $ra               |
  # |--------------------------------| sp+28
  # |              $s2               |
  # |--------------------------------| sp+24
  # |              $s1               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -64($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)
  sw $s2, 24($sp)
  sw $ra, 28($sp)
  sw $a0, 64($sp)
  sw $a1, 68($sp)

  li $t0, 1
  sw $t0, 56($sp)
  li $t0, 7
  sw $t0, 52($sp)
_L0:
  lw $t0, 52($sp)
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $s0, 56($sp)
  li $s1, 1
  li $s2, 2
  lw $t0, 52($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  move $a1, $t0
  move $a0, $s2
  jal _add
  move $t0, $v0
  li $t1, 5
  sub $t2, $zero, $t1
  move $a1, $t2
  move $a0, $t0
  jal _add
  move $t0, $v0
  move $a1, $t0
  move $a0, $s1
  jal _add
  move $t0, $v0
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  mul $t1, $s0, $t0
  sw $t1, 56($sp)
  lw $t0, 52($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  sw $t2, 52($sp)
  j _L0
_L1:
  lw $t0, 56($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a1, 68($sp)
  lw $a0, 64($sp)
  lw $ra, 28($sp)
  lw $s2, 24($sp)
  lw $s1, 20($sp)
  lw $s0, 16($sp)
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
