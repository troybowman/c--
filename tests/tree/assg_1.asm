#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 3
# node 4: type: TNT_INTCON val: 0
# child RHS for node 2
# node 5: type: TNT_CHARCON str: '\0'

.data

.text

main:

  # |--------------------------------|
  # |        <argv is in $a1>        |
  # |--------------------------------| sp+12
  # |        <argc is in $a0>        |
  # |--------------------------------| sp+8  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+4
  # |               y                |
  # |--------------------------------| sp+0
  la $sp, -8($sp)

  li $t0, '\0'
  li $t1, 0
  la $t2, 0($sp)
  addu $t3, $t2, $t1
  sb $t0, ($t3)

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
