
.data

  _x:
    .space 4

  _y:
    .space 1
    .align 2

  _str0:
    .asciiz "\n"
    .align 2

.text

_f:
  la $sp, -0($sp)

  move $t0, $a0
  li $t1, 1
  add $t2, $t0, $t1
  move $v0, $t2
  j __leave_f

__leave_f:
  la $sp, 0($sp)
  jr $ra

main:
  la $sp, -24($sp)
  sw $ra, 20($sp)
  sw $s0, 16($sp)

  li $t0, 1
  sb $t0, _y
  lb $t0, _y
  move $a0, $t0
  jal _f
  move $t0, $v0
  sw $t0, _x
  lw $s0, _x
  lw $t0, _x
  move $a0, $t0
  jal _f
  move $t0, $v0
  add $t1, $s0, $t0
  sb $t1, _y
  lb $s0, _y
  li $t0, 'Q'
  move $a0, $t0
  jal _f
  move $t0, $v0
  add $t1, $s0, $t0
  sw $t1, _x
  lw $t0, _x
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $s0, 16($sp)
  lw $ra, 20($sp)
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
