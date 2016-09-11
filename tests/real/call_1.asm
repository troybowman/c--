
.data

  _str0:
    .asciiz "a is now: "
    .align 2

  _str1:
    .asciiz "\n"
    .align 2

  _str2:
    .asciiz "b is now: "
    .align 2

  _str3:
    .asciiz "c is now: "
    .align 2

  _str4:
    .asciiz "d is now: "
    .align 2

  _str5:
    .asciiz "e is now: "
    .align 2

  _str6:
    .asciiz "f is now: "
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
  # |--------------------------------| sp+60
  # |              $a0               |
  # |--------------------------------| sp+56  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+52
  # |               f                |
  # |--------------------------------| sp+48
  # |               i                |
  # |--------------------------------| sp+44
  # |               e                |
  # |--------------------------------| sp+40
  # |               d                |
  # |--------------------------------| sp+36
  # |               c                |
  # |--------------------------------| sp+32
  # |               b                |
  # |--------------------------------| sp+28
  # |               a                |
  # |--------------------------------| sp+24
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -56($sp)
  sw $s0, 16($sp)
  sw $ra, 20($sp)
  sw $a0, 56($sp)
  sw $a1, 60($sp)

  li $t0, 1
  sw $t0, 48($sp)
  li $t0, 7
  sw $t0, 44($sp)
_L0:
  lw $t0, 44($sp)
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 44($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  sw $t0, 24($sp)
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  sw $t0, 28($sp)
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  li $t0, 2
  lw $t1, 28($sp)
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  sw $t0, 32($sp)
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 5
  sub $t2, $zero, $t1
  move $a1, $t2
  move $a0, $t0
  jal _add
  move $t0, $v0
  sw $t0, 36($sp)
  la $t0, _str4
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  sw $t0, 40($sp)
  la $t0, _str5
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $s0, 48($sp)
  lw $t0, 40($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  mul $t1, $s0, $t0
  sw $t1, 48($sp)
  la $t0, _str6
  move $a0, $t0
  jal __print_string
  lw $t0, 48($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 44($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  sw $t2, 44($sp)
  j _L0
_L1:
  lw $t0, 48($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a1, 60($sp)
  lw $a0, 56($sp)
  lw $ra, 20($sp)
  lw $s0, 16($sp)
  la $sp, 56($sp)
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
