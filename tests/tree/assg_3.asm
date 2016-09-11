#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: one
# child RHS for node 2
# node 4: type: TNT_SYMBOL sym: x
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_ASSG
# child LHS for node 6
# node 7: type: TNT_SYMBOL sym: one
# child RHS for node 6
# node 8: type: TNT_SYMBOL sym: y
# child SEQ_NEXT for node 5
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_ASSG
# child LHS for node 10
# node 11: type: TNT_SYMBOL sym: x
# child RHS for node 10
# node 12: type: TNT_SYMBOL sym: one
# child SEQ_NEXT for node 9
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_ASSG
# child LHS for node 14
# node 15: type: TNT_SYMBOL sym: y
# child RHS for node 14
# node 16: type: TNT_SYMBOL sym: y
# child SEQ_NEXT for node 13
# node 17: type: TNT_STMT
# child SEQ_CUR for node 17
# node 18: type: TNT_ASSG
# child LHS for node 18
# node 19: type: TNT_SYMBOL sym: z
# child RHS for node 18
# node 20: type: TNT_SYMBOL sym: one
# child SEQ_NEXT for node 17
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_ASSG
# child LHS for node 22
# node 23: type: TNT_SYMBOL sym: one
# child RHS for node 22
# node 24: type: TNT_SYMBOL sym: z
# child SEQ_NEXT for node 21
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_ASSG
# child LHS for node 26
# node 27: type: TNT_SYMBOL sym: y
# child RHS for node 26
# node 28: type: TNT_SYMBOL sym: z

.data

  _one:
    .space 4

.text

main:

  # |--------------------------------|
  # |         <y is in $a1>          |
  # |--------------------------------| sp+12
  # |         <x is in $a0>          |
  # |--------------------------------| sp+8  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+4
  # |               z                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  move $t0, $a0
  sw $t0, _one
  move $t0, $a1
  sw $t0, _one
  lw $t0, _one
  move $a0, $t0
  move $t0, $a1
  move $a1, $t0
  lw $t0, _one
  sb $t0, 0($sp)
  lb $t0, 0($sp)
  sw $t0, _one
  lb $t0, 0($sp)
  move $a1, $t0

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
