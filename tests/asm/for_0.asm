
.data

  _str0:
    .asciiz "test"
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

main:

  # |--------------------------------|
  # |              $a1               |
  # |--------------------------------| sp+36
  # |              $a0               |
  # |--------------------------------| sp+32  <-- start of caller's frame
  # |           <padding>            |
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
  sw $a1, 36($sp)

_L0:
  li $t0, 1
  beq $t0, $zero, _L1
  li $t0, 1
  sw $t0, 24($sp)
  j _L0
_L1:
  li $t0, 0
  sw $t0, 24($sp)
_L2:
  lw $t0, 24($sp)
  li $t1, 10
  slt $t2, $t0, $t1
  beq $t2, $zero, _L3
  la $t0, _str0
  lw $t1, 24($sp)
  move $a1, $t1
  move $a0, $t0
  jal _char_at
  move $t0, $v0
  sw $t0, 24($sp)
  li $t0, 5
  sw $t0, 24($sp)
  j _L2
_L3:
_L4:
  lw $t0, 24($sp)
  li $t1, 10
  slt $t2, $t0, $t1
  beq $t2, $zero, _L5
  la $t0, _str0
  lw $t1, 24($sp)
  move $a1, $t1
  move $a0, $t0
  jal _char_at
  move $t0, $v0
  sw $t0, 24($sp)
  j __leavemain
  j _L4
_L5:

__leavemain:
  lw $a1, 36($sp)
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
