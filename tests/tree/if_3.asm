#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: getint
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_INTCON val: 4
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: nest
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_IF
# child IF_COND for node 2
# node 3: type: TNT_EQ
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: y
# child RHS for node 3
# node 5: type: TNT_INTCON val: 6
# child IF_ELSE for node 2
# node 6: type: TNT_IF
# child IF_COND for node 6
# node 7: type: TNT_NOT
# child RHS for node 7
# node 8: type: TNT_NOT
# child RHS for node 8
# node 9: type: TNT_NOT
# child RHS for node 9
# node 10: type: TNT_LT
# child LHS for node 10
# node 11: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 11
# node 12: type: TNT_INTCON val: 10
# child RHS for node 10
# node 13: type: TNT_INTCON val: 3
# child IF_ELSE for node 6
# node 14: type: TNT_IF
# child IF_COND for node 14
# node 15: type: TNT_NOT
# child RHS for node 15
# node 16: type: TNT_NOT
# child RHS for node 16
# node 17: type: TNT_NOT
# child RHS for node 17
# node 18: type: TNT_NOT
# child RHS for node 18
# node 19: type: TNT_EQ
# child LHS for node 19
# node 20: type: TNT_SYMBOL sym: y
# child RHS for node 19
# node 21: type: TNT_INTCON val: 6
# child SEQ_NEXT for node 1
# node 22: type: TNT_STMT
# child SEQ_CUR for node 22
# node 23: type: TNT_IF
# child IF_COND for node 23
# node 24: type: TNT_AND
# child LHS for node 24
# node 25: type: TNT_AND
# child LHS for node 25
# node 26: type: TNT_AND
# child LHS for node 26
# node 27: type: TNT_LT
# child LHS for node 27
# node 28: type: TNT_SYMBOL sym: y
# child RHS for node 27
# node 29: type: TNT_INTCON val: 4
# child RHS for node 26
# node 30: type: TNT_GT
# child LHS for node 30
# node 31: type: TNT_SYMBOL sym: y
# child RHS for node 30
# node 32: type: TNT_INTCON val: 5
# child RHS for node 25
# node 33: type: TNT_EQ
# child LHS for node 33
# node 34: type: TNT_SYMBOL sym: y
# child RHS for node 33
# node 35: type: TNT_INTCON val: 6
# child RHS for node 24
# node 36: type: TNT_EQ
# child LHS for node 36
# node 37: type: TNT_SYMBOL sym: y
# child RHS for node 36
# node 38: type: TNT_INTCON val: 7
# child SEQ_NEXT for node 22
# node 39: type: TNT_STMT
# child SEQ_CUR for node 39
# node 40: type: TNT_IF
# child IF_COND for node 40
# node 41: type: TNT_AND
# child LHS for node 41
# node 42: type: TNT_LT
# child LHS for node 42
# node 43: type: TNT_SYMBOL sym: y
# child RHS for node 42
# node 44: type: TNT_INTCON val: 4
# child RHS for node 41
# node 45: type: TNT_AND
# child LHS for node 45
# node 46: type: TNT_GT
# child LHS for node 46
# node 47: type: TNT_SYMBOL sym: y
# child RHS for node 46
# node 48: type: TNT_INTCON val: 5
# child RHS for node 45
# node 49: type: TNT_AND
# child LHS for node 49
# node 50: type: TNT_EQ
# child LHS for node 50
# node 51: type: TNT_SYMBOL sym: y
# child RHS for node 50
# node 52: type: TNT_INTCON val: 6
# child RHS for node 49
# node 53: type: TNT_NOT
# child RHS for node 53
# node 54: type: TNT_EQ
# child LHS for node 54
# node 55: type: TNT_SYMBOL sym: y
# child RHS for node 54
# node 56: type: TNT_INTCON val: 7

.data

.text

_getint:

  # |--------------------------------|

  li $t0, 4
  move $v0, $t0
  j __leave_getint

__leave_getint:
  jr $ra

_nest:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+44
  # |               y                |
  # |--------------------------------| sp+40
  # |               x                |
  # |--------------------------------| sp+0
  la $sp, -48($sp)

  lb $t0, 40($sp)
  li $t1, 6
  seq $t2, $t0, $t1
  beq $t2, $zero, _L0
  j _L2
_L0:
  li $t0, 10
  sll $t1, $t0, 2
  la $t0, 0($sp)
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  li $t1, 3
  slt $t2, $t0, $t1
  xor $t0, $t2, 1
  xor $t1, $t0, 1
  xor $t0, $t1, 1
  beq $t0, $zero, _L1
  j _L2
_L1:
  lb $t0, 40($sp)
  li $t1, 6
  seq $t2, $t0, $t1
  xor $t0, $t2, 1
  xor $t1, $t0, 1
  xor $t0, $t1, 1
  xor $t1, $t0, 1
  beq $t1, $zero, _L2
_L2:
  lb $t0, 40($sp)
  li $t1, 4
  slt $t2, $t0, $t1
  lb $t0, 40($sp)
  li $t1, 5
  sgt $t3, $t0, $t1
  and $t0, $t2, $t3
  lb $t1, 40($sp)
  li $t2, 6
  seq $t3, $t1, $t2
  and $t1, $t0, $t3
  lb $t0, 40($sp)
  li $t2, 7
  seq $t3, $t0, $t2
  and $t0, $t1, $t3
  beq $t0, $zero, _L3
_L3:
  lb $t0, 40($sp)
  li $t1, 4
  slt $t2, $t0, $t1
  lb $t0, 40($sp)
  li $t1, 5
  sgt $t3, $t0, $t1
  lb $t0, 40($sp)
  li $t1, 6
  seq $t4, $t0, $t1
  lb $t0, 40($sp)
  li $t1, 7
  seq $t5, $t0, $t1
  xor $t0, $t5, 1
  and $t1, $t4, $t0
  and $t0, $t3, $t1
  and $t1, $t2, $t0
  beq $t1, $zero, _L4
_L4:

__leave_nest:
  la $sp, 48($sp)
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
