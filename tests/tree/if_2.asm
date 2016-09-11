#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: boring
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_SYMBOL sym: x
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_IF
# child IF_COND for node 2
# node 3: type: TNT_AND
# child LHS for node 3
# node 4: type: TNT_LT
# child LHS for node 4
# node 5: type: TNT_INTCON val: 3
# child RHS for node 4
# node 6: type: TNT_INTCON val: 4
# child RHS for node 3
# node 7: type: TNT_LT
# child LHS for node 7
# node 8: type: TNT_INTCON val: 5
# child RHS for node 7
# node 9: type: TNT_INTCON val: 6
# child SEQ_NEXT for node 1
# node 10: type: TNT_STMT
# child SEQ_CUR for node 10
# node 11: type: TNT_IF
# child IF_COND for node 11
# node 12: type: TNT_NOT
# child RHS for node 12
# node 13: type: TNT_LT
# child LHS for node 13
# node 14: type: TNT_INTCON val: 3
# child RHS for node 13
# node 15: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 10
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_IF
# child IF_COND for node 17
# node 18: type: TNT_AND
# child LHS for node 18
# node 19: type: TNT_GT
# child LHS for node 19
# node 20: type: TNT_SYMBOL sym: x
# child RHS for node 19
# node 21: type: TNT_INTCON val: 0
# child RHS for node 18
# node 22: type: TNT_NEQ
# child LHS for node 22
# node 23: type: TNT_SYMBOL sym: x
# child RHS for node 22
# node 24: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 24
# node 25: type: TNT_SYMBOL sym: x
# child IF_ELSE for node 17
# node 26: type: TNT_IF
# child IF_COND for node 26
# node 27: type: TNT_OR
# child LHS for node 27
# node 28: type: TNT_EQ
# child LHS for node 28
# node 29: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 29
# node 30: type: TNT_INTCON val: 0
# child RHS for node 28
# node 31: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 31
# node 32: type: TNT_INTCON val: 1
# child RHS for node 27
# node 33: type: TNT_AND
# child LHS for node 33
# node 34: type: TNT_EQ
# child LHS for node 34
# node 35: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 35
# node 36: type: TNT_INTCON val: 1
# child RHS for node 34
# node 37: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 37
# node 38: type: TNT_INTCON val: 2
# child RHS for node 33
# node 39: type: TNT_NEQ
# child LHS for node 39
# node 40: type: TNT_ARRAY_LOOKUP sym: s
# child AL_OFFSET for node 40
# node 41: type: TNT_INTCON val: 2
# child RHS for node 39
# node 42: type: TNT_SYMBOL sym: x
# child IF_ELSE for node 26
# node 43: type: TNT_IF
# child IF_COND for node 43
# node 44: type: TNT_NOT
# child RHS for node 44
# node 45: type: TNT_AND
# child LHS for node 45
# node 46: type: TNT_AND
# child LHS for node 46
# node 47: type: TNT_LT
# child LHS for node 47
# node 48: type: TNT_CALL sym: boring
# child CALL_ARGS for node 48
# node 49: type: TNT_ARG
# child SEQ_CUR for node 49
# node 50: type: TNT_INTCON val: 0
# child RHS for node 47
# node 51: type: TNT_CALL sym: boring
# child CALL_ARGS for node 51
# node 52: type: TNT_ARG
# child SEQ_CUR for node 52
# node 53: type: TNT_INTCON val: 1
# child RHS for node 46
# node 54: type: TNT_LT
# child LHS for node 54
# node 55: type: TNT_CALL sym: boring
# child CALL_ARGS for node 55
# node 56: type: TNT_ARG
# child SEQ_CUR for node 56
# node 57: type: TNT_INTCON val: 2
# child RHS for node 54
# node 58: type: TNT_CALL sym: boring
# child CALL_ARGS for node 58
# node 59: type: TNT_ARG
# child SEQ_CUR for node 59
# node 60: type: TNT_INTCON val: 3
# child RHS for node 45
# node 61: type: TNT_EQ
# child LHS for node 61
# node 62: type: TNT_SYMBOL sym: x
# child RHS for node 61
# node 63: type: TNT_CALL sym: boring
# child CALL_ARGS for node 63
# node 64: type: TNT_ARG
# child SEQ_CUR for node 64
# node 65: type: TNT_INTCON val: 4

.data

.text

_boring:

  # |--------------------------------|
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  move $v0, $t0
  j __leave_boring

__leave_boring:
  jr $ra

main:

  # |--------------------------------|
  # |              $a0               |
  # |--------------------------------| sp+48  <-- start of caller's frame
  # |               s                |
  # |--------------------------------| sp+36
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
  la $sp, -48($sp)
  sw $s0, 16($sp)
  sw $s1, 20($sp)
  sw $ra, 24($sp)
  sw $a0, 48($sp)

  li $t0, 3
  li $t1, 4
  slt $t2, $t0, $t1
  li $t0, 5
  li $t1, 6
  slt $t3, $t0, $t1
  and $t0, $t2, $t3
  beq $t0, $zero, _L0
_L0:
  li $t0, 3
  lw $t1, 32($sp)
  slt $t2, $t0, $t1
  xor $t0, $t2, 1
  beq $t0, $zero, _L1
_L1:
  lw $t0, 32($sp)
  li $t1, 0
  sgt $t2, $t0, $t1
  lw $t0, 32($sp)
  lw $t1, 32($sp)
  la $t3, 36($sp)
  addu $t4, $t3, $t1
  lb $t1, ($t4)
  sne $t3, $t0, $t1
  and $t0, $t2, $t3
  beq $t0, $zero, _L2
  j _L4
_L2:
  li $t0, 0
  la $t1, 36($sp)
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 1
  la $t2, 36($sp)
  addu $t3, $t2, $t1
  lb $t1, ($t3)
  seq $t2, $t0, $t1
  li $t0, 1
  la $t1, 36($sp)
  addu $t3, $t1, $t0
  lb $t0, ($t3)
  li $t1, 2
  la $t3, 36($sp)
  addu $t4, $t3, $t1
  lb $t1, ($t4)
  seq $t3, $t0, $t1
  li $t0, 2
  la $t1, 36($sp)
  addu $t4, $t1, $t0
  lb $t0, ($t4)
  lw $t1, 32($sp)
  sne $t4, $t0, $t1
  and $t0, $t3, $t4
  or $t1, $t2, $t0
  beq $t1, $zero, _L3
  j _L4
_L3:
  li $t0, 0
  move $a0, $t0
  jal _boring
  move $s0, $v0
  li $t0, 1
  move $a0, $t0
  jal _boring
  move $t0, $v0
  slt $s1, $s0, $t0
  li $t0, 2
  move $a0, $t0
  jal _boring
  move $s0, $v0
  li $t0, 3
  move $a0, $t0
  jal _boring
  move $t0, $v0
  slt $t1, $s0, $t0
  and $s0, $s1, $t1
  lw $s1, 32($sp)
  li $t0, 4
  move $a0, $t0
  jal _boring
  move $t0, $v0
  seq $t1, $s1, $t0
  and $t0, $s0, $t1
  xor $t1, $t0, 1
  beq $t1, $zero, _L4
_L4:

__leavemain:
  lw $a0, 48($sp)
  lw $ra, 24($sp)
  lw $s1, 20($sp)
  lw $s0, 16($sp)
  la $sp, 48($sp)
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
