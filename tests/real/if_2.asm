
.data

  _a:
    .space 4

  _b:
    .space 4

  _c:
    .space 4

  _d:
    .space 4

  _e:
    .space 4

  _f:
    .space 4

  _g:
    .space 4

  _res:
    .space 4

  _str0:
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
  sw $t0, _a
  li $t0, 2
  sw $t0, _b
  li $t0, 3
  sw $t0, _c
  li $t0, 4
  sw $t0, _d
  li $t0, 5
  sw $t0, _e
  li $t0, 6
  sw $t0, _f
  lw $t0, _a
  lw $t1, _b
  slt $t2, $t0, $t1
  beq $t2, $zero, _L6
  lw $t0, _b
  lw $t1, _c
  sge $t2, $t0, $t1
  beq $t2, $zero, _L5
  lw $t0, _c
  lw $t1, _d
  slt $t2, $t0, $t1
  beq $t2, $zero, _L4
  lw $t0, _d
  lw $t1, _e
  sne $t2, $t0, $t1
  beq $t2, $zero, _L3
  lw $t0, _e
  lw $t1, _f
  slt $t2, $t0, $t1
  beq $t2, $zero, _L2
  lw $t0, _g
  lw $t1, _f
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, _g
  lw $t1, _a
  slt $t2, $t0, $t1
  beq $t2, $zero, _L0
  li $t0, 1111
  sw $t0, _res
  j _L7
_L0:
  li $t0, 2222
  sw $t0, _res
  j _L7
_L1:
  li $t0, 3333
  sw $t0, _res
  j _L7
_L2:
  li $t0, 4444
  sw $t0, _res
  j _L7
_L3:
  li $t0, 5555
  sw $t0, _res
  j _L7
_L4:
  li $t0, 6666
  sw $t0, _res
  j _L7
_L5:
  li $t0, 7777
  sw $t0, _res
  j _L7
_L6:
  li $t0, 8888
  sw $t0, _res
_L7:
  lw $t0, _res
  move $a0, $t0
  jal __print_int
  la $t0, _str0
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
