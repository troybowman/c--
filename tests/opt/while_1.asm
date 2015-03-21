
.data

  _i:
    .space 4

  _x:
    .space 20

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
  sw $t0, _i
_L0:
  lw $t0, _i
  li $t1, 5
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, _i
  lw $t1, _i
  sll $t2, $t1, 2
  la $t1, _x
  add $t3, $t1, $t2
  sw $t0, ($t3)
  lw $t0, _i
  li $t1, 1
  add $t2, $t0, $t1
  sw $t2, _i
  j _L0
_L1:
  li $t0, 123
  sw $t0, _res
_L2:
  lw $t0, _i
  li $t1, 5
  div $t2, $t0, $t1
  sll $t0, $t2, 2
  la $t1, _x
  add $t2, $t1, $t0
  lw $t0, ($t2)
  lw $t1, _i
  li $t2, 4
  div $t3, $t1, $t2
  sll $t1, $t3, 2
  la $t2, _x
  add $t3, $t2, $t1
  lw $t1, ($t3)
  sle $t2, $t0, $t1
  lw $t0, _i
  li $t1, 4
  div $t3, $t0, $t1
  sll $t0, $t3, 2
  la $t1, _x
  add $t3, $t1, $t0
  lw $t0, ($t3)
  lw $t1, _i
  li $t3, 3
  div $t4, $t1, $t3
  sll $t1, $t4, 2
  la $t3, _x
  add $t4, $t3, $t1
  lw $t1, ($t4)
  sle $t3, $t0, $t1
  and $t0, $t2, $t3
  lw $t1, _i
  li $t2, 2
  div $t3, $t1, $t2
  sll $t1, $t3, 2
  la $t2, _x
  add $t3, $t2, $t1
  lw $t1, ($t3)
  lw $t2, _i
  li $t3, 3
  div $t4, $t2, $t3
  sll $t2, $t4, 2
  la $t3, _x
  add $t4, $t3, $t2
  lw $t2, ($t4)
  sgt $t3, $t1, $t2
  lw $t1, _i
  li $t2, 3
  div $t4, $t1, $t2
  sll $t1, $t4, 2
  la $t2, _x
  add $t4, $t2, $t1
  lw $t1, ($t4)
  lw $t2, _i
  li $t4, 4
  div $t5, $t2, $t4
  sll $t2, $t5, 2
  la $t4, _x
  add $t5, $t4, $t2
  lw $t2, ($t5)
  sgt $t4, $t1, $t2
  or $t1, $t3, $t4
  lw $t2, _i
  li $t3, 4
  div $t4, $t2, $t3
  sll $t2, $t4, 2
  la $t3, _x
  add $t4, $t3, $t2
  lw $t2, ($t4)
  lw $t3, _i
  li $t4, 5
  div $t5, $t3, $t4
  sll $t3, $t5, 2
  la $t4, _x
  add $t5, $t4, $t3
  lw $t3, ($t5)
  sgt $t4, $t2, $t3
  or $t2, $t1, $t4
  xor $t1, $t2, 1
  xor $t2, $t1, 1
  xor $t1, $t2, 1
  and $t2, $t0, $t1
  xor $t0, $t2, 1
  beq $t0, $zero, _L3
  lw $t0, _res
  lw $t1, _i
  mul $t2, $t0, $t1
  sw $t2, _res
  lw $t0, _i
  li $t1, 1
  sub $t2, $t0, $t1
  sw $t2, _i
  j _L2
_L3:
  lw $t0, _res
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

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
