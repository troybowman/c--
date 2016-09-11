#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: sum
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_PLUS
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: x
# child RHS for node 3
# node 5: type: TNT_SYMBOL sym: y
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: x
# child RHS for node 2
# node 4: type: TNT_PLUS
# child LHS for node 4
# node 5: type: TNT_INTCON val: 1
# child RHS for node 4
# node 6: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 1
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_ASSG
# child LHS for node 8
# node 9: type: TNT_SYMBOL sym: x
# child RHS for node 8
# node 10: type: TNT_MINUS
# child LHS for node 10
# node 11: type: TNT_INTCON val: 2
# child RHS for node 10
# node 12: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 7
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_ASSG
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: x
# child RHS for node 14
# node 16: type: TNT_MULT
# child LHS for node 16
# node 17: type: TNT_INTCON val: 4
# child RHS for node 16
# node 18: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 13
# node 19: type: TNT_STMT
# child SEQ_CUR for node 19
# node 20: type: TNT_ASSG
# child LHS for node 20
# node 21: type: TNT_SYMBOL sym: x
# child RHS for node 20
# node 22: type: TNT_DIV
# child LHS for node 22
# node 23: type: TNT_INTCON val: 6
# child RHS for node 22
# node 24: type: TNT_INTCON val: 7
# child SEQ_NEXT for node 19
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_ASSG
# child LHS for node 26
# node 27: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 27
# node 28: type: TNT_INTCON val: 0
# child RHS for node 26
# node 29: type: TNT_PLUS
# child LHS for node 29
# node 30: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 30
# node 31: type: TNT_INTCON val: 1
# child RHS for node 29
# node 32: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 32
# node 33: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 25
# node 34: type: TNT_STMT
# child SEQ_CUR for node 34
# node 35: type: TNT_ASSG
# child LHS for node 35
# node 36: type: TNT_SYMBOL sym: x
# child RHS for node 35
# node 37: type: TNT_DIV
# child LHS for node 37
# node 38: type: TNT_CALL sym: sum
# child CALL_ARGS for node 38
# node 39: type: TNT_ARG
# child SEQ_CUR for node 39
# node 40: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 40
# node 41: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 39
# node 42: type: TNT_ARG
# child SEQ_CUR for node 42
# node 43: type: TNT_SYMBOL sym: x
# child RHS for node 37
# node 44: type: TNT_CALL sym: sum
# child CALL_ARGS for node 44
# node 45: type: TNT_ARG
# child SEQ_CUR for node 45
# node 46: type: TNT_INTCON val: 150
# child SEQ_NEXT for node 45
# node 47: type: TNT_ARG
# child SEQ_CUR for node 47
# node 48: type: TNT_INTCON val: 777

.data

.text

_sum:

  # |--------------------------------|
  # |         <y is in $a1>          |
  # |--------------------------------| sp+4
  # |         <x is in $a0>          |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  move $t1, $a1
  addu $t2, $t0, $t1
  move $v0, $t2
  j __leave_sum

__leave_sum:
  jr $ra

main:

  # |--------------------------------|
  # |              $a1               |
  # |--------------------------------| sp+44
  # |              $a0               |
  # |--------------------------------| sp+40  <-- start of caller's frame
  # |               y                |
  # |--------------------------------| sp+28
  # |               x                |
  # |--------------------------------| sp+24
  # |              $ra               |
  # |--------------------------------| sp+20
  # |              $s0               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -40($sp)
  sw $s0, 16($sp)
  sw $ra, 20($sp)
  sw $a0, 40($sp)
  sw $a1, 44($sp)

  li $t0, 1
  li $t1, 2
  addu $t2, $t0, $t1
  sw $t2, 24($sp)
  li $t0, 2
  li $t1, 3
  sub $t2, $t0, $t1
  sw $t2, 24($sp)
  li $t0, 4
  li $t1, 5
  mul $t2, $t0, $t1
  sw $t2, 24($sp)
  li $t0, 6
  li $t1, 7
  div $t2, $t0, $t1
  sw $t2, 24($sp)
  li $t0, 1
  la $t1, 28($sp)
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 2
  la $t2, 28($sp)
  addu $t3, $t2, $t1
  lb $t1, ($t3)
  addu $t2, $t0, $t1
  li $t0, 0
  la $t1, 28($sp)
  addu $t3, $t1, $t0
  sb $t2, ($t3)
  li $t0, 4
  la $t1, 28($sp)
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  lw $t1, 24($sp)
  move $a1, $t1
  move $a0, $t0
  jal _sum
  move $s0, $v0
  li $t0, 150
  li $t1, 777
  move $a1, $t1
  move $a0, $t0
  jal _sum
  move $t0, $v0
  div $t1, $s0, $t0
  sw $t1, 24($sp)

__leavemain:
  lw $a1, 44($sp)
  lw $a0, 40($sp)
  lw $ra, 20($sp)
  lw $s0, 16($sp)
  la $sp, 40($sp)
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
