
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

  _h:
    .space 4

  _i:
    .space 4

  _j:
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
  li $t0, 7
  sw $t0, _g
  li $t0, 8
  sw $t0, _h
  li $t0, 9
  sw $t0, _i
  li $t0, 10
  sw $t0, _j
  lw $t0, _a
  lw $t1, _b
  sle $t2, $t0, $t1
  lw $t0, _b
  lw $t1, _c
  sle $t3, $t0, $t1
  and $t0, $t2, $t3
  lw $t1, _c
  lw $t2, _d
  sle $t3, $t1, $t2
  and $t1, $t0, $t3
  lw $t0, _d
  lw $t2, _e
  sle $t3, $t0, $t2
  and $t0, $t1, $t3
  lw $t1, _e
  lw $t2, _f
  sgt $t3, $t1, $t2
  lw $t1, _f
  lw $t2, _g
  sgt $t4, $t1, $t2
  or $t1, $t3, $t4
  lw $t2, _g
  lw $t3, _h
  sgt $t4, $t2, $t3
  or $t2, $t1, $t4
  lw $t1, _h
  lw $t3, _i
  sgt $t4, $t1, $t3
  or $t1, $t2, $t4
  lw $t2, _i
  lw $t3, _j
  sgt $t4, $t2, $t3
  or $t2, $t1, $t4
  xor $t1, $t2, 1
  xor $t2, $t1, 1
  xor $t1, $t2, 1
  and $t2, $t0, $t1
  beq $t2, $zero, _L0
  li $t0, 1111
  sw $t0, _res
  j _L1
_L0:
  li $t0, 2222
  sw $t0, _res
_L1:
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
