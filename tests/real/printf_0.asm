
.data

  _str0:
    .asciiz "one: "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

  _str2:
    .asciiz "two: "
    .align 2

  _str3:
    .asciiz "three: "
    .align 2

  _str4:
    .asciiz "hello"
    .align 2

  _str5:
    .asciiz "all together: ("
    .align 2

  _str6:
    .asciiz ", "
    .align 2

  _str7:
    .asciiz "hello again"
    .align 2

  _str8:
    .asciiz ")\n"
    .align 2

  _str9:
    .asciiz ""
    .align 2

  _str10:
    .asciiz "c"
    .align 2

  _str11:
    .asciiz "c%%"
    .align 2

  _str12:
    .asciiz "%%"
    .align 2

  _str13:
    .asciiz "ccc"
    .align 2

  _str14:
    .asciiz "s"
    .align 2

  _str15:
    .asciiz "d\n"
    .align 2

.text

main:

  # |--------------------------------|
  # |              $a0               |
  # |--------------------------------| sp+32  <-- start of caller's frame
  # |               c                |
  # |--------------------------------| sp+28
  # |               x                |
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

  li $t0, 66
  sw $t0, 24($sp)
  li $t0, 'a'
  sb $t0, 28($sp)
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  lb $t0, 28($sp)
  move $a0, $t0
  jal __print_char
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  la $t0, _str4
  move $a0, $t0
  jal __print_string
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  la $t0, _str5
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str6
  move $a0, $t0
  jal __print_string
  lb $t0, 28($sp)
  move $a0, $t0
  jal __print_char
  la $t0, _str6
  move $a0, $t0
  jal __print_string
  la $t0, _str7
  move $a0, $t0
  jal __print_string
  la $t0, _str8
  move $a0, $t0
  jal __print_string
  la $t0, _str9
  move $a0, $t0
  jal __print_string
  la $t0, _str9
  move $a0, $t0
  jal __print_string
  la $t0, _str10
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_char
  la $t0, _str11
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str12
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_char
  la $t0, _str13
  move $a0, $t0
  jal __print_string
  lb $t0, 28($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str14
  move $a0, $t0
  jal __print_string
  la $t0, _str9
  move $a0, $t0
  jal __print_string
  la $t0, _str14
  move $a0, $t0
  jal __print_string
  lb $t0, 28($sp)
  move $a0, $t0
  jal __print_char
  lb $t0, 28($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str15
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
