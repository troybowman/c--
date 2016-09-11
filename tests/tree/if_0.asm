#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_IF
# child IF_COND for node 2
# node 3: type: TNT_LT
# child LHS for node 3
# node 4: type: TNT_INTCON val: 4
# child RHS for node 3
# node 5: type: TNT_INTCON val: 5
# child IF_BODY for node 2
# node 6: type: TNT_RET
# child SEQ_NEXT for node 1
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_IF
# child IF_COND for node 8
# node 9: type: TNT_EQ
# child LHS for node 9
# node 10: type: TNT_INTCON val: 4
# child RHS for node 9
# node 11: type: TNT_INTCON val: 10
# child IF_BODY for node 8
# node 12: type: TNT_RET
# child IF_ELSE for node 8
# node 13: type: TNT_RET
# child SEQ_NEXT for node 7
# node 14: type: TNT_STMT
# child SEQ_CUR for node 14
# node 15: type: TNT_IF
# child IF_COND for node 15
# node 16: type: TNT_GEQ
# child LHS for node 16
# node 17: type: TNT_CHARCON str: 'x'
# child RHS for node 16
# node 18: type: TNT_INTCON val: 9
# child IF_BODY for node 15
# node 19: type: TNT_STMT
# child SEQ_CUR for node 19
# node 20: type: TNT_RET
# child IF_ELSE for node 15
# node 21: type: TNT_IF
# child IF_COND for node 21
# node 22: type: TNT_NEQ
# child LHS for node 22
# node 23: type: TNT_INTCON val: 3
# child RHS for node 22
# node 24: type: TNT_INTCON val: 4
# child IF_BODY for node 21
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_RET
# child IF_ELSE for node 21
# node 27: type: TNT_IF
# child IF_COND for node 27
# node 28: type: TNT_LEQ
# child LHS for node 28
# node 29: type: TNT_INTCON val: 67
# child RHS for node 28
# node 30: type: TNT_INTCON val: 66
# child IF_BODY for node 27
# node 31: type: TNT_STMT
# child SEQ_CUR for node 31
# node 32: type: TNT_RET
# child IF_ELSE for node 27
# node 33: type: TNT_RET

.data

.text

main:

  # |--------------------------------|

  li $t0, 4
  li $t1, 5
  slt $t2, $t0, $t1
  beq $t2, $zero, _L0
  j __leavemain
_L0:
  li $t0, 4
  li $t1, 10
  seq $t2, $t0, $t1
  beq $t2, $zero, _L1
  j __leavemain
  j _L2
_L1:
  j __leavemain
_L2:
  li $t0, 'x'
  li $t1, 9
  sge $t2, $t0, $t1
  beq $t2, $zero, _L3
  j __leavemain
  j _L6
_L3:
  li $t0, 3
  li $t1, 4
  sne $t2, $t0, $t1
  beq $t2, $zero, _L4
  j __leavemain
  j _L6
_L4:
  li $t0, 67
  li $t1, 66
  sle $t2, $t0, $t1
  beq $t2, $zero, _L5
  j __leavemain
  j _L6
_L5:
  j __leavemain
_L6:

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
