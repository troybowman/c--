
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

  _LIM:
    .space 4

  _res:
    .space 4

  _str0:
    .asciiz "\n"
    .align 2

.text

main:
  la $sp, -24($sp)
  sw $ra, 16($sp)

  li $t0, 0
  sw $t0, _a
  li $t0, 3
  sw $t0, _LIM
  li $t0, 0
  sw $t0, _res
_L0:
  lw $t0, _a
  lw $t1, _LIM
  slt $t2, $t0, $t1
  beq $t2, $zero, _L9
  li $t0, 0
  sw $t0, _b
_L1:
  lw $t0, _b
  lw $t1, _LIM
  slt $t2, $t0, $t1
  beq $t2, $zero, _L8
  li $t0, 0
  sw $t0, _c
_L2:
  lw $t0, _c
  lw $t1, _LIM
  slt $t2, $t0, $t1
  beq $t2, $zero, _L7
  li $t0, 0
  sw $t0, _d
_L3:
  lw $t0, _d
  lw $t1, _LIM
  slt $t2, $t0, $t1
  beq $t2, $zero, _L6
  li $t0, 0
  sw $t0, _e
_L4:
  lw $t0, _e
  lw $t1, _LIM
  slt $t2, $t0, $t1
  beq $t2, $zero, _L5
  lw $t0, _res
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, _res
  lw $t0, _e
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, _e
  j _L4
_L5:
  lw $t0, _d
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, _d
  j _L3
_L6:
  lw $t0, _c
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, _c
  j _L2
_L7:
  lw $t0, _b
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, _b
  j _L1
_L8:
  lw $t0, _a
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, _a
  j _L0
_L9:
  lw $t0, _res
  move $a0, $t0
  jal __print_int
  la $t0, _str0
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
