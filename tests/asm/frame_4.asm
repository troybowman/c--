
.data

.text

_f0:

  # |--------------------------------|

  li $t0, 0
  move $v0, $t0
  j __leave_f0

__leave_f0:
  jr $ra

_f1:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+4
  # |               x                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  li $t4, 5
  li $t5, 6
  addu $t6, $t4, $t5
  addu $t4, $t3, $t6
  addu $t3, $t2, $t4
  addu $t2, $t1, $t3
  addu $t1, $t0, $t2
  sw $t1, 0($sp)

__leave_f1:
  la $sp, 8($sp)
  jr $ra

_f2:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |               x                |
  # |--------------------------------| sp+16
  # |           <padding>            |
  # |--------------------------------| sp+12
  # |              $s2               |
  # |--------------------------------| sp+8
  # |              $s1               |
  # |--------------------------------| sp+4
  # |              $s0               |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $s0, 0($sp)
  sw $s1, 4($sp)
  sw $s2, 8($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  li $t4, 5
  li $t5, 6
  li $t6, 7
  li $s0, 8
  li $s1, 9
  addu $s2, $s0, $s1
  addu $s0, $t6, $s2
  addu $t6, $t5, $s0
  addu $t5, $t4, $t6
  addu $t4, $t3, $t5
  addu $t3, $t2, $t4
  addu $t2, $t1, $t3
  addu $t1, $t0, $t2
  sw $t1, 16($sp)

__leave_f2:
  lw $s2, 8($sp)
  lw $s1, 4($sp)
  lw $s0, 0($sp)
  la $sp, 24($sp)
  jr $ra

_f3:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+60
  # |               x                |
  # |--------------------------------| sp+56
  # |           <padding>            |
  # |--------------------------------| sp+52
  # |              $ra               |
  # |--------------------------------| sp+48
  # |              $s7               |
  # |--------------------------------| sp+44
  # |              $s6               |
  # |--------------------------------| sp+40
  # |              $s5               |
  # |--------------------------------| sp+36
  # |              $s4               |
  # |--------------------------------| sp+32
  # |              $s3               |
  # |--------------------------------| sp+28
  # |              $s2               |
  # |--------------------------------| sp+24
  # |              $s1               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -64($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)
  sw $s2, 24($sp)
  sw $s3, 28($sp)
  sw $s4, 32($sp)
  sw $s5, 36($sp)
  sw $s6, 40($sp)
  sw $s7, 44($sp)
  sw $ra, 48($sp)

  jal _f0
  move $s0, $v0
  jal _f0
  move $s1, $v0
  jal _f0
  move $s2, $v0
  jal _f0
  move $s3, $v0
  jal _f0
  move $s4, $v0
  jal _f0
  move $s5, $v0
  jal _f0
  move $s6, $v0
  jal _f0
  move $s7, $v0
  jal _f0
  move $t0, $v0
  addu $t1, $s7, $t0
  addu $t0, $s6, $t1
  addu $t1, $s5, $t0
  addu $t0, $s4, $t1
  addu $t1, $s3, $t0
  addu $t0, $s2, $t1
  addu $t1, $s1, $t0
  addu $t0, $s0, $t1
  sw $t0, 56($sp)

__leave_f3:
  lw $ra, 48($sp)
  lw $s7, 44($sp)
  lw $s6, 40($sp)
  lw $s5, 36($sp)
  lw $s4, 32($sp)
  lw $s3, 28($sp)
  lw $s2, 24($sp)
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  la $sp, 64($sp)
  jr $ra

_f4:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+60
  # |               x                |
  # |--------------------------------| sp+56
  # |              $ra               |
  # |--------------------------------| sp+52
  # |          <stktemp 0>           |
  # |--------------------------------| sp+48
  # |              $s7               |
  # |--------------------------------| sp+44
  # |              $s6               |
  # |--------------------------------| sp+40
  # |              $s5               |
  # |--------------------------------| sp+36
  # |              $s4               |
  # |--------------------------------| sp+32
  # |              $s3               |
  # |--------------------------------| sp+28
  # |              $s2               |
  # |--------------------------------| sp+24
  # |              $s1               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -64($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)
  sw $s2, 24($sp)
  sw $s3, 28($sp)
  sw $s4, 32($sp)
  sw $s5, 36($sp)
  sw $s6, 40($sp)
  sw $s7, 44($sp)
  sw $ra, 52($sp)

  jal _f0
  move $s0, $v0
  jal _f0
  move $s1, $v0
  jal _f0
  move $s2, $v0
  jal _f0
  move $s3, $v0
  jal _f0
  move $s4, $v0
  jal _f0
  move $s5, $v0
  jal _f0
  move $s6, $v0
  jal _f0
  move $s7, $v0
  jal _f0
  sw $v0, 48($sp)
  jal _f0
  move $t0, $v0
  lw $t7, 48($sp)
  addu $t1, $t7, $t0
  addu $t0, $s7, $t1
  addu $t1, $s6, $t0
  addu $t0, $s5, $t1
  addu $t1, $s4, $t0
  addu $t0, $s3, $t1
  addu $t1, $s2, $t0
  addu $t0, $s1, $t1
  addu $t1, $s0, $t0
  sw $t1, 56($sp)

__leave_f4:
  lw $ra, 52($sp)
  lw $s7, 44($sp)
  lw $s6, 40($sp)
  lw $s5, 36($sp)
  lw $s4, 32($sp)
  lw $s3, 28($sp)
  lw $s2, 24($sp)
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  la $sp, 64($sp)
  jr $ra

_f5:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+84
  # |               x                |
  # |--------------------------------| sp+80
  # |              $ra               |
  # |--------------------------------| sp+76
  # |          <stktemp 6>           |
  # |--------------------------------| sp+72
  # |          <stktemp 5>           |
  # |--------------------------------| sp+68
  # |          <stktemp 4>           |
  # |--------------------------------| sp+64
  # |          <stktemp 3>           |
  # |--------------------------------| sp+60
  # |          <stktemp 2>           |
  # |--------------------------------| sp+56
  # |          <stktemp 1>           |
  # |--------------------------------| sp+52
  # |          <stktemp 0>           |
  # |--------------------------------| sp+48
  # |              $s7               |
  # |--------------------------------| sp+44
  # |              $s6               |
  # |--------------------------------| sp+40
  # |              $s5               |
  # |--------------------------------| sp+36
  # |              $s4               |
  # |--------------------------------| sp+32
  # |              $s3               |
  # |--------------------------------| sp+28
  # |              $s2               |
  # |--------------------------------| sp+24
  # |              $s1               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -88($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)
  sw $s2, 24($sp)
  sw $s3, 28($sp)
  sw $s4, 32($sp)
  sw $s5, 36($sp)
  sw $s6, 40($sp)
  sw $s7, 44($sp)
  sw $ra, 76($sp)

  jal _f0
  move $s0, $v0
  jal _f0
  move $s1, $v0
  jal _f0
  move $s2, $v0
  jal _f0
  move $s3, $v0
  jal _f0
  move $s4, $v0
  jal _f0
  move $s5, $v0
  jal _f0
  move $s6, $v0
  jal _f0
  move $s7, $v0
  jal _f0
  sw $v0, 48($sp)
  jal _f0
  sw $v0, 52($sp)
  jal _f0
  sw $v0, 56($sp)
  jal _f0
  sw $v0, 60($sp)
  jal _f0
  sw $v0, 64($sp)
  jal _f0
  sw $v0, 68($sp)
  jal _f0
  sw $v0, 72($sp)
  jal _f0
  move $t0, $v0
  lw $t7, 72($sp)
  addu $t1, $t7, $t0
  lw $t7, 68($sp)
  addu $t0, $t7, $t1
  lw $t7, 64($sp)
  addu $t1, $t7, $t0
  lw $t7, 60($sp)
  addu $t0, $t7, $t1
  lw $t7, 56($sp)
  addu $t1, $t7, $t0
  lw $t7, 52($sp)
  addu $t0, $t7, $t1
  lw $t7, 48($sp)
  addu $t1, $t7, $t0
  addu $t0, $s7, $t1
  addu $t1, $s6, $t0
  addu $t0, $s5, $t1
  addu $t1, $s4, $t0
  addu $t0, $s3, $t1
  addu $t1, $s2, $t0
  addu $t0, $s1, $t1
  addu $t1, $s0, $t0
  sw $t1, 80($sp)
  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  li $t4, 5
  li $t5, 6
  li $t6, 7
  li $s0, 8
  li $s1, 9
  li $s2, 10
  li $s3, 11
  li $s4, 12
  li $s5, 13
  li $s6, 14
  li $s7, 15
  addu $t9, $s6, $s7
  sw $t9, 48($sp)
  lw $t8, 48($sp)
  addu $s6, $s5, $t8
  addu $s5, $s4, $s6
  addu $s4, $s3, $s5
  addu $s3, $s2, $s4
  addu $s2, $s1, $s3
  addu $s1, $s0, $s2
  addu $s0, $t6, $s1
  addu $t6, $t5, $s0
  addu $t5, $t4, $t6
  addu $t4, $t3, $t5
  addu $t3, $t2, $t4
  addu $t2, $t1, $t3
  addu $t1, $t0, $t2
  sw $t1, 80($sp)

__leave_f5:
  lw $ra, 76($sp)
  lw $s7, 44($sp)
  lw $s6, 40($sp)
  lw $s5, 36($sp)
  lw $s4, 32($sp)
  lw $s3, 28($sp)
  lw $s2, 24($sp)
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  la $sp, 88($sp)
  jr $ra

main:

  # |--------------------------------|


__leavemain:
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
