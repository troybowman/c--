
.data

  _x:
    .space 4

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
  la $sp, -32($sp)
  sw $ra, 16($sp)

  li $t0, 'Q'
  sb $t0, 24($sp)
  lb $t0, 24($sp)
  sw $t0, _x
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
  lb $t0, 24($sp)
  move $a0, $t0
  jal __print_char
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lb $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $ra, 16($sp)
  la $sp, 32($sp)
  jr $ra

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
