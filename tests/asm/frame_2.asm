
.data

.text

_one:

  # |--------------------------------|
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_one:
  jr $ra

_two:

  # |--------------------------------|
  # |         <b is in $a1>          |
  # |--------------------------------| sp+4
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_two:
  jr $ra

_three:

  # |--------------------------------|
  # |         <c is in $a2>          |
  # |--------------------------------| sp+8
  # |         <b is in $a1>          |
  # |--------------------------------| sp+4
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_three:
  jr $ra

_four:

  # |--------------------------------|
  # |         <d is in $a3>          |
  # |--------------------------------| sp+12
  # |         <c is in $a2>          |
  # |--------------------------------| sp+8
  # |         <b is in $a1>          |
  # |--------------------------------| sp+4
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_four:
  jr $ra

_five:

  # |--------------------------------|
  # |               e                |
  # |--------------------------------| sp+16
  # |         <d is in $a3>          |
  # |--------------------------------| sp+12
  # |         <c is in $a2>          |
  # |--------------------------------| sp+8
  # |         <b is in $a1>          |
  # |--------------------------------| sp+4
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_five:
  jr $ra

_six:

  # |--------------------------------|
  # |               f                |
  # |--------------------------------| sp+20
  # |               e                |
  # |--------------------------------| sp+16
  # |         <d is in $a3>          |
  # |--------------------------------| sp+12
  # |         <c is in $a2>          |
  # |--------------------------------| sp+8
  # |         <b is in $a1>          |
  # |--------------------------------| sp+4
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_six:
  jr $ra

_seven:

  # |--------------------------------|
  # |               g                |
  # |--------------------------------| sp+24
  # |               f                |
  # |--------------------------------| sp+20
  # |               e                |
  # |--------------------------------| sp+16
  # |         <d is in $a3>          |
  # |--------------------------------| sp+12
  # |         <c is in $a2>          |
  # |--------------------------------| sp+8
  # |         <b is in $a1>          |
  # |--------------------------------| sp+4
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_seven:
  jr $ra

_eight:

  # |--------------------------------|
  # |               h                |
  # |--------------------------------| sp+28
  # |               g                |
  # |--------------------------------| sp+24
  # |               f                |
  # |--------------------------------| sp+20
  # |               e                |
  # |--------------------------------| sp+16
  # |         <d is in $a3>          |
  # |--------------------------------| sp+12
  # |         <c is in $a2>          |
  # |--------------------------------| sp+8
  # |         <b is in $a1>          |
  # |--------------------------------| sp+4
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame


__leave_eight:
  jr $ra

_f1a:

  # |--------------------------------|
  # |               h                |
  # |--------------------------------| sp+52
  # |               g                |
  # |--------------------------------| sp+48
  # |               f                |
  # |--------------------------------| sp+44
  # |               e                |
  # |--------------------------------| sp+40
  # |         <d is in $a3>          |
  # |--------------------------------| sp+36
  # |         <c is in $a2>          |
  # |--------------------------------| sp+32
  # |         <b is in $a1>          |
  # |--------------------------------| sp+28
  # |               a                |
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
  move $a0, $t0
  jal _one

__leave_f1a:
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

_f1b:

  # |--------------------------------|
  # |               h                |
  # |--------------------------------| sp+52
  # |               g                |
  # |--------------------------------| sp+48
  # |               f                |
  # |--------------------------------| sp+44
  # |               e                |
  # |--------------------------------| sp+40
  # |         <d is in $a3>          |
  # |--------------------------------| sp+36
  # |         <c is in $a2>          |
  # |--------------------------------| sp+32
  # |               b                |
  # |--------------------------------| sp+28
  # |               a                |
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
  sw $a1, 28($sp)

  li $t0, 1
  li $t1, 2
  move $a1, $t1
  move $a0, $t0
  jal _two

__leave_f1b:
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

_f1c:

  # |--------------------------------|
  # |               h                |
  # |--------------------------------| sp+52
  # |               g                |
  # |--------------------------------| sp+48
  # |               f                |
  # |--------------------------------| sp+44
  # |               e                |
  # |--------------------------------| sp+40
  # |         <d is in $a3>          |
  # |--------------------------------| sp+36
  # |               c                |
  # |--------------------------------| sp+32
  # |               b                |
  # |--------------------------------| sp+28
  # |               a                |
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
  sw $a1, 28($sp)
  sw $a2, 32($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _three

__leave_f1c:
  lw $a2, 32($sp)
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

_f1d:

  # |--------------------------------|
  # |               h                |
  # |--------------------------------| sp+52
  # |               g                |
  # |--------------------------------| sp+48
  # |               f                |
  # |--------------------------------| sp+44
  # |               e                |
  # |--------------------------------| sp+40
  # |               d                |
  # |--------------------------------| sp+36
  # |               c                |
  # |--------------------------------| sp+32
  # |               b                |
  # |--------------------------------| sp+28
  # |               a                |
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
  sw $a1, 28($sp)
  sw $a2, 32($sp)
  sw $a3, 36($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _four

__leave_f1d:
  lw $a3, 36($sp)
  lw $a2, 32($sp)
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

_f1e:

  # |--------------------------------|
  # |               h                |
  # |--------------------------------| sp+52
  # |               g                |
  # |--------------------------------| sp+48
  # |               f                |
  # |--------------------------------| sp+44
  # |               e                |
  # |--------------------------------| sp+40
  # |               d                |
  # |--------------------------------| sp+36
  # |               c                |
  # |--------------------------------| sp+32
  # |               b                |
  # |--------------------------------| sp+28
  # |               a                |
  # |--------------------------------| sp+24  <-- start of caller's frame
  # |              $ra               |
  # |--------------------------------| sp+20
  # |           <stkarg 0>           |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $a1, 28($sp)
  sw $a2, 32($sp)
  sw $a3, 36($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  li $t4, 5
  sw $t4, 16($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _five

__leave_f1e:
  lw $a3, 36($sp)
  lw $a2, 32($sp)
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 20($sp)
  la $sp, 24($sp)
  jr $ra

_f1f:

  # |--------------------------------|
  # |               h                |
  # |--------------------------------| sp+60
  # |               g                |
  # |--------------------------------| sp+56
  # |               f                |
  # |--------------------------------| sp+52
  # |               e                |
  # |--------------------------------| sp+48
  # |               d                |
  # |--------------------------------| sp+44
  # |               c                |
  # |--------------------------------| sp+40
  # |               b                |
  # |--------------------------------| sp+36
  # |               a                |
  # |--------------------------------| sp+32  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |              $ra               |
  # |--------------------------------| sp+24
  # |           <stkarg 1>           |
  # |--------------------------------| sp+20
  # |           <stkarg 0>           |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 24($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)
  sw $a2, 40($sp)
  sw $a3, 44($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  li $t4, 5
  li $t5, 6
  sw $t5, 20($sp)
  sw $t4, 16($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _six

__leave_f1f:
  lw $a3, 44($sp)
  lw $a2, 40($sp)
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 24($sp)
  la $sp, 32($sp)
  jr $ra

_f1g:

  # |--------------------------------|
  # |               h                |
  # |--------------------------------| sp+60
  # |               g                |
  # |--------------------------------| sp+56
  # |               f                |
  # |--------------------------------| sp+52
  # |               e                |
  # |--------------------------------| sp+48
  # |               d                |
  # |--------------------------------| sp+44
  # |               c                |
  # |--------------------------------| sp+40
  # |               b                |
  # |--------------------------------| sp+36
  # |               a                |
  # |--------------------------------| sp+32  <-- start of caller's frame
  # |              $ra               |
  # |--------------------------------| sp+28
  # |           <stkarg 2>           |
  # |--------------------------------| sp+24
  # |           <stkarg 1>           |
  # |--------------------------------| sp+20
  # |           <stkarg 0>           |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 28($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)
  sw $a2, 40($sp)
  sw $a3, 44($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  li $t4, 5
  li $t5, 6
  li $t6, 7
  sw $t6, 24($sp)
  sw $t5, 20($sp)
  sw $t4, 16($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _seven

__leave_f1g:
  lw $a3, 44($sp)
  lw $a2, 40($sp)
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 28($sp)
  la $sp, 32($sp)
  jr $ra

_f1h:

  # |--------------------------------|
  # |               h                |
  # |--------------------------------| sp+68
  # |               g                |
  # |--------------------------------| sp+64
  # |               f                |
  # |--------------------------------| sp+60
  # |               e                |
  # |--------------------------------| sp+56
  # |               d                |
  # |--------------------------------| sp+52
  # |               c                |
  # |--------------------------------| sp+48
  # |               b                |
  # |--------------------------------| sp+44
  # |               a                |
  # |--------------------------------| sp+40  <-- start of caller's frame
  # |              $ra               |
  # |--------------------------------| sp+36
  # |              $s0               |
  # |--------------------------------| sp+32
  # |           <stkarg 3>           |
  # |--------------------------------| sp+28
  # |           <stkarg 2>           |
  # |--------------------------------| sp+24
  # |           <stkarg 1>           |
  # |--------------------------------| sp+20
  # |           <stkarg 0>           |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -40($sp)
  sw $s0, 32($sp)
  sw $ra, 36($sp)
  sw $a0, 40($sp)
  sw $a1, 44($sp)
  sw $a2, 48($sp)
  sw $a3, 52($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  li $t4, 5
  li $t5, 6
  li $t6, 7
  li $s0, 8
  sw $s0, 28($sp)
  sw $t6, 24($sp)
  sw $t5, 20($sp)
  sw $t4, 16($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _eight

__leave_f1h:
  lw $a3, 52($sp)
  lw $a2, 48($sp)
  lw $a1, 44($sp)
  lw $a0, 40($sp)
  lw $ra, 36($sp)
  lw $s0, 32($sp)
  la $sp, 40($sp)
  jr $ra

_f2a:

  # |--------------------------------|
  # |         <d is in $a3>          |
  # |--------------------------------| sp+36
  # |         <c is in $a2>          |
  # |--------------------------------| sp+32
  # |         <b is in $a1>          |
  # |--------------------------------| sp+28
  # |               a                |
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
  move $a0, $t0
  jal _one

__leave_f2a:
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

_f2b:

  # |--------------------------------|
  # |         <c is in $a2>          |
  # |--------------------------------| sp+32
  # |               b                |
  # |--------------------------------| sp+28
  # |               a                |
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
  sw $a1, 28($sp)

  li $t0, 1
  li $t1, 2
  move $a1, $t1
  move $a0, $t0
  jal _two

__leave_f2b:
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

_f2c:

  # |--------------------------------|
  # |              $a2               |
  # |--------------------------------| sp+32
  # |               b                |
  # |--------------------------------| sp+28
  # |               a                |
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
  sw $a1, 28($sp)
  sw $a2, 32($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _three

__leave_f2c:
  lw $a2, 32($sp)
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

_f2d:

  # |--------------------------------|
  # |              $a3               |
  # |--------------------------------| sp+36
  # |              $a2               |
  # |--------------------------------| sp+32
  # |              $a1               |
  # |--------------------------------| sp+28
  # |               a                |
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
  sw $a1, 28($sp)
  sw $a2, 32($sp)
  sw $a3, 36($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _four

__leave_f2d:
  lw $a3, 36($sp)
  lw $a2, 32($sp)
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

_f2e:

  # |--------------------------------|
  # |              $a3               |
  # |--------------------------------| sp+36
  # |              $a2               |
  # |--------------------------------| sp+32
  # |               b                |
  # |--------------------------------| sp+28
  # |               a                |
  # |--------------------------------| sp+24  <-- start of caller's frame
  # |              $ra               |
  # |--------------------------------| sp+20
  # |           <stkarg 0>           |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $a1, 28($sp)
  sw $a2, 32($sp)
  sw $a3, 36($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  li $t4, 5
  sw $t4, 16($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _five

__leave_f2e:
  lw $a3, 36($sp)
  lw $a2, 32($sp)
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 20($sp)
  la $sp, 24($sp)
  jr $ra

_f2f:

  # |--------------------------------|
  # |              $a3               |
  # |--------------------------------| sp+44
  # |               c                |
  # |--------------------------------| sp+40
  # |               b                |
  # |--------------------------------| sp+36
  # |               a                |
  # |--------------------------------| sp+32  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+28
  # |              $ra               |
  # |--------------------------------| sp+24
  # |           <stkarg 1>           |
  # |--------------------------------| sp+20
  # |           <stkarg 0>           |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 24($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)
  sw $a2, 40($sp)
  sw $a3, 44($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  li $t4, 5
  li $t5, 6
  sw $t5, 20($sp)
  sw $t4, 16($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _six

__leave_f2f:
  lw $a3, 44($sp)
  lw $a2, 40($sp)
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 24($sp)
  la $sp, 32($sp)
  jr $ra

_f2g:

  # |--------------------------------|
  # |               d                |
  # |--------------------------------| sp+44
  # |               c                |
  # |--------------------------------| sp+40
  # |               b                |
  # |--------------------------------| sp+36
  # |               a                |
  # |--------------------------------| sp+32  <-- start of caller's frame
  # |              $ra               |
  # |--------------------------------| sp+28
  # |           <stkarg 2>           |
  # |--------------------------------| sp+24
  # |           <stkarg 1>           |
  # |--------------------------------| sp+20
  # |           <stkarg 0>           |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 28($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)
  sw $a2, 40($sp)
  sw $a3, 44($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  li $t4, 5
  li $t5, 6
  li $t6, 7
  sw $t6, 24($sp)
  sw $t5, 20($sp)
  sw $t4, 16($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _seven

__leave_f2g:
  lw $a3, 44($sp)
  lw $a2, 40($sp)
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 28($sp)
  la $sp, 32($sp)
  jr $ra

_f2h:

  # |--------------------------------|
  # |               e                |
  # |--------------------------------| sp+56
  # |               d                |
  # |--------------------------------| sp+52
  # |               c                |
  # |--------------------------------| sp+48
  # |               b                |
  # |--------------------------------| sp+44
  # |               a                |
  # |--------------------------------| sp+40  <-- start of caller's frame
  # |              $ra               |
  # |--------------------------------| sp+36
  # |              $s0               |
  # |--------------------------------| sp+32
  # |           <stkarg 3>           |
  # |--------------------------------| sp+28
  # |           <stkarg 2>           |
  # |--------------------------------| sp+24
  # |           <stkarg 1>           |
  # |--------------------------------| sp+20
  # |           <stkarg 0>           |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -40($sp)
  sw $s0, 32($sp)
  sw $ra, 36($sp)
  sw $a0, 40($sp)
  sw $a1, 44($sp)
  sw $a2, 48($sp)
  sw $a3, 52($sp)

  li $t0, 1
  li $t1, 2
  li $t2, 3
  li $t3, 4
  li $t4, 5
  li $t5, 6
  li $t6, 7
  li $s0, 8
  sw $s0, 28($sp)
  sw $t6, 24($sp)
  sw $t5, 20($sp)
  sw $t4, 16($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _eight

__leave_f2h:
  lw $a3, 52($sp)
  lw $a2, 48($sp)
  lw $a1, 44($sp)
  lw $a0, 40($sp)
  lw $ra, 36($sp)
  lw $s0, 32($sp)
  la $sp, 40($sp)
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
