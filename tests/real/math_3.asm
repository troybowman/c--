
.data

  _str0:
    .asciiz " "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

.text

main:

  # |--------------------------------|
  # |              $a0               |
  # |--------------------------------| sp+24  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)

  li $t0, 1
  li $t1, 0
  sllv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 1
  sllv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 2
  sllv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 3
  sllv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 4
  sllv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 8
  li $t1, 0
  srlv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 8
  li $t1, 1
  srlv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 8
  li $t1, 2
  srlv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 8
  li $t1, 3
  srlv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 8
  li $t1, 4
  srlv $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 0
  and $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 1
  and $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 2
  and $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 3
  and $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 4
  and $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 0
  or $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 1
  or $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 2
  or $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 3
  or $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 4
  or $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 0
  li $t1, 0
  xor $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  li $t1, 0
  xor $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 2
  li $t1, 1
  xor $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 3
  li $t1, 2
  xor $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 4
  li $t1, 3
  xor $t2, $t0, $t1
  move $a0, $t2
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 0
  not $t1, $t0
  move $a0, $t1
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 1
  not $t1, $t0
  move $a0, $t1
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 2
  not $t1, $t0
  move $a0, $t1
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 3
  not $t1, $t0
  move $a0, $t1
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  li $t0, 4
  not $t1, $t0
  move $a0, $t1
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
