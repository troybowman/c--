#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_NEXT for node 1
# node 2: type: TNT_STMT
# child SEQ_CUR for node 2
# node 3: type: TNT_STMT
# child SEQ_CUR for node 3
# node 4: type: TNT_STMT
# child SEQ_CUR for node 4
# node 5: type: TNT_STMT
# child SEQ_NEXT for node 2
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_STMT
# child SEQ_CUR for node 8
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_STMT
# child SEQ_CUR for node 10
# node 11: type: TNT_IF
# child IF_COND for node 11
# node 12: type: TNT_EQ
# child LHS for node 12
# node 13: type: TNT_SYMBOL sym: x
# child RHS for node 12
# node 14: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 14
# node 15: type: TNT_INTCON val: 13
# child IF_BODY for node 11
# node 16: type: TNT_RET
# child RET_EXPR for node 16
# node 17: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 7
# node 18: type: TNT_STMT
# child SEQ_CUR for node 18
# node 19: type: TNT_RET
# child RET_EXPR for node 19
# node 20: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 6
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_STMT
# child SEQ_CUR for node 22
# node 23: type: TNT_RET
# child RET_EXPR for node 23
# node 24: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 22
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_STMT
# child SEQ_CUR for node 26
# node 27: type: TNT_RET
# child RET_EXPR for node 27
# node 28: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 26
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_STMT
# child SEQ_CUR for node 30
# node 31: type: TNT_RET
# child RET_EXPR for node 31
# node 32: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 21
# node 33: type: TNT_STMT
# child SEQ_CUR for node 33
# node 34: type: TNT_IF
# child IF_COND for node 34
# node 35: type: TNT_LT
# child LHS for node 35
# node 36: type: TNT_INTCON val: 3
# child RHS for node 35
# node 37: type: TNT_INTCON val: 4
# child IF_BODY for node 34
# node 38: type: TNT_STMT
# child SEQ_CUR for node 38
# node 39: type: TNT_STMT
# child IF_ELSE for node 34
# node 40: type: TNT_STMT
# child SEQ_CUR for node 40
# node 41: type: TNT_STMT
# child SEQ_CUR for node 41
# node 42: type: TNT_STMT
# child SEQ_CUR for node 42
# node 43: type: TNT_ASSG
# child LHS for node 43
# node 44: type: TNT_SYMBOL sym: x
# child RHS for node 43
# node 45: type: TNT_SYMBOL sym: x

.data

.text

main:

  # |--------------------------------|
  # |               y                |
  # |--------------------------------| sp+4
  # |               x                |
  # |--------------------------------| sp+0
  la $sp, -56($sp)

  lw $t0, 0($sp)
  li $t1, 13
  la $t2, 4($sp)
  addu $t3, $t2, $t1
  lb $t1, ($t3)
  seq $t2, $t0, $t1
  beq $t2, $zero, _L0
  li $t0, 1
  move $v0, $t0
  j __leavemain
_L0:
  li $t0, 2
  move $v0, $t0
  j __leavemain
  li $t0, 3
  move $v0, $t0
  j __leavemain
  li $t0, 4
  move $v0, $t0
  j __leavemain
  li $t0, 5
  move $v0, $t0
  j __leavemain
  li $t0, 3
  li $t1, 4
  slt $t2, $t0, $t1
  beq $t2, $zero, _L1
  j _L2
_L1:
  lw $t0, 0($sp)
  sw $t0, 0($sp)
_L2:

__leavemain:
  la $sp, 56($sp)
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
