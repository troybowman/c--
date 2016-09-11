
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

_f:

  # |--------------------------------|
  # |               e                |
  # |--------------------------------| sp+16
  # |         <d is in $a3>          |
  # |--------------------------------| sp+12
  # |         <c is in $a2>          |
  # |--------------------------------| sp+8
  # |         <b is in $a1>          |
  # |--------------------------------| sp+4
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  move $t1, $a1
  move $t2, $a2
  move $t3, $a3
  lw $t4, 16($sp)
  mul $t5, $t3, $t4
  addu $t3, $t2, $t5
  mul $t2, $t1, $t3
  addu $t1, $t0, $t2
  move $v0, $t1
  j __leave_f

__leave_f:
  jr $ra

main:

  # |--------------------------------|
  # |              $a3               |
  # |--------------------------------| sp+44
  # |              $a2               |
  # |--------------------------------| sp+40
  # |              $a1               |
  # |--------------------------------| sp+36
  # |              $a0               |
  # |--------------------------------| sp+32  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |               x                |
  # |--------------------------------| sp+24
  # |              $ra               |
  # |--------------------------------| sp+20
  # |           <stkarg 0>           |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 20($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)
  sw $a2, 40($sp)
  sw $a3, 44($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  li $t4, 5
  sw $t4, 16($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _f
  move $t0, $v0
  sw $t0, 24($sp)
  lw $t0, 24($sp)
  lw $t1, 24($sp)
  lw $t2, 24($sp)
  lw $t3, 24($sp)
  lw $t4, 24($sp)
  sw $t4, 16($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _f
  move $t0, $v0
  sw $t0, 24($sp)
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a3, 44($sp)
  lw $a2, 40($sp)
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 20($sp)
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
