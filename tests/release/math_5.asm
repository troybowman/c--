
.data

  _k:
    .space 256

  _str0:
    .asciiz "input string: '"
    .align 2

  _str1:
    .asciiz "'\n"
    .align 2

  _str2:
    .asciiz "sha256 hash:  "
    .align 2

  _str3:
    .asciiz "\n"
    .align 2

  _str4:
    .asciiz ""
    .align 2

  _str5:
    .asciiz "abc"
    .align 2

  _str6:
    .asciiz "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq"
    .align 2

  _str7:
    .asciiz "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    .align 2

  _str8:
    .asciiz "this is a secret message"
    .align 2

  _str9:
    .asciiz "abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu"
    .align 2

.text

_init_k:
  la $sp, -0($sp)

  li $t0, 1116352408
  li $t1, 0
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1899447441
  li $t1, 1
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1245643825
  li $t1, 2
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -373957723
  li $t1, 3
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 961987163
  li $t1, 4
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1508970993
  li $t1, 5
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1841331548
  li $t1, 6
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1424204075
  li $t1, 7
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -670586216
  li $t1, 8
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 310598401
  li $t1, 9
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 607225278
  li $t1, 10
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1426881987
  li $t1, 11
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1925078388
  li $t1, 12
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -2132889090
  li $t1, 13
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1680079193
  li $t1, 14
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1046744716
  li $t1, 15
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -459576895
  li $t1, 16
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -272742522
  li $t1, 17
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 264347078
  li $t1, 18
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 604807628
  li $t1, 19
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 770255983
  li $t1, 20
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1249150122
  li $t1, 21
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1555081692
  li $t1, 22
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1996064986
  li $t1, 23
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1740746414
  li $t1, 24
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1473132947
  li $t1, 25
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1341970488
  li $t1, 26
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1084653625
  li $t1, 27
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -958395405
  li $t1, 28
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -710438585
  li $t1, 29
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 113926993
  li $t1, 30
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 338241895
  li $t1, 31
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 666307205
  li $t1, 32
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 773529912
  li $t1, 33
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1294757372
  li $t1, 34
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1396182291
  li $t1, 35
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1695183700
  li $t1, 36
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1986661051
  li $t1, 37
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -2117940946
  li $t1, 38
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1838011259
  li $t1, 39
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1564481375
  li $t1, 40
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1474664885
  li $t1, 41
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1035236496
  li $t1, 42
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -949202525
  li $t1, 43
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -778901479
  li $t1, 44
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -694614492
  li $t1, 45
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -200395387
  li $t1, 46
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 275423344
  li $t1, 47
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 430227734
  li $t1, 48
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 506948616
  li $t1, 49
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 659060556
  li $t1, 50
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 883997877
  li $t1, 51
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 958139571
  li $t1, 52
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1322822218
  li $t1, 53
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1537002063
  li $t1, 54
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1747873779
  li $t1, 55
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1955562222
  li $t1, 56
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 2024104815
  li $t1, 57
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -2067236844
  li $t1, 58
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1933114872
  li $t1, 59
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1866530822
  li $t1, 60
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1538233109
  li $t1, 61
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1090935817
  li $t1, 62
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -965641998
  li $t1, 63
  sll $t2, $t1, 2
  la $t1, _k
  addu $t3, $t1, $t2
  sw $t0, ($t3)

__leave_init_k:
  la $sp, 0($sp)
  jr $ra

_rotl:
  la $sp, -0($sp)

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
  la $sp, 0($sp)
  jr $ra

_rotr:
  la $sp, -0($sp)

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
  la $sp, 0($sp)
  jr $ra

_ch:
  la $sp, -0($sp)

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
  la $sp, 0($sp)
  jr $ra

_maj:
  la $sp, -0($sp)

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
  la $sp, 0($sp)
  jr $ra

_ep0:
  la $sp, -32($sp)
  sw $ra, 24($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)

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
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 24($sp)
  la $sp, 32($sp)
  jr $ra

_ep1:
  la $sp, -32($sp)
  sw $ra, 24($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)

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
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 24($sp)
  la $sp, 32($sp)
  jr $ra

_sig0:
  la $sp, -24($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $a1, 28($sp)
  sw $s0, 16($sp)

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
  lw $s0, 16($sp)
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 20($sp)
  la $sp, 24($sp)
  jr $ra

_sig1:
  la $sp, -24($sp)
  sw $ra, 20($sp)
  sw $a0, 24($sp)
  sw $a1, 28($sp)
  sw $s0, 16($sp)

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
  lw $s0, 16($sp)
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 20($sp)
  la $sp, 24($sp)
  jr $ra

_memset:
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
  li $t1, 64
  move $t2, $a0
  addu $t3, $t2, $t1
  sb $t0, ($t3)

__leave_get_hex_str:
  la $sp, 24($sp)
  jr $ra

_sha256_transform:
  la $sp, -336($sp)
  sw $ra, 24($sp)
  sw $a0, 336($sp)
  sw $a1, 340($sp)
  sw $a2, 344($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)

  li $t0, 0
  sw $t0, 64($sp)
  li $t0, 0
  sw $t0, 68($sp)
_L6:
  lw $t0, 64($sp)
  li $t1, 16
  slt $t2, $t0, $t1
  beq $t2, $zero, _L7
  lw $t0, 68($sp)
  lw $t1, 340($sp)
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 24
  sllv $t2, $t0, $t1
  lw $t0, 68($sp)
  li $t1, 1
  addu $t3, $t0, $t1
  lw $t0, 340($sp)
  addu $t1, $t0, $t3
  lb $t0, ($t1)
  li $t1, 16
  sllv $t3, $t0, $t1
  or $t0, $t2, $t3
  lw $t1, 68($sp)
  li $t2, 2
  addu $t3, $t1, $t2
  lw $t1, 340($sp)
  addu $t2, $t1, $t3
  lb $t1, ($t2)
  li $t2, 8
  sllv $t3, $t1, $t2
  or $t1, $t0, $t3
  lw $t0, 68($sp)
  li $t2, 3
  addu $t3, $t0, $t2
  lw $t0, 340($sp)
  addu $t2, $t0, $t3
  lb $t0, ($t2)
  li $t2, 255
  and $t3, $t0, $t2
  or $t0, $t1, $t3
  lw $t1, 64($sp)
  sll $t2, $t1, 2
  la $t1, 80($sp)
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  lw $t0, 64($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 64($sp)
  lw $t0, 68($sp)
  li $t1, 4
  addu $t2, $t0, $t1
  sw $t2, 68($sp)
  j _L6
_L7:
_L8:
  lw $t0, 64($sp)
  li $t1, 64
  slt $t2, $t0, $t1
  beq $t2, $zero, _L9
  lw $t0, 64($sp)
  li $t1, 2
  sub $t2, $t0, $t1
  sll $t0, $t2, 2
  la $t1, 80($sp)
  addu $t2, $t1, $t0
  lw $t0, ($t2)
  move $a0, $t0
  jal _sig1
  move $t0, $v0
  lw $t1, 64($sp)
  li $t2, 7
  sub $t3, $t1, $t2
  sll $t1, $t3, 2
  la $t2, 80($sp)
  addu $t3, $t2, $t1
  lw $t1, ($t3)
  addu $s0, $t0, $t1
  lw $t0, 64($sp)
  li $t1, 15
  sub $t2, $t0, $t1
  sll $t0, $t2, 2
  la $t1, 80($sp)
  addu $t2, $t1, $t0
  lw $t0, ($t2)
  move $a0, $t0
  jal _sig0
  move $t0, $v0
  addu $t1, $s0, $t0
  lw $t0, 64($sp)
  li $t2, 16
  sub $t3, $t0, $t2
  sll $t0, $t3, 2
  la $t2, 80($sp)
  addu $t3, $t2, $t0
  lw $t0, ($t3)
  addu $t2, $t1, $t0
  lw $t0, 64($sp)
  sll $t1, $t0, 2
  la $t0, 80($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  lw $t0, 64($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 64($sp)
  j _L8
_L9:
  li $t0, 0
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 32($sp)
  li $t0, 1
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 36($sp)
  li $t0, 2
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 40($sp)
  li $t0, 3
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 44($sp)
  li $t0, 4
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 48($sp)
  li $t0, 5
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 52($sp)
  li $t0, 6
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 56($sp)
  li $t0, 7
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 60($sp)
  li $t0, 0
  sw $t0, 64($sp)
_L10:
  lw $t0, 64($sp)
  li $t1, 64
  slt $t2, $t0, $t1
  beq $t2, $zero, _L11
  lw $s0, 60($sp)
  lw $t0, 48($sp)
  move $a0, $t0
  jal _ep1
  move $t0, $v0
  addu $s1, $s0, $t0
  lw $t0, 48($sp)
  lw $t1, 52($sp)
  lw $t2, 56($sp)
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _ch
  move $t0, $v0
  addu $t1, $s1, $t0
  lw $t0, 64($sp)
  sll $t2, $t0, 2
  la $t0, _k
  addu $t3, $t0, $t2
  lw $t0, ($t3)
  addu $t2, $t1, $t0
  lw $t0, 64($sp)
  sll $t1, $t0, 2
  la $t0, 80($sp)
  addu $t3, $t0, $t1
  lw $t0, ($t3)
  addu $t1, $t2, $t0
  sw $t1, 72($sp)
  lw $t0, 32($sp)
  move $a0, $t0
  jal _ep0
  move $s0, $v0
  lw $t0, 32($sp)
  lw $t1, 36($sp)
  lw $t2, 40($sp)
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _maj
  move $t0, $v0
  addu $t1, $s0, $t0
  sw $t1, 76($sp)
  lw $t0, 56($sp)
  sw $t0, 60($sp)
  lw $t0, 52($sp)
  sw $t0, 56($sp)
  lw $t0, 48($sp)
  sw $t0, 52($sp)
  lw $t0, 44($sp)
  lw $t1, 72($sp)
  addu $t2, $t0, $t1
  sw $t2, 48($sp)
  lw $t0, 40($sp)
  sw $t0, 44($sp)
  lw $t0, 36($sp)
  sw $t0, 40($sp)
  lw $t0, 32($sp)
  sw $t0, 36($sp)
  lw $t0, 72($sp)
  lw $t1, 76($sp)
  addu $t2, $t0, $t1
  sw $t2, 32($sp)
  lw $t0, 64($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 64($sp)
  j _L10
_L11:
  li $t0, 0
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 32($sp)
  addu $t2, $t0, $t1
  li $t0, 0
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 1
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 36($sp)
  addu $t2, $t0, $t1
  li $t0, 1
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 2
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 40($sp)
  addu $t2, $t0, $t1
  li $t0, 2
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 3
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 44($sp)
  addu $t2, $t0, $t1
  li $t0, 3
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 4
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 48($sp)
  addu $t2, $t0, $t1
  li $t0, 4
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 5
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 52($sp)
  addu $t2, $t0, $t1
  li $t0, 5
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 6
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 56($sp)
  addu $t2, $t0, $t1
  li $t0, 6
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 7
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lw $t1, 60($sp)
  addu $t2, $t0, $t1
  li $t0, 7
  sll $t1, $t0, 2
  lw $t0, 336($sp)
  addu $t3, $t0, $t1
  sw $t2, ($t3)

__leave_sha256_transform:
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  lw $a2, 344($sp)
  lw $a1, 340($sp)
  lw $a0, 336($sp)
  lw $ra, 24($sp)
  la $sp, 336($sp)
  jr $ra

_sha256_init:
  la $sp, -0($sp)

  li $t0, 0
  li $t1, 0
  sll $t2, $t1, 2
  move $t1, $a1
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 0
  li $t1, 1
  sll $t2, $t1, 2
  move $t1, $a1
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 0
  li $t1, 2
  sll $t2, $t1, 2
  move $t1, $a1
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1779033703
  li $t1, 0
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1150833019
  li $t1, 1
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1013904242
  li $t1, 2
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1521486534
  li $t1, 3
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1359893119
  li $t1, 4
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, -1694144372
  li $t1, 5
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 528734635
  li $t1, 6
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 1541459225
  li $t1, 7
  sll $t2, $t1, 2
  move $t1, $a0
  addu $t3, $t1, $t2
  sw $t0, ($t3)

__leave_sha256_init:
  la $sp, 0($sp)
  jr $ra

_sha256_update:
  la $sp, -32($sp)
  sw $ra, 16($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)

  li $t0, 0
  sw $t0, 24($sp)
_L12:
  lw $t0, 24($sp)
  lw $t1, 48($sp)
  slt $t2, $t0, $t1
  beq $t2, $zero, _L15
  lw $t0, 24($sp)
  move $t1, $a3
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 0
  sll $t2, $t1, 2
  move $t1, $a2
  addu $t3, $t1, $t2
  lw $t1, ($t3)
  lw $t2, 36($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 0
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 1
  addu $t2, $t0, $t1
  li $t0, 0
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 0
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 64
  seq $t2, $t0, $t1
  beq $t2, $zero, _L14
  li $t0, 1
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 1
  addu $t2, $t0, $t1
  li $t0, 1
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t3, $t0, $t1
  sw $t2, ($t3)
  li $t0, 1
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 0
  seq $t2, $t0, $t1
  beq $t2, $zero, _L13
  li $t0, 2
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 1
  addu $t2, $t0, $t1
  li $t0, 2
  sll $t1, $t0, 2
  move $t0, $a2
  addu $t3, $t0, $t1
  sw $t2, ($t3)
_L13:
  lw $t0, 32($sp)
  lw $t1, 36($sp)
  move $a1, $t1
  move $a0, $t0
  jal _sha256_transform
  li $t0, 0
  li $t1, 0
  sll $t2, $t1, 2
  move $t1, $a2
  addu $t3, $t1, $t2
  sw $t0, ($t3)
_L14:
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L12
_L15:

__leave_sha256_update:
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 16($sp)
  la $sp, 32($sp)
  jr $ra

_sha256_final:
  la $sp, -40($sp)
  sw $ra, 16($sp)
  sw $a0, 40($sp)
  sw $a1, 44($sp)
  sw $a2, 48($sp)

  li $t0, 0
  sll $t1, $t0, 2
  move $t0, $a3
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  sw $t0, 24($sp)
  li $t0, 0
  sll $t1, $t0, 2
  move $t0, $a3
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 56
  slt $t2, $t0, $t1
  beq $t2, $zero, _L18
  li $t0, 128
  lw $t1, 24($sp)
  lw $t2, 48($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
_L16:
  lw $t0, 24($sp)
  li $t1, 56
  slt $t2, $t0, $t1
  beq $t2, $zero, _L17
  li $t0, 0
  lw $t1, 24($sp)
  lw $t2, 48($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L16
_L17:
  j _L21
_L18:
  li $t0, 128
  lw $t1, 24($sp)
  lw $t2, 48($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
_L19:
  lw $t0, 24($sp)
  li $t1, 64
  slt $t2, $t0, $t1
  beq $t2, $zero, _L20
  li $t0, 0
  lw $t1, 24($sp)
  lw $t2, 48($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L19
_L20:
  lw $t0, 44($sp)
  lw $t1, 48($sp)
  move $a1, $t1
  move $a0, $t0
  jal _sha256_transform
  lw $t0, 48($sp)
  li $t1, 0
  li $t2, 56
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _memset
_L21:
  li $t0, 2
  sll $t1, $t0, 2
  move $t0, $a3
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 9
  sllv $t2, $t0, $t1
  li $t0, 1
  sll $t1, $t0, 2
  move $t0, $a3
  addu $t3, $t0, $t1
  lw $t0, ($t3)
  li $t1, 23
  srlv $t3, $t0, $t1
  or $t0, $t2, $t3
  sw $t0, 28($sp)
  li $t0, 1
  sll $t1, $t0, 2
  move $t0, $a3
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 9
  sllv $t2, $t0, $t1
  li $t0, 0
  sll $t1, $t0, 2
  move $t0, $a3
  addu $t3, $t0, $t1
  lw $t0, ($t3)
  li $t1, 3
  sllv $t3, $t0, $t1
  or $t0, $t2, $t3
  sw $t0, 32($sp)
  lw $t0, 32($sp)
  li $t1, 63
  lw $t2, 48($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 32($sp)
  li $t1, 8
  srlv $t2, $t0, $t1
  li $t0, 62
  lw $t1, 48($sp)
  addu $t3, $t1, $t0
  sb $t2, ($t3)
  lw $t0, 32($sp)
  li $t1, 16
  srlv $t2, $t0, $t1
  li $t0, 61
  lw $t1, 48($sp)
  addu $t3, $t1, $t0
  sb $t2, ($t3)
  lw $t0, 32($sp)
  li $t1, 24
  srlv $t2, $t0, $t1
  li $t0, 60
  lw $t1, 48($sp)
  addu $t3, $t1, $t0
  sb $t2, ($t3)
  lw $t0, 28($sp)
  li $t1, 59
  lw $t2, 48($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, 28($sp)
  li $t1, 8
  srlv $t2, $t0, $t1
  li $t0, 58
  lw $t1, 48($sp)
  addu $t3, $t1, $t0
  sb $t2, ($t3)
  lw $t0, 28($sp)
  li $t1, 16
  srlv $t2, $t0, $t1
  li $t0, 57
  lw $t1, 48($sp)
  addu $t3, $t1, $t0
  sb $t2, ($t3)
  lw $t0, 28($sp)
  li $t1, 24
  srlv $t2, $t0, $t1
  li $t0, 56
  lw $t1, 48($sp)
  addu $t3, $t1, $t0
  sb $t2, ($t3)
  lw $t0, 44($sp)
  lw $t1, 48($sp)
  move $a1, $t1
  move $a0, $t0
  jal _sha256_transform
  li $t0, 0
  sw $t0, 24($sp)
_L22:
  lw $t0, 24($sp)
  li $t1, 4
  slt $t2, $t0, $t1
  beq $t2, $zero, _L23
  li $t0, 0
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  lw $t1, 40($sp)
  addu $t3, $t1, $t0
  sb $t2, ($t3)
  li $t0, 1
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  li $t1, 4
  addu $t3, $t0, $t1
  lw $t0, 40($sp)
  addu $t1, $t0, $t3
  sb $t2, ($t1)
  li $t0, 2
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  li $t1, 8
  addu $t3, $t0, $t1
  lw $t0, 40($sp)
  addu $t1, $t0, $t3
  sb $t2, ($t1)
  li $t0, 3
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  li $t1, 12
  addu $t3, $t0, $t1
  lw $t0, 40($sp)
  addu $t1, $t0, $t3
  sb $t2, ($t1)
  li $t0, 4
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  li $t1, 16
  addu $t3, $t0, $t1
  lw $t0, 40($sp)
  addu $t1, $t0, $t3
  sb $t2, ($t1)
  li $t0, 5
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  li $t1, 20
  addu $t3, $t0, $t1
  lw $t0, 40($sp)
  addu $t1, $t0, $t3
  sb $t2, ($t1)
  li $t0, 6
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  li $t1, 24
  addu $t3, $t0, $t1
  lw $t0, 40($sp)
  addu $t1, $t0, $t3
  sb $t2, ($t1)
  li $t0, 7
  sll $t1, $t0, 2
  lw $t0, 44($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 24
  lw $t2, 24($sp)
  li $t3, 8
  mul $t4, $t2, $t3
  sub $t2, $t1, $t4
  srlv $t1, $t0, $t2
  li $t0, 255
  and $t2, $t1, $t0
  lw $t0, 24($sp)
  li $t1, 28
  addu $t3, $t0, $t1
  lw $t0, 40($sp)
  addu $t1, $t0, $t3
  sb $t2, ($t1)
  lw $t0, 24($sp)
  li $t1, 1
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  j _L22
_L23:

__leave_sha256_final:
  lw $a2, 48($sp)
  lw $a1, 44($sp)
  lw $a0, 40($sp)
  lw $ra, 16($sp)
  la $sp, 40($sp)
  jr $ra

_sha256_from_str:
  la $sp, -248($sp)
  sw $ra, 36($sp)
  sw $a0, 248($sp)
  sw $a1, 252($sp)
  sw $a2, 256($sp)
  sw $a3, 260($sp)
  sw $s0, 20($sp)
  sw $s1, 24($sp)
  sw $s2, 28($sp)
  sw $s3, 32($sp)

  la $t0, 40($sp)
  la $t1, 72($sp)
  move $a1, $t1
  move $a0, $t0
  jal _sha256_init
  la $s0, 40($sp)
  la $s1, 84($sp)
  la $s2, 72($sp)
  lw $s3, 248($sp)
  lw $t0, 248($sp)
  move $a0, $t0
  jal _strlen
  move $t0, $v0
  sw $t0, 16($sp)
  move $a3, $s3
  move $a2, $s2
  move $a1, $s1
  move $a0, $s0
  jal _sha256_update
  la $t0, 216($sp)
  la $t1, 40($sp)
  la $t2, 84($sp)
  la $t3, 72($sp)
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal _sha256_final
  la $t0, 148($sp)
  la $t1, 216($sp)
  move $a1, $t1
  move $a0, $t0
  jal _get_hex_str
  la $t0, _str0
  move $a0, $t0
  jal __print_string
  lw $t0, 248($sp)
  move $a0, $t0
  jal __print_string
  la $t0, _str1
  move $a0, $t0
  jal __print_string
  la $t0, _str2
  move $a0, $t0
  jal __print_string
  la $t0, 148($sp)
  move $a0, $t0
  jal __print_string
  la $t0, _str3
  move $a0, $t0
  jal __print_string

__leave_sha256_from_str:
  lw $s3, 32($sp)
  lw $s2, 28($sp)
  lw $s1, 24($sp)
  lw $s0, 20($sp)
  lw $a3, 260($sp)
  lw $a2, 256($sp)
  lw $a1, 252($sp)
  lw $a0, 248($sp)
  lw $ra, 36($sp)
  la $sp, 248($sp)
  jr $ra

_phase_simple_strings:
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)

  la $t0, _str4
  move $a0, $t0
  jal _sha256_from_str
  la $t0, _str5
  move $a0, $t0
  jal _sha256_from_str
  la $t0, _str6
  move $a0, $t0
  jal _sha256_from_str
  la $t0, _str7
  move $a0, $t0
  jal _sha256_from_str
  la $t0, _str8
  move $a0, $t0
  jal _sha256_from_str
  la $t0, _str9
  move $a0, $t0
  jal _sha256_from_str

__leave_phase_simple_strings:
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
  jr $ra

main:
  la $sp, -24($sp)
  sw $ra, 16($sp)

  jal _init_k
  jal _phase_simple_strings

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
