
.data

  _str0:
    .asciiz "abcdefg"
    .align 2

  _str1:
    .asciiz "hey"
    .align 2

.text

_dub:

  # |--------------------------------|
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  li $t1, 2
  mul $t2, $t0, $t1
  move $v0, $t2
  j __leave_dub

__leave_dub:
  jr $ra

_half:

  # |--------------------------------|
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  li $t1, 2
  div $t2, $t0, $t1
  move $v0, $t2
  j __leave_half

__leave_half:
  jr $ra

_sum:

  # |--------------------------------|
  # |         <z is in $a2>          |
  # |--------------------------------| sp+8
  # |         <y is in $a1>          |
  # |--------------------------------| sp+4
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  move $t1, $a1
  addu $t2, $t0, $t1
  move $t0, $a2
  addu $t1, $t2, $t0
  move $v0, $t1
  j __leave_sum

__leave_sum:
  jr $ra

_sumchars:

  # |--------------------------------|
  # |        <len is in $a1>         |
  # |--------------------------------| sp+12
  # |       <string is in $a0>       |
  # |--------------------------------| sp+8  <-- start of caller's frame
  # |              sum               |
  # |--------------------------------| sp+4
  # |               i                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  li $t0, 0
  sw $t0, 4($sp)
  li $t0, 0
  sw $t0, 0($sp)
_L0:
  lw $t0, 0($sp)
  move $t1, $a1
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 4($sp)
  lw $t1, 0($sp)
  move $t2, $a0
  addu $t3, $t2, $t1
  lb $t1, ($t3)
  addu $t2, $t0, $t1
  sw $t2, 4($sp)
  lw $t0, 0($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 0($sp)
  j _L0
_L1:
  lw $t0, 4($sp)
  move $v0, $t0
  j __leave_sumchars

__leave_sumchars:
  la $sp, 8($sp)
  jr $ra

main:

  # |--------------------------------|
  # |              $a2               |
  # |--------------------------------| sp+88
  # |              argv              |
  # |--------------------------------| sp+84
  # |              argc              |
  # |--------------------------------| sp+80  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+76
  # |               y                |
  # |--------------------------------| sp+72
  # |               x                |
  # |--------------------------------| sp+32
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |              $ra               |
  # |--------------------------------| sp+24
  # |              $s1               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -80($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)
  sw $ra, 24($sp)
  sw $a0, 80($sp)
  sw $a1, 84($sp)
  sw $a2, 88($sp)

_L2:
  li $t0, 1
  beq $t0, $zero, _L15
_L3:
  li $t0, 0
  li $t1, 0
  seq $t2, $t0, $t1
  beq $t2, $zero, _L14
_L4:
  li $t0, 1
  beq $t0, $zero, _L13
_L5:
  lb $t0, 72($sp)
  sll $t1, $t0, 2
  la $t0, 32($sp)
  addu $t2, $t0, $t1
  lw $s0, ($t2)
  lb $t0, 72($sp)
  li $t1, 111
  addu $t2, $t0, $t1
  move $a0, $t2
  jal _dub
  move $t0, $v0
  seq $t1, $s0, $t0
  beq $t1, $zero, _L12
_L6:
  la $t0, _str0
  li $t1, 222
  move $a1, $t1
  move $a0, $t0
  jal _sumchars
  move $s0, $v0
  lw $t0, 84($sp)
  li $t1, 333
  move $a1, $t1
  move $a0, $t0
  jal _sumchars
  move $t0, $v0
  slt $t1, $s0, $t0
  beq $t1, $zero, _L11
  li $t0, 555
  move $a0, $t0
  jal _dub
  move $s0, $v0
  li $t0, 666
  move $a0, $t0
  jal _dub
  move $t0, $v0
  addu $s1, $s0, $t0
  la $t0, _str1
  li $t1, 777
  move $a1, $t1
  move $a0, $t0
  jal _sumchars
  move $t0, $v0
  move $a0, $t0
  jal _dub
  move $t0, $v0
  move $a0, $t0
  jal _dub
  move $t0, $v0
  addu $t1, $s1, $t0
  li $t0, 444
  sll $t2, $t0, 2
  la $t0, 32($sp)
  addu $t3, $t0, $t2
  sw $t1, ($t3)
_L7:
  li $t0, 888
  sll $t1, $t0, 2
  la $t0, 32($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sll $t1, $t0, 2
  la $t0, 32($sp)
  addu $t2, $t0, $t1
  lw $s0, ($t2)
  lb $t0, 72($sp)
  lb $t1, 72($sp)
  lb $t2, 72($sp)
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _sum
  move $t0, $v0
  move $a0, $t0
  jal _half
  move $t0, $v0
  seq $s1, $s0, $t0
  lb $t0, 72($sp)
  move $a0, $t0
  jal _half
  move $t0, $v0
  lb $t1, 72($sp)
  sll $t2, $t1, 2
  la $t1, 32($sp)
  addu $t3, $t1, $t2
  lw $t1, ($t3)
  slt $t2, $t0, $t1
  and $t0, $s1, $t2
  lb $t1, 72($sp)
  lb $t2, 72($sp)
  li $t3, 999
  sll $t4, $t3, 2
  la $t3, 32($sp)
  addu $t5, $t3, $t4
  lw $t3, ($t5)
  mul $t4, $t2, $t3
  addu $t2, $t1, $t4
  li $t1, 1000
  sne $t3, $t2, $t1
  or $t1, $t0, $t3
  beq $t1, $zero, _L10
_L8:
  li $t0, 0
  sll $t1, $t0, 2
  la $t0, 32($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 1001
  seq $t2, $t0, $t1
  beq $t2, $zero, _L9
  lb $t0, 72($sp)
  li $t1, 1002
  sub $t2, $t0, $t1
  sb $t2, 72($sp)
  j _L8
_L9:
  j _L7
_L10:
  j _L6
_L11:
  j _L5
_L12:
  j _L4
_L13:
  j _L3
_L14:
  j _L2
_L15:

__leavemain:
  lw $a2, 88($sp)
  lw $a1, 84($sp)
  lw $a0, 80($sp)
  lw $ra, 24($sp)
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  la $sp, 80($sp)
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
