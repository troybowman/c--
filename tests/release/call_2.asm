
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

_add:
  la $sp, -0($sp)

  move $t0, $a0
  move $t1, $a1
  add $t2, $t0, $t1
  move $v0, $t2
  j __leave_add

__leave_add:
  la $sp, 0($sp)
  jr $ra

main:
  la $sp, -64($sp)
  sw $ra, 28($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)
  sw $s2, 24($sp)

  li $t0, 1
  sw $t0, 56($sp)
  li $t0, 7
  sw $t0, 52($sp)
_L0:
  lw $t0, 52($sp)
  li $t1, 0
  sgt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $s0, 56($sp)
  li $s1, 1
  li $s2, 2
  lw $t0, 52($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  move $a1, $t0
  move $a0, $s2
  jal _add
  move $t0, $v0
  li $t1, 5
  sub $t2, $zero, $t1
  move $a1, $t2
  move $a0, $t0
  jal _add
  move $t0, $v0
  move $a1, $t0
  move $a0, $s1
  jal _add
  move $t0, $v0
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _add
  move $t0, $v0
  mul $t1, $s0, $t0
  sw $t1, 56($sp)
  lw $t0, 52($sp)
  li $t1, 1
  sub $t2, $t0, $t1
  sw $t2, 52($sp)
  j _L0
_L1:
  lw $t0, 56($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $s2, 24($sp)
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  lw $ra, 28($sp)
  la $sp, 64($sp)
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
