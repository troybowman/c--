
.data

  _x:
    .space 40

  _str0:
    .asciiz "\n"
    .align 2

.text

_init:
  la $sp, -8($sp)

  li $t0, 0
  sw $t0, 0($sp)
_L0:
  lw $t0, 0($sp)
  move $t1, $a1
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 0($sp)
  lw $t1, 0($sp)
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  lw $t0, 0($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 0($sp)
  j _L0
_L1:
  move $t0, $a1
  move $v0, $t0
  j __leave_init

__leave_init:
  la $sp, 8($sp)
  jr $ra

_count:
  la $sp, -8($sp)

  li $t0, 0
  sw $t0, 0($sp)
  move $t0, $a1
  li $t1, 1
  sub $t2, $t0, $t1
  move $a1, $t2
_L2:
  move $t0, $a1
  li $t1, 0
  sge $t2, $t0, $t1
  beq $t2, $zero, _L3
  lw $t0, 0($sp)
  move $t1, $a1
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  lw $t1, ($t3)
  addu $t2, $t0, $t1
  sw $t2, 0($sp)
  move $t0, $a1
  li $t1, 1
  sub $t2, $t0, $t1
  move $a1, $t2
  j _L2
_L3:
  lw $t0, 0($sp)
  move $v0, $t0
  j __leave_count

__leave_count:
  la $sp, 8($sp)
  jr $ra

main:
  la $sp, -32($sp)
  sw $ra, 20($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)
  sw $s0, 16($sp)

  la $t0, _x
  li $t1, 10
  move $a1, $t1
  move $a0, $t0
  jal _init
  move $t0, $v0
  sw $t0, 24($sp)
  lw $s0, 24($sp)
  la $t0, _x
  li $t1, 10
  move $a1, $t1
  move $a0, $t0
  jal _count
  move $t0, $v0
  addu $t1, $s0, $t0
  sw $t1, 24($sp)
  lw $t0, 24($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $s0, 16($sp)
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 20($sp)
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
