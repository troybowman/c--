
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

main:

  # |--------------------------------|
  # |              $a0               |
  # |--------------------------------| sp+48  <-- start of caller's frame
  # |              res               |
  # |--------------------------------| sp+44
  # |               b                |
  # |--------------------------------| sp+40
  # |               a                |
  # |--------------------------------| sp+36
  # |               k                |
  # |--------------------------------| sp+32
  # |               j                |
  # |--------------------------------| sp+28
  # |               i                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -48($sp)
  sw $ra, 16($sp)
  sw $a0, 48($sp)

  li $t0, 123
  sw $t0, 44($sp)
  li $t0, 0
  sw $t0, 24($sp)
_L0:
  lw $t0, 24($sp)
  li $t1, 5
  slt $t2, $t0, $t1
  beq $t2, $zero, _L8
  li $t0, 0
  sw $t0, 28($sp)
_L1:
  lw $t0, 28($sp)
  li $t1, 5
  slt $t2, $t0, $t1
  beq $t2, $zero, _L7
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  addu $t2, $t0, $t1
  li $t0, 2
  div $t1, $t2, $t0
  sw $t1, 32($sp)
  lw $t0, 32($sp)
  lw $t1, 24($sp)
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L6
  li $t0, 0
  sw $t0, 36($sp)
_L2:
  lw $t0, 36($sp)
  li $t1, 5
  slt $t2, $t0, $t1
  beq $t2, $zero, _L5
  lw $t0, 36($sp)
  lw $t1, 32($sp)
  addu $t2, $t0, $t1
  li $t0, 2
  div $t1, $t2, $t0
  sw $t1, 40($sp)
  lw $t0, 40($sp)
  lw $t1, 28($sp)
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L3
  lw $t0, 44($sp)
  lw $t1, 40($sp)
  addu $t2, $t0, $t1
  sw $t2, 44($sp)
  j _L4
_L3:
  lw $t0, 44($sp)
  lw $t1, 32($sp)
  addu $t2, $t0, $t1
  sw $t2, 44($sp)
_L4:
  lw $t0, 36($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 36($sp)
  j _L2
_L5:
_L6:
  lw $t0, 28($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 28($sp)
  j _L1
_L7:
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L0
_L8:
  lw $t0, 44($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a0, 48($sp)
  lw $ra, 16($sp)
  la $sp, 48($sp)
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
