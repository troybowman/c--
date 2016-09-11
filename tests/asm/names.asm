
.data

  _str1:
    .space 1
    .align 2

  _str3:
    .space 1
    .align 2

  _str5:
    .space 1
    .align 2

  _str0:
    .asciiz "test one"
    .align 2

  _str2:
    .asciiz "test two"
    .align 2

  _str4:
    .asciiz "test three"
    .align 2

.text

_char_at:

  # |--------------------------------|
  # |        <idx is in $a1>         |
  # |--------------------------------| sp+4
  # |       <string is in $a0>       |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a1
  move $t1, $a0
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  move $v0, $t0
  j __leave_char_at

__leave_char_at:
  jr $ra

_L0:

  # |--------------------------------|
  # |              $a1               |
  # |--------------------------------| sp+28
  # |             string             |
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
  sw $a1, 28($sp)

  lw $t0, 24($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _char_at
  move $t0, $v0
  move $v0, $t0
  j __leave_L0

__leave_L0:
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

_L2:

  # |--------------------------------|
  # |              $a1               |
  # |--------------------------------| sp+28
  # |             string             |
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
  sw $a1, 28($sp)

  lw $t0, 24($sp)
  li $t1, 2
  move $a1, $t1
  move $a0, $t0
  jal _char_at
  move $t0, $v0
  move $v0, $t0
  j __leave_L2

__leave_L2:
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

_L4:

  # |--------------------------------|
  # |              $a1               |
  # |--------------------------------| sp+28
  # |             string             |
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
  sw $a1, 28($sp)

  lw $t0, 24($sp)
  li $t1, 4
  move $a1, $t1
  move $a0, $t0
  jal _char_at
  move $t0, $v0
  move $v0, $t0
  j __leave_L4

__leave_L4:
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

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

  la $t0, _str0
  move $a0, $t0
  jal _L0
  move $t0, $v0
  sb $t0, _str1
  la $t0, _str2
  move $a0, $t0
  jal _L2
  move $t0, $v0
  sb $t0, _str3
  la $t0, _str4
  move $a0, $t0
  jal _L4
  move $t0, $v0
  sb $t0, _str5
  lb $t0, _str1
  lb $t1, _str3
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lb $t0, _str1
  move $a0, $t0
  jal print_int
  j _L5
_L1:
  lb $t0, _str5
  li $t1, 16
  seq $t2, $t0, $t1
  beq $t2, $zero, _L3
  lb $t0, _str3
  move $a0, $t0
  jal print_int
  j _L5
_L3:
  lb $t0, _str5
  move $a0, $t0
  jal print_int
_L5:

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
