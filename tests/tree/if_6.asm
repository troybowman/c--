#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_IF
# child IF_COND for node 2
# node 3: type: TNT_EQ
# child LHS for node 3
# node 4: type: TNT_INTCON val: 5
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
# node 10: type: TNT_INTCON val: 6
# child RHS for node 9
# node 11: type: TNT_INTCON val: 6
# child IF_BODY for node 8
# node 12: type: TNT_RET

.data

.text

main:

  # |--------------------------------|

  li $t0, 5
  li $t1, 5
  seq $t2, $t0, $t1
  beq $t2, $zero, _L0
  j __leavemain
_L0:
  li $t0, 6
  li $t1, 6
  seq $t2, $t0, $t1
  beq $t2, $zero, _L1
  j __leavemain
_L1:

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
