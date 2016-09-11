#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_IF
# child IF_COND for node 2
# node 3: type: TNT_EQ
# child LHS for node 3
# node 4: type: TNT_SYMBOL sym: arg
# child RHS for node 3
# node 5: type: TNT_INTCON val: 1
# child IF_BODY for node 2
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: x
# child RHS for node 6
# node 8: type: TNT_CHARCON str: 'a'
# child IF_ELSE for node 2
# node 9: type: TNT_IF
# child IF_COND for node 9
# node 10: type: TNT_EQ
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: arg
# child RHS for node 10
# node 12: type: TNT_INTCON val: 2
# child IF_BODY for node 9
# node 13: type: TNT_ASSG
# child LHS for node 13
# node 14: type: TNT_SYMBOL sym: x
# child RHS for node 13
# node 15: type: TNT_CHARCON str: 'b'
# child IF_ELSE for node 9
# node 16: type: TNT_IF
# child IF_COND for node 16
# node 17: type: TNT_EQ
# child LHS for node 17
# node 18: type: TNT_SYMBOL sym: arg
# child RHS for node 17
# node 19: type: TNT_INTCON val: 3
# child IF_BODY for node 16
# node 20: type: TNT_ASSG
# child LHS for node 20
# node 21: type: TNT_SYMBOL sym: x
# child RHS for node 20
# node 22: type: TNT_CHARCON str: 'c'
# child IF_ELSE for node 16
# node 23: type: TNT_ASSG
# child LHS for node 23
# node 24: type: TNT_SYMBOL sym: x
# child RHS for node 23
# node 25: type: TNT_CHARCON str: 'z'
# child SEQ_NEXT for node 1
# node 26: type: TNT_STMT
# child SEQ_CUR for node 26
# node 27: type: TNT_IF
# child IF_COND for node 27
# node 28: type: TNT_EQ
# child LHS for node 28
# node 29: type: TNT_SYMBOL sym: arg
# child RHS for node 28
# node 30: type: TNT_INTCON val: 1
# child IF_BODY for node 27
# node 31: type: TNT_ASSG
# child LHS for node 31
# node 32: type: TNT_SYMBOL sym: x
# child RHS for node 31
# node 33: type: TNT_CHARCON str: 'a'
# child IF_ELSE for node 27
# node 34: type: TNT_STMT
# child SEQ_CUR for node 34
# node 35: type: TNT_IF
# child IF_COND for node 35
# node 36: type: TNT_EQ
# child LHS for node 36
# node 37: type: TNT_SYMBOL sym: arg
# child RHS for node 36
# node 38: type: TNT_INTCON val: 2
# child IF_BODY for node 35
# node 39: type: TNT_ASSG
# child LHS for node 39
# node 40: type: TNT_SYMBOL sym: x
# child RHS for node 39
# node 41: type: TNT_CHARCON str: 'b'
# child IF_ELSE for node 35
# node 42: type: TNT_STMT
# child SEQ_CUR for node 42
# node 43: type: TNT_IF
# child IF_COND for node 43
# node 44: type: TNT_EQ
# child LHS for node 44
# node 45: type: TNT_SYMBOL sym: arg
# child RHS for node 44
# node 46: type: TNT_INTCON val: 3
# child IF_BODY for node 43
# node 47: type: TNT_ASSG
# child LHS for node 47
# node 48: type: TNT_SYMBOL sym: x
# child RHS for node 47
# node 49: type: TNT_CHARCON str: 'c'
# child IF_ELSE for node 43
# node 50: type: TNT_STMT
# child SEQ_CUR for node 50
# node 51: type: TNT_ASSG
# child LHS for node 51
# node 52: type: TNT_SYMBOL sym: x
# child RHS for node 51
# node 53: type: TNT_CHARCON str: 'z'

.data

.text

main:

  # |--------------------------------|
  # |        <arg is in $a0>         |
  # |--------------------------------| sp+8  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+4
  # |               x                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  move $t0, $a0
  li $t1, 1
  seq $t2, $t0, $t1
  beq $t2, $zero, _L0
  li $t0, 'a'
  sw $t0, 0($sp)
  j _L3
_L0:
  move $t0, $a0
  li $t1, 2
  seq $t2, $t0, $t1
  beq $t2, $zero, _L1
  li $t0, 'b'
  sw $t0, 0($sp)
  j _L3
_L1:
  move $t0, $a0
  li $t1, 3
  seq $t2, $t0, $t1
  beq $t2, $zero, _L2
  li $t0, 'c'
  sw $t0, 0($sp)
  j _L3
_L2:
  li $t0, 'z'
  sw $t0, 0($sp)
_L3:
  move $t0, $a0
  li $t1, 1
  seq $t2, $t0, $t1
  beq $t2, $zero, _L4
  li $t0, 'a'
  sw $t0, 0($sp)
  j _L9
_L4:
  move $t0, $a0
  li $t1, 2
  seq $t2, $t0, $t1
  beq $t2, $zero, _L5
  li $t0, 'b'
  sw $t0, 0($sp)
  j _L8
_L5:
  move $t0, $a0
  li $t1, 3
  seq $t2, $t0, $t1
  beq $t2, $zero, _L6
  li $t0, 'c'
  sw $t0, 0($sp)
  j _L7
_L6:
  li $t0, 'z'
  sw $t0, 0($sp)
_L7:
_L8:
_L9:

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
