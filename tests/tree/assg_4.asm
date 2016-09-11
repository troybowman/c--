#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: test
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: i
# child RHS for node 2
# node 4: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 4
# node 5: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 8
# node 9: type: TNT_INTCON val: 0
# child RHS for node 7
# node 10: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 6
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_ASSG
# child LHS for node 12
# node 13: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 13
# node 14: type: TNT_SYMBOL sym: i
# child RHS for node 12
# node 15: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 11
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_ASSG
# child LHS for node 17
# node 18: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 18
# node 19: type: TNT_SYMBOL sym: i
# child RHS for node 17
# node 20: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 20
# node 21: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 16
# node 22: type: TNT_STMT
# child SEQ_CUR for node 22
# node 23: type: TNT_ASSG
# child LHS for node 23
# node 24: type: TNT_SYMBOL sym: c
# child RHS for node 23
# node 25: type: TNT_CHARCON str: 'z'
# child SEQ_NEXT for node 22
# node 26: type: TNT_STMT
# child SEQ_CUR for node 26
# node 27: type: TNT_ASSG
# child LHS for node 27
# node 28: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 28
# node 29: type: TNT_SYMBOL sym: c
# child RHS for node 27
# node 30: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 30
# node 31: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 26
# node 32: type: TNT_STMT
# child SEQ_CUR for node 32
# node 33: type: TNT_ASSG
# child LHS for node 33
# node 34: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 34
# node 35: type: TNT_INTCON val: 0
# child RHS for node 33
# node 36: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 36
# node 37: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 32
# node 38: type: TNT_STMT
# child SEQ_CUR for node 38
# node 39: type: TNT_ASSG
# child LHS for node 39
# node 40: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 40
# node 41: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 41
# node 42: type: TNT_SYMBOL sym: i
# child RHS for node 39
# node 43: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 43
# node 44: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 44
# node 45: type: TNT_SYMBOL sym: i
# child SEQ_NEXT for node 38
# node 46: type: TNT_STMT
# child SEQ_CUR for node 46
# node 47: type: TNT_ASSG
# child LHS for node 47
# node 48: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 48
# node 49: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 49
# node 50: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 50
# node 51: type: TNT_CHARCON str: 'a'
# child RHS for node 47
# node 52: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 52
# node 53: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 53
# node 54: type: TNT_CHARCON str: 'b'

.data

  _i:
    .space 4

  _x:
    .space 40

.text

_test:

  # |--------------------------------|
  # |        <argv is in $a1>        |
  # |--------------------------------| sp+12
  # |        <argc is in $a0>        |
  # |--------------------------------| sp+8  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+4
  # |               c                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  li $t0, 0
  move $t1, $a1
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  sw $t0, _i
  lw $t0, _i
  li $t1, 0
  move $t2, $a1
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 0
  lw $t1, _i
  move $t2, $a1
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, _i
  move $t1, $a1
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  lw $t1, _i
  move $t2, $a1
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'z'
  sb $t0, 0($sp)
  lb $t0, 0($sp)
  sll $t1, $t0, 2
  la $t0, _x
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  lb $t1, 0($sp)
  move $t2, $a1
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  lw $t0, _i
  move $t1, $a1
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 0
  sll $t2, $t1, 2
  la $t1, _x
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  lw $t0, _i
  sll $t1, $t0, 2
  la $t0, _x
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $t1, $a1
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  lw $t1, _i
  move $t2, $a1
  addu $t3, $t2, $t1
  lb $t1, ($t3)
  sll $t2, $t1, 2
  la $t1, _x
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 'b'
  sll $t1, $t0, 2
  la $t0, _x
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $t1, $a1
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 'a'
  sll $t2, $t1, 2
  la $t1, _x
  addu $t3, $t1, $t2
  lw $t1, ($t3)
  move $t2, $a1
  addu $t3, $t2, $t1
  lb $t1, ($t3)
  sll $t2, $t1, 2
  la $t1, _x
  addu $t3, $t1, $t2
  sw $t0, ($t3)

__leave_test:
  la $sp, 8($sp)
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

__print_hex:
  li $v0, 34
  syscall
  jr $ra

__exit:
  li $v0, 10
  syscall
  jr $ra
