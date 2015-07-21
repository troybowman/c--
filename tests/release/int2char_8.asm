
.data

  _x:
    .space 4

  _y:
    .space 1
    .align 2

  _str0:
    .asciiz "x: "
    .align 2

  _str1:
    .asciiz " "
    .align 2

  _str2:
    .asciiz "\n"
    .align 2

  _str3:
    .asciiz "y: "
    .align 2

.text

main:
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)

  li $t0, 123456
  sw $t0, _x
  lw $t0, _x
  sb $t0, _y
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, _x
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, _x
  move $a0, $t0
  jal __print_char
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  lb $t0, _y
  move $a0, $t0
  jal __print_char
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lb $t0, _y
  move $a0, $t0
  jal __print_int
  la $t0, _str2
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
