#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 4
# node 5: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 1
# node 6: type: TNT_STMT
# child SEQ_CUR for node 6
# node 7: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 7
# node 8: type: TNT_ARG
# child SEQ_CUR for node 8
# node 9: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 9
# node 10: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 10
# node 11: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 11
# node 12: type: TNT_SYMBOL sym: argc
# child SEQ_NEXT for node 6
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_CALL sym: print_misc
# child CALL_ARGS for node 14
# node 15: type: TNT_ARG
# child SEQ_CUR for node 15
# node 16: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 16
# node 17: type: TNT_INTCON val: 0
# child SEQ_NEXT for node 15
# node 18: type: TNT_ARG
# child SEQ_CUR for node 18
# node 19: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 19
# node 20: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 18
# node 21: type: TNT_ARG
# child SEQ_CUR for node 21
# node 22: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 22
# node 23: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 23
# node 24: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 21
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_STRCON str: "test"

.data

  _x:
    .space 40

  _str0:
    .asciiz "test"
    .align 2

.text

main:

  # |--------------------------------|
  # |              $a3               |
  # |--------------------------------| sp+44
  # |              $a2               |
  # |--------------------------------| sp+40
  # |              argv              |
  # |--------------------------------| sp+36
  # |              argc              |
  # |--------------------------------| sp+32  <-- start of caller's frame
  # |               y                |
  # |--------------------------------| sp+24
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -32($sp)
  sw $ra, 16($sp)
  sw $a0, 32($sp)
  sw $a1, 36($sp)
  sw $a2, 40($sp)
  sw $a3, 44($sp)

  li $t0, 3
  la $t1, 24($sp)
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  move $a0, $t0
  jal print_int
  lb $t0, 32($sp)
  la $t1, 24($sp)
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  sll $t1, $t0, 2
  la $t0, _x
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  la $t1, 24($sp)
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  move $a0, $t0
  jal print_int
  li $t0, 0
  la $t1, 24($sp)
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  li $t1, 1
  sll $t2, $t1, 2
  la $t1, _x
  addu $t3, $t1, $t2
  lw $t1, ($t3)
  li $t2, 1
  la $t3, 24($sp)
  addu $t4, $t3, $t2
  lb $t2, ($t4)
  sll $t3, $t2, 2
  la $t2, _x
  addu $t4, $t2, $t3
  lw $t2, ($t4)
  la $t3, _str0
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal print_misc

__leavemain:
  lw $a3, 44($sp)
  lw $a2, 40($sp)
  lw $a1, 36($sp)
  lw $a0, 32($sp)
  lw $ra, 16($sp)
  la $sp, 32($sp)
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
