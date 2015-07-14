
.data

  _x:
    .space 1
    .align 2

  _y:
    .space 1
    .align 2

  _z:
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

  li $t0, 'A'
  sb $t0, _x
  li $t0, 'B'
  sb $t0, _y
  li $t0, 'C'
  sb $t0, _z
  lb $t0, _x
  move $a0, $t0
  jal __print_char
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lb $t0, _y
  move $a0, $t0
  jal __print_char
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lb $t0, _z
  move $a0, $t0
  jal __print_char
  la $t0, _str1
  move $a0, $t0
  jal __print_string

__leavemain:
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
