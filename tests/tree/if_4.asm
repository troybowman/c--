#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_IF
# child IF_COND for node 2
# node 3: type: TNT_EQ
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: x
# child RHS for node 3
# node 5: type: TNT_INTCON val: 4
# child IF_BODY for node 2
# node 6: type: TNT_IF
# child IF_COND for node 6
# node 7: type: TNT_EQ
# child LHS for node 7
# node 8: type: TNT_SYMBOL sym: x
# child RHS for node 7
# node 9: type: TNT_INTCON val: 5
# child IF_BODY for node 6
# node 10: type: TNT_IF
# child IF_COND for node 10
# node 11: type: TNT_EQ
# child LHS for node 11
# node 12: type: TNT_SYMBOL sym: x
# child RHS for node 11
# node 13: type: TNT_INTCON val: 6
# child IF_BODY for node 10
# node 14: type: TNT_RET
# child RET_EXPR for node 14
# node 15: type: TNT_INTCON val: 7
# child IF_ELSE for node 10
# node 16: type: TNT_RET
# child RET_EXPR for node 16
# node 17: type: TNT_INTCON val: 8
# child SEQ_NEXT for node 1
# node 18: type: TNT_STMT
# child SEQ_CUR for node 18
# node 19: type: TNT_IF
# child IF_COND for node 19
# node 20: type: TNT_EQ
# child LHS for node 20
# node 21: type: TNT_SYMBOL sym: x
# child RHS for node 20
# node 22: type: TNT_INTCON val: 9
# child IF_BODY for node 19
# node 23: type: TNT_IF
# child IF_COND for node 23
# node 24: type: TNT_EQ
# child LHS for node 24
# node 25: type: TNT_SYMBOL sym: x
# child RHS for node 24
# node 26: type: TNT_INTCON val: 10
# child IF_BODY for node 23
# node 27: type: TNT_STMT
# child SEQ_CUR for node 27
# node 28: type: TNT_IF
# child IF_COND for node 28
# node 29: type: TNT_EQ
# child LHS for node 29
# node 30: type: TNT_SYMBOL sym: x
# child RHS for node 29
# node 31: type: TNT_INTCON val: 11
# child IF_BODY for node 28
# node 32: type: TNT_IF
# child IF_COND for node 32
# node 33: type: TNT_EQ
# child LHS for node 33
# node 34: type: TNT_SYMBOL sym: x
# child RHS for node 33
# node 35: type: TNT_INTCON val: 12
# child IF_BODY for node 32
# node 36: type: TNT_RET
# child RET_EXPR for node 36
# node 37: type: TNT_INTCON val: 13
# child IF_ELSE for node 32
# node 38: type: TNT_IF
# child IF_COND for node 38
# node 39: type: TNT_EQ
# child LHS for node 39
# node 40: type: TNT_SYMBOL sym: x
# child RHS for node 39
# node 41: type: TNT_INTCON val: 14
# child IF_BODY for node 38
# node 42: type: TNT_RET
# child RET_EXPR for node 42
# node 43: type: TNT_INTCON val: 15
# child IF_ELSE for node 38
# node 44: type: TNT_RET
# child RET_EXPR for node 44
# node 45: type: TNT_INTCON val: 16
# child IF_ELSE for node 23
# node 46: type: TNT_RET
# child RET_EXPR for node 46
# node 47: type: TNT_INTCON val: 17

.data

.text

main:

  # |--------------------------------|
  # |           <padding>            |
  # |--------------------------------| sp+4
  # |               x                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  lw $t0, 0($sp)
  li $t1, 4
  seq $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 0($sp)
  li $t1, 5
  seq $t2, $t0, $t1
  beq $t2, $zero, _L1
  lw $t0, 0($sp)
  li $t1, 6
  seq $t2, $t0, $t1
  beq $t2, $zero, _L0
  li $t0, 7
  move $v0, $t0
  j __leavemain
  j _L1
_L0:
  li $t0, 8
  move $v0, $t0
  j __leavemain
_L1:
  lw $t0, 0($sp)
  li $t1, 9
  seq $t2, $t0, $t1
  beq $t2, $zero, _L6
  lw $t0, 0($sp)
  li $t1, 10
  seq $t2, $t0, $t1
  beq $t2, $zero, _L5
  lw $t0, 0($sp)
  li $t1, 11
  seq $t2, $t0, $t1
  beq $t2, $zero, _L4
  lw $t0, 0($sp)
  li $t1, 12
  seq $t2, $t0, $t1
  beq $t2, $zero, _L2
  li $t0, 13
  move $v0, $t0
  j __leavemain
  j _L4
_L2:
  lw $t0, 0($sp)
  li $t1, 14
  seq $t2, $t0, $t1
  beq $t2, $zero, _L3
  li $t0, 15
  move $v0, $t0
  j __leavemain
  j _L4
_L3:
  li $t0, 16
  move $v0, $t0
  j __leavemain
_L4:
  j _L6
_L5:
  li $t0, 17
  move $v0, $t0
  j __leavemain
_L6:

__leavemain:
  la $sp, 8($sp)
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
