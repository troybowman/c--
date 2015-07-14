
.data

  _x:
    .space 4

  _y:
    .space 4

  _z:
    .space 4

  _str0:
    .asciiz "\n"
    .align 2

.text

main:
  la $sp, -40($sp)
  sw $ra, 16($sp)

  li $t0, 2
  sw $t0, _x
  li $t0, 3
  sw $t0, _y
  li $t0, 4
  sw $t0, _z
  li $t0, 'a'
  lw $t1, _x
  mul $t2, $t0, $t1
  sb $t2, 24($sp)
  lb $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lb $t0, 24($sp)
  lw $t1, _x
  lw $t2, _y
  add $t3, $t1, $t2
  mul $t1, $t0, $t3
  lw $t0, _z
  div $t2, $t1, $t0
  sb $t2, 28($sp)
  lb $t0, 28($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lb $t0, 24($sp)
  lw $t1, _x
  lw $t2, _y
  add $t3, $t1, $t2
  div $t1, $t0, $t3
  lw $t0, _z
  mul $t2, $t1, $t0
  sb $t2, 28($sp)
  lb $t0, 28($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lb $t0, 24($sp)
  lw $t1, _x
  lw $t2, _y
  add $t3, $t1, $t2
  div $t1, $t0, $t3
  lw $t0, _z
  mul $t2, $t1, $t0
  lb $t0, 24($sp)
  sub $t1, $t2, $t0
  lb $t0, 28($sp)
  add $t2, $t1, $t0
  sb $t2, 32($sp)
  lb $t0, 32($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $ra, 16($sp)
  la $sp, 40($sp)
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
