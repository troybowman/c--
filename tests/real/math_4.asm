
.data

  _str0:
    .asciiz "rotr: "
    .align 2

  _str1:
    .asciiz ", "
    .align 2

  _str2:
    .asciiz "\n"
    .align 2

  _str3:
    .asciiz "rotl: "
    .align 2

  _str4:
    .asciiz "ch:   "
    .align 2

  _str5:
    .asciiz "maj:  "
    .align 2

  _str6:
    .asciiz "ep0:  "
    .align 2

  _str7:
    .asciiz "ep1:  "
    .align 2

  _str8:
    .asciiz "sig0: "
    .align 2

  _str9:
    .asciiz "sig1: "
    .align 2

  _str10:
    .asciiz "hashstr: "
    .align 2

  _str11:
    .asciiz "strlen: "
    .align 2

  _str12:
    .asciiz ""
    .align 2

.text

_rotl:

  # |--------------------------------|
  # |         <b is in $a1>          |
  # |--------------------------------| sp+4
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  move $t1, $a1
  sllv $t2, $t0, $t1
  move $t0, $a0
  li $t1, 32
  move $t3, $a1
  sub $t4, $t1, $t3
  srlv $t1, $t0, $t4
  or $t0, $t2, $t1
  move $v0, $t0
  j __leave_rotl

__leave_rotl:
  jr $ra

_rotr:

  # |--------------------------------|
  # |         <b is in $a1>          |
  # |--------------------------------| sp+4
  # |         <a is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  move $t1, $a1
  srlv $t2, $t0, $t1
  move $t0, $a0
  li $t1, 32
  move $t3, $a1
  sub $t4, $t1, $t3
  sllv $t1, $t0, $t4
  or $t0, $t2, $t1
  move $v0, $t0
  j __leave_rotr

__leave_rotr:
  jr $ra

_ch:

  # |--------------------------------|
  # |         <z is in $a2>          |
  # |--------------------------------| sp+8
  # |         <y is in $a1>          |
  # |--------------------------------| sp+4
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  move $t1, $a1
  and $t2, $t0, $t1
  move $t0, $a0
  not $t1, $t0
  move $t0, $a2
  and $t3, $t1, $t0
  xor $t0, $t2, $t3
  move $v0, $t0
  j __leave_ch

__leave_ch:
  jr $ra

_maj:

  # |--------------------------------|
  # |         <z is in $a2>          |
  # |--------------------------------| sp+8
  # |         <y is in $a1>          |
  # |--------------------------------| sp+4
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  move $t1, $a1
  and $t2, $t0, $t1
  move $t0, $a0
  move $t1, $a2
  and $t3, $t0, $t1
  xor $t0, $t2, $t3
  move $t1, $a1
  move $t2, $a2
  and $t3, $t1, $t2
  xor $t1, $t0, $t3
  move $v0, $t1
  j __leave_maj

__leave_maj:
  jr $ra

_ep0:

  # |--------------------------------|
  # |              $a1               |
  # |--------------------------------| sp+36
  # |               x                |
  # |--------------------------------| sp+32  <-- start of caller's frame
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
  la $sp, -32($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)
  sw $ra, 24($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)

  lw $t0, 32($sp)
  li $t1, 2
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $s0, $v0
  lw $t0, 32($sp)
  li $t1, 13
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $s1, $s0, $t0
  lw $t0, 32($sp)
  li $t1, 22
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $t1, $s1, $t0
  move $v0, $t1
  j __leave_ep0

__leave_ep0:
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 24($sp)
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  la $sp, 32($sp)
  jr $ra

_ep1:

  # |--------------------------------|
  # |              $a1               |
  # |--------------------------------| sp+36
  # |               x                |
  # |--------------------------------| sp+32  <-- start of caller's frame
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
  la $sp, -32($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)
  sw $ra, 24($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)

  lw $t0, 32($sp)
  li $t1, 6
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $s0, $v0
  lw $t0, 32($sp)
  li $t1, 11
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $s1, $s0, $t0
  lw $t0, 32($sp)
  li $t1, 25
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $t1, $s1, $t0
  move $v0, $t1
  j __leave_ep1

__leave_ep1:
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 24($sp)
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  la $sp, 32($sp)
  jr $ra

_sig0:

  # |--------------------------------|
  # |              $a1               |
  # |--------------------------------| sp+28
  # |               x                |
  # |--------------------------------| sp+24  <-- start of caller's frame
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $s0, 16($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $a1, 28($sp)

  lw $t0, 24($sp)
  li $t1, 7
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $s0, $v0
  lw $t0, 24($sp)
  li $t1, 18
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $t1, $s0, $t0
  lw $t0, 24($sp)
  li $t2, 3
  srlv $t3, $t0, $t2
  xor $t0, $t1, $t3
  move $v0, $t0
  j __leave_sig0

__leave_sig0:
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 20($sp)
  lw $s0, 16($sp)
  la $sp, 24($sp)
  jr $ra

_sig1:

  # |--------------------------------|
  # |              $a1               |
  # |--------------------------------| sp+28
  # |               x                |
  # |--------------------------------| sp+24  <-- start of caller's frame
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $s0, 16($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $a1, 28($sp)

  lw $t0, 24($sp)
  li $t1, 17
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $s0, $v0
  lw $t0, 24($sp)
  li $t1, 19
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  xor $t1, $s0, $t0
  lw $t0, 24($sp)
  li $t2, 10
  srlv $t3, $t0, $t2
  xor $t0, $t1, $t3
  move $v0, $t0
  j __leave_sig1

__leave_sig1:
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 20($sp)
  lw $s0, 16($sp)
  la $sp, 24($sp)
  jr $ra

_memset:

  # |--------------------------------|
  # |       <buflen is in $a2>       |
  # |--------------------------------| sp+16
  # |        <val is in $a1>         |
  # |--------------------------------| sp+12
  # |        <buf is in $a0>         |
  # |--------------------------------| sp+8  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+4
  # |               i                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  li $t0, 0
  sw $t0, 0($sp)
_L0:
  lw $t0, 0($sp)
  move $t1, $a2
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  move $t0, $a1
  lw $t1, 0($sp)
  move $t2, $a0
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 0($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 0($sp)
  j _L0
_L1:

__leave_memset:
  la $sp, 8($sp)
  jr $ra

_strlen:

  # |--------------------------------|
  # |       <string is in $a0>       |
  # |--------------------------------| sp+8  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+4
  # |               i                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  li $t0, 0
  sw $t0, 0($sp)
_L2:
  lw $t0, 0($sp)
  move $t1, $a0
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 0
  sne $t2, $t0, $t1
  beq $t2, $zero, _L3
  lw $t0, 0($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 0($sp)
  j _L2
_L3:
  lw $t0, 0($sp)
  move $v0, $t0
  j __leave_strlen

__leave_strlen:
  la $sp, 8($sp)
  jr $ra

_get_hex_str:

  # |--------------------------------|
  # |        <hash is in $a1>        |
  # |--------------------------------| sp+28
  # |        <out is in $a0>         |
  # |--------------------------------| sp+24  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              map               |
  # |--------------------------------| sp+4
  # |               i                |
  # |--------------------------------| sp+0
  la $sp, -24($sp)

  li $t0, '0'
  li $t1, 0
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '1'
  li $t1, 1
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '2'
  li $t1, 2
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '3'
  li $t1, 3
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '4'
  li $t1, 4
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '5'
  li $t1, 5
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '6'
  li $t1, 6
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '7'
  li $t1, 7
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '8'
  li $t1, 8
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, '9'
  li $t1, 9
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'a'
  li $t1, 10
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'b'
  li $t1, 11
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'c'
  li $t1, 12
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'd'
  li $t1, 13
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'e'
  li $t1, 14
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'f'
  li $t1, 15
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 0
  sw $t0, 0($sp)
_L4:
  lw $t0, 0($sp)
  li $t1, 32
  slt $t2, $t0, $t1
  beq $t2, $zero, _L5
  lw $t0, 0($sp)
  move $t1, $a1
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 240
  and $t2, $t0, $t1
  li $t0, 4
  srlv $t1, $t2, $t0
  la $t0, 4($sp)
  addu $t2, $t0, $t1
  lb $t0, ($t2)
  li $t1, 2
  lw $t2, 0($sp)
  mul $t3, $t1, $t2
  move $t1, $a0
  addu $t2, $t1, $t3
  sb $t0, ($t2)
  lw $t0, 0($sp)
  move $t1, $a1
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 15
  and $t2, $t0, $t1
  la $t0, 4($sp)
  addu $t1, $t0, $t2
  lb $t0, ($t1)
  li $t1, 2
  lw $t2, 0($sp)
  mul $t3, $t1, $t2
  li $t1, 1
  addu $t2, $t3, $t1
  move $t1, $a0
  addu $t3, $t1, $t2
  sb $t0, ($t3)
  lw $t0, 0($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 0($sp)
  j _L4
_L5:
  li $t0, 0
  li $t1, 65
  move $t2, $a0
  addu $t3, $t2, $t1
  sb $t0, ($t3)

__leave_get_hex_str:
  la $sp, 24($sp)
  jr $ra

main:

  # |--------------------------------|
  # |              $a2               |
  # |--------------------------------| sp+152
  # |              $a1               |
  # |--------------------------------| sp+148
  # |              $a0               |
  # |--------------------------------| sp+144  <-- start of caller's frame
  # |             string             |
  # |--------------------------------| sp+76
  # |              hash              |
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
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -144($sp)
  sw $ra, 16($sp)
  sw $a0, 144($sp)
  sw $a1, 148($sp)
  sw $a2, 152($sp)

  li $t0, 0
  sw $t0, 24($sp)
  li $t0, 1
  sw $t0, 28($sp)
  li $t0, -1
  sw $t0, 32($sp)
  li $t0, 305419896
  sw $t0, 36($sp)
  li $t0, -1698898192
  sw $t0, 40($sp)
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 18
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 25
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 18
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 25
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 18
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 25
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 18
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 25
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 18
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 25
  move $a1, $t1
  move $a0, $t0
  jal _rotr
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 9
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  li $t1, 16
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 9
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  li $t1, 16
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 9
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  li $t1, 16
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 9
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  li $t1, 16
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str3
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 0
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 1
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 9
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  li $t1, 16
  move $a1, $t1
  move $a0, $t0
  jal _rotl
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str4
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  lw $t1, 32($sp)
  lw $t2, 40($sp)
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _ch
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str5
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  lw $t1, 32($sp)
  lw $t2, 40($sp)
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _maj
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str6
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal _ep0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  move $a0, $t0
  jal _ep0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  move $a0, $t0
  jal _ep0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  move $a0, $t0
  jal _ep0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  move $a0, $t0
  jal _ep0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str7
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal _ep1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  move $a0, $t0
  jal _ep1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  move $a0, $t0
  jal _ep1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  move $a0, $t0
  jal _ep1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  move $a0, $t0
  jal _ep1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str8
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal _sig0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  move $a0, $t0
  jal _sig0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  move $a0, $t0
  jal _sig0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  move $a0, $t0
  jal _sig0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  move $a0, $t0
  jal _sig0
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str9
  move $a0, $t0
  jal __print_string
  lw $t0, 24($sp)
  move $a0, $t0
  jal _sig1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 28($sp)
  move $a0, $t0
  jal _sig1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 32($sp)
  move $a0, $t0
  jal _sig1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 36($sp)
  move $a0, $t0
  jal _sig1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  lw $t0, 40($sp)
  move $a0, $t0
  jal _sig1
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, 44($sp)
  li $t1, 'a'
  li $t2, 32
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _memset
  la $t0, 76($sp)
  la $t1, 44($sp)
  move $a1, $t1
  move $a0, $t0
  jal _get_hex_str
  la $t0, _str10
  move $a0, $t0
  jal __print_string
  la $t0, 76($sp)
  move $a0, $t0
  jal __print_string
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  li $t0, 66
  li $t1, 0
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 64
  li $t1, 1
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 252
  li $t1, 2
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 152
  li $t1, 3
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 201
  li $t1, 4
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 149
  li $t1, 5
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 46
  li $t1, 6
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 47
  li $t1, 7
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 194
  li $t1, 8
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 224
  li $t1, 9
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 231
  li $t1, 10
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 99
  li $t1, 11
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 195
  li $t1, 12
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 94
  li $t1, 13
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 57
  li $t1, 14
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 145
  li $t1, 15
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 92
  li $t1, 16
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 61
  li $t1, 17
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 196
  li $t1, 18
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 64
  li $t1, 19
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 74
  li $t1, 20
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 225
  li $t1, 21
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 7
  li $t1, 22
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 53
  li $t1, 23
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 237
  li $t1, 24
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 211
  li $t1, 25
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 230
  li $t1, 26
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 23
  li $t1, 27
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 247
  li $t1, 28
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 65
  li $t1, 29
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 18
  li $t1, 30
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 162
  li $t1, 31
  la $t2, 44($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  la $t0, 76($sp)
  la $t1, 44($sp)
  move $a1, $t1
  move $a0, $t0
  jal _get_hex_str
  la $t0, _str10
  move $a0, $t0
  jal __print_string
  la $t0, 76($sp)
  move $a0, $t0
  jal __print_string
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str11
  move $a0, $t0
  jal __print_string
  la $t0, _str12
  move $a0, $t0
  jal _strlen
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, _str11
  move $a0, $t0
  jal __print_string
  la $t0, 76($sp)
  move $a0, $t0
  jal _strlen
  move $t0, $v0
  move $a0, $t0
  jal __print_int
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  li $t0, 0
  move $v0, $t0
  j __leavemain

__leavemain:
  lw $a2, 152($sp)
  lw $a1, 148($sp)
  lw $a0, 144($sp)
  lw $ra, 16($sp)
  la $sp, 144($sp)
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
