
.data

  _str0:
    .asciiz "this should print\n"
    .align 2

  _str1:
    .asciiz "this should also print\n"
    .align 2

  _str2:
    .asciiz "this shouldn't print\n"
    .align 2

  _str3:
    .asciiz "finally, this should print\n"
    .align 2

.text

main:
  la $sp, -32($sp)
  sw $ra, 16($sp)

  li $t0, 5
  sw $t0, 24($sp)
  li $t0, 6
  sw $t0, 28($sp)
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  seq $t2, $t0, $t1
  xor $t0, $t2, 1
  beq $t0, $zero, _L0
  la $t0, _str0
  move $a0, $t0
  jal __print_string
_L0:
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  slt $t2, $t0, $t1
  lw $t0, 24($sp)
  lw $t1, 24($sp)
  sne $t3, $t0, $t1
  xor $t0, $t3, 1
  and $t1, $t2, $t0
  beq $t1, $zero, _L1
  la $t0, _str1
  move $a0, $t0
  jal __print_string
_L1:
  lw $t0, 24($sp)
  lw $t1, 28($sp)
  sne $t2, $t0, $t1
  lw $t0, 28($sp)
  lw $t1, 28($sp)
  seq $t3, $t0, $t1
  and $t0, $t2, $t3
  xor $t1, $t0, 1
  beq $t1, $zero, _L2
  la $t0, _str2
  move $a0, $t0
  jal __print_string
_L2:
  lw $t0, 24($sp)
  li $t1, 5
  seq $t2, $t0, $t1
  xor $t0, $t2, 1
  xor $t1, $t0, 1
  xor $t0, $t1, 1
  xor $t1, $t0, 1
  beq $t1, $zero, _L3
  la $t0, _str3
  move $a0, $t0
  jal __print_string
_L3:
  li $t0, 0
  move $v0, $t0
  j __leavemain

__leavemain:
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
