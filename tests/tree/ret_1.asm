#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: func1
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 1
# node 4: type: TNT_STMT
# child SEQ_CUR for node 4
# node 5: type: TNT_RET
# child RET_EXPR for node 5
# node 6: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 6
# node 7: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 4
# node 8: type: TNT_STMT
# child SEQ_CUR for node 8
# node 9: type: TNT_RET
# child RET_EXPR for node 9
# node 10: type: TNT_SYMBOL sym: argc
# child SEQ_NEXT for node 8
# node 11: type: TNT_STMT
# child SEQ_CUR for node 11
# node 12: type: TNT_RET
# child RET_EXPR for node 12
# node 13: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 13
# node 14: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 11
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_RET
# child RET_EXPR for node 16
# node 17: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 17
# node 18: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 18
# node 19: type: TNT_ARRAY_LOOKUP sym: argv
# child AL_OFFSET for node 19
# node 20: type: TNT_SYMBOL sym: z
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: func2
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child SEQ_NEXT for node 1
# node 3: type: TNT_STMT
# child SEQ_CUR for node 3
# node 4: type: TNT_RET
# child SEQ_NEXT for node 3
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 7
# node 8: type: TNT_INTCON val: 0
# child RHS for node 6
# node 9: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 5
# node 10: type: TNT_STMT
# child SEQ_CUR for node 10
# node 11: type: TNT_RET

.data

  _x:
    .space 20

.text

_func1:

  # |--------------------------------|
  # |        <argv is in $a1>        |
  # |--------------------------------| sp+12
  # |        <argc is in $a0>        |
  # |--------------------------------| sp+8  <-- start of caller's frame
  # |               z                |
  # |--------------------------------| sp+4
  # |               y                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  li $t0, 0
  move $v0, $t0
  j __leave_func1
  li $t0, 5
  sll $t1, $t0, 2
  la $t0, _x
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $v0, $t0
  j __leave_func1
  move $t0, $a0
  move $v0, $t0
  j __leave_func1
  li $t0, 0
  move $t1, $a1
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  move $v0, $t0
  j __leave_func1
  lb $t0, 4($sp)
  move $t1, $a1
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  sll $t1, $t0, 2
  la $t0, _x
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $t1, $a1
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  move $v0, $t0
  j __leave_func1

__leave_func1:
  la $sp, 8($sp)
  jr $ra

_func2:

  # |--------------------------------|

  j __leave_func2
  j __leave_func2
  li $t0, 5
  li $t1, 0
  sll $t2, $t1, 2
  la $t1, _x
  addu $t3, $t1, $t2
  sw $t0, ($t3)
  j __leave_func2

__leave_func2:
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
