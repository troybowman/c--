
.data

  _str0:
    .asciiz "\n"
    .align 2

.text

_id:

  # |--------------------------------|
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  move $v0, $t0
  j __leave_id

__leave_id:
  jr $ra

main:

  # |--------------------------------|
  # |              $a0               |
  # |--------------------------------| sp+72  <-- start of caller's frame
  # |              res               |
  # |--------------------------------| sp+68
  # |               i                |
  # |--------------------------------| sp+64
  # |               x                |
  # |--------------------------------| sp+24
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -72($sp)
  sw $s0, 16($sp)
  sw $ra, 20($sp)
  sw $a0, 72($sp)

  li $t0, 0
  sw $t0, 64($sp)
_L0:
  lw $t0, 64($sp)
  li $t1, 10
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 64($sp)
  lw $t1, 64($sp)
  sll $t2, $t1, 2
  la $t1, 24($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  lw $t0, 64($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 64($sp)
  j _L0
_L1:
  li $t0, 5
  move $a0, $t0
  jal _id
  move $t0, $v0
  sll $t1, $t0, 2
  la $t0, 24($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  move $t0, $v0
  sll $t1, $t0, 2
  la $t0, 24($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  move $t0, $v0
  sll $t1, $t0, 2
  la $t0, 24($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $a0, $t0
  jal _id
  move $t0, $v0
  sll $t1, $t0, 2
  la $t0, 24($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 68($sp)
  lw $t0, 68($sp)
  li $t1, 1
  addu $s0, $t0, $t1
  li $t0, 0
  move $a0, $t0
  jal _id
  move $t0, $v0
  li $t1, 1
  addu $t2, $t0, $t1
  sll $t0, $t2, 2
  la $t1, 24($sp)
  addu $t2, $t1, $t0
  lw $t0, ($t2)
  li $t1, 1
  addu $t2, $t0, $t1
  move $a0, $t2
  jal _id
  move $t0, $v0
  li $t1, 1
  addu $t2, $t0, $t1
  sll $t0, $t2, 2
  la $t1, 24($sp)
  addu $t2, $t1, $t0
  lw $t0, ($t2)
  li $t1, 1
  addu $t2, $t0, $t1
  move $a0, $t2
  jal _id
  move $t0, $v0
  li $t1, 1
  addu $t2, $t0, $t1
  sll $t0, $t2, 2
  la $t1, 24($sp)
  addu $t2, $t1, $t0
  lw $t0, ($t2)
  li $t1, 1
  addu $t2, $t0, $t1
  move $a0, $t2
  jal _id
  move $t0, $v0
  li $t1, 1
  addu $t2, $t0, $t1
  sll $t0, $t2, 2
  la $t1, 24($sp)
  addu $t2, $t1, $t0
  sw $s0, ($t2)
  li $t0, 0
  move $a0, $t0
  jal _id
  move $t0, $v0
  li $t1, 1
  addu $t2, $t0, $t1
  sll $t0, $t2, 2
  la $t1, 24($sp)
  addu $t2, $t1, $t0
  lw $t0, ($t2)
  li $t1, 1
  addu $t2, $t0, $t1
  move $a0, $t2
  jal _id
  move $t0, $v0
  li $t1, 1
  addu $t2, $t0, $t1
  sll $t0, $t2, 2
  la $t1, 24($sp)
  addu $t2, $t1, $t0
  lw $t0, ($t2)
  li $t1, 1
  addu $t2, $t0, $t1
  move $a0, $t2
  jal _id
  move $t0, $v0
  li $t1, 1
  addu $t2, $t0, $t1
  sll $t0, $t2, 2
  la $t1, 24($sp)
  addu $t2, $t1, $t0
  lw $t0, ($t2)
  li $t1, 1
  addu $t2, $t0, $t1
  move $a0, $t2
  jal _id
  move $t0, $v0
  li $t1, 1
  addu $t2, $t0, $t1
  sll $t0, $t2, 2
  la $t1, 24($sp)
  addu $t2, $t1, $t0
  lw $t0, ($t2)
  sw $t0, 68($sp)
  lw $t0, 68($sp)
  move $a0, $t0
  jal __print_int
  la $t0, _str0
  move $a0, $t0
  jal __print_string

__leavemain:
  lw $a0, 72($sp)
  lw $ra, 20($sp)
  lw $s0, 16($sp)
  la $sp, 72($sp)
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
