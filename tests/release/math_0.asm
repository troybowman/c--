
.data

  _x:
    .space 4

  _y:
    .space 1
    .align 2

  _z:
    .space 4

  _u:
    .space 1
    .align 2

  _str0:
    .asciiz " "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

.text

main:
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)

  li $t0, 345
  sw $t0, _x
  li $t0, 10
  sb $t0, _y
  lw $t0, _x
  lb $t1, _y
  sub $t2, $t0, $t1
  sw $t2, _x
  li $t0, 2
  sub $t1, $zero, $t0
  sb $t1, _y
  lw $t0, _x
  lb $t1, _y
  addu $t2, $t0, $t1
  sw $t2, _x
  lw $t0, _x
  lb $t1, _y
  div $t2, $t0, $t1
  sw $t2, _z
  lw $t0, _z
  lb $t1, _y
  mul $t2, $t0, $t1
  sb $t2, _u
  lw $t0, _x
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lb $t0, _y
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, _z
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lb $t0, _u
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

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
