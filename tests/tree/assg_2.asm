#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: func1
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 3
# node 4: type: TNT_INTCON val: 0
# child RHS for node 2
# node 5: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 8
# node 9: type: TNT_INTCON val: 1
# child RHS for node 7
# node 10: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 6
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_ASSG
# child LHS for node 12
# node 13: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 13
# node 14: type: TNT_INTCON val: 2
# child RHS for node 12
# node 15: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 11
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_ASSG
# child LHS for node 17
# node 18: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 18
# node 19: type: TNT_INTCON val: 3
# child RHS for node 17
# node 20: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 16
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_ASSG
# child LHS for node 22
# node 23: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 23
# node 24: type: TNT_INTCON val: 4
# child RHS for node 22
# node 25: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 21
# node 26: type: TNT_STMT
# child SEQ_CUR for node 26
# node 27: type: TNT_ASSG
# child LHS for node 27
# node 28: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 28
# node 29: type: TNT_INTCON val: 5
# child RHS for node 27
# node 30: type: TNT_INTCON val: 6
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 3
# node 4: type: TNT_INTCON val: 0
# child RHS for node 2
# node 5: type: TNT_CHARCON str: 'h'
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_ASSG
# child LHS for node 7
# node 8: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 8
# node 9: type: TNT_INTCON val: 1
# child RHS for node 7
# node 10: type: TNT_CHARCON str: 'e'
# child SEQ_NEXT for node 6
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_ASSG
# child LHS for node 12
# node 13: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 13
# node 14: type: TNT_INTCON val: 2
# child RHS for node 12
# node 15: type: TNT_CHARCON str: 'l'
# child SEQ_NEXT for node 11
# node 16: type: TNT_STMT
# child SEQ_CUR for node 16
# node 17: type: TNT_ASSG
# child LHS for node 17
# node 18: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 18
# node 19: type: TNT_INTCON val: 3
# child RHS for node 17
# node 20: type: TNT_CHARCON str: 'l'
# child SEQ_NEXT for node 16
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_ASSG
# child LHS for node 22
# node 23: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 23
# node 24: type: TNT_INTCON val: 4
# child RHS for node 22
# node 25: type: TNT_CHARCON str: 'o'

.data

  _x:
    .space 24

.text

_func1:

  # |--------------------------------|

  li $t0, 1
  li $t1, 0
  sll $t2, $t1, 2
  la $t1, _x
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 2
  li $t1, 1
  sll $t2, $t1, 2
  la $t1, _x
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 3
  li $t1, 2
  sll $t2, $t1, 2
  la $t1, _x
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 4
  li $t1, 3
  sll $t2, $t1, 2
  la $t1, _x
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 5
  li $t1, 4
  sll $t2, $t1, 2
  la $t1, _x
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  li $t0, 6
  li $t1, 5
  sll $t2, $t1, 2
  la $t1, _x
  addu $t3, $t1, $t2
  sw $t0, ($t3)

__leave_func1:
  jr $ra

main:

  # |--------------------------------|
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  li $t0, 'h'
  li $t1, 0
  move $t2, $a0
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'e'
  li $t1, 1
  move $t2, $a0
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'l'
  li $t1, 2
  move $t2, $a0
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'l'
  li $t1, 3
  move $t2, $a0
  addu $t3, $t2, $t1
  sb $t0, ($t3)
  li $t0, 'o'
  li $t1, 4
  move $t2, $a0
  addu $t3, $t2, $t1
  sb $t0, ($t3)

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
