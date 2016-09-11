#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: x_at
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: x
# child AL_OFFSET for node 3
# node 4: type: TNT_SYMBOL sym: idx
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: y_at
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: y
# child AL_OFFSET for node 3
# node 4: type: TNT_SYMBOL sym: idx
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: char_at
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_ARRAY_LOOKUP sym: string
# child AL_OFFSET for node 3
# node 4: type: TNT_SYMBOL sym: idx
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_ASSG
# child LHS for node 2
# node 3: type: TNT_SYMBOL sym: local
# child RHS for node 2
# node 4: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 4
# node 5: type: TNT_ARG
# child SEQ_CUR for node 5
# node 6: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 1
# node 7: type: TNT_STMT
# child SEQ_CUR for node 7
# node 8: type: TNT_ASSG
# child LHS for node 8
# node 9: type: TNT_SYMBOL sym: local
# child RHS for node 8
# node 10: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 12
# node 13: type: TNT_ARG
# child SEQ_CUR for node 13
# node 14: type: TNT_SYMBOL sym: local
# child SEQ_NEXT for node 7
# node 15: type: TNT_STMT
# child SEQ_CUR for node 15
# node 16: type: TNT_ASSG
# child LHS for node 16
# node 17: type: TNT_SYMBOL sym: local
# child RHS for node 16
# node 18: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 18
# node 19: type: TNT_ARG
# child SEQ_CUR for node 19
# node 20: type: TNT_CALL sym: y_at
# child CALL_ARGS for node 20
# node 21: type: TNT_ARG
# child SEQ_CUR for node 21
# node 22: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 22
# node 23: type: TNT_ARG
# child SEQ_CUR for node 23
# node 24: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 24
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_STRCON str: "hello"
# child SEQ_NEXT for node 25
# node 27: type: TNT_ARG
# child SEQ_CUR for node 27
# node 28: type: TNT_INTCON val: 4
# child SEQ_NEXT for node 15
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_CALL sym: set_x
# child CALL_ARGS for node 30
# node 31: type: TNT_ARG
# child SEQ_CUR for node 31
# node 32: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 32
# node 33: type: TNT_ARG
# child SEQ_CUR for node 33
# node 34: type: TNT_SYMBOL sym: local
# child SEQ_NEXT for node 31
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_CALL sym: y_at
# child CALL_ARGS for node 36
# node 37: type: TNT_ARG
# child SEQ_CUR for node 37
# node 38: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 38
# node 39: type: TNT_ARG
# child SEQ_CUR for node 39
# node 40: type: TNT_INTCON val: 3
# child SEQ_NEXT for node 35
# node 41: type: TNT_ARG
# child SEQ_CUR for node 41
# node 42: type: TNT_CHARCON str: 'a'
# child SEQ_NEXT for node 41
# node 43: type: TNT_ARG
# child SEQ_CUR for node 43
# node 44: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 44
# node 45: type: TNT_ARG
# child SEQ_CUR for node 45
# node 46: type: TNT_STRCON str: "test1"
# child SEQ_NEXT for node 45
# node 47: type: TNT_ARG
# child SEQ_CUR for node 47
# node 48: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 48
# node 49: type: TNT_ARG
# child SEQ_CUR for node 49
# node 50: type: TNT_STRCON str: "test2"
# child SEQ_NEXT for node 49
# node 51: type: TNT_ARG
# child SEQ_CUR for node 51
# node 52: type: TNT_CALL sym: x_at
# child CALL_ARGS for node 52
# node 53: type: TNT_ARG
# child SEQ_CUR for node 53
# node 54: type: TNT_CALL sym: char_at
# child CALL_ARGS for node 54
# node 55: type: TNT_ARG
# child SEQ_CUR for node 55
# node 56: type: TNT_STRCON str: "test3"
# child SEQ_NEXT for node 55
# node 57: type: TNT_ARG
# child SEQ_CUR for node 57
# node 58: type: TNT_SYMBOL sym: local
# child SEQ_NEXT for node 43
# node 59: type: TNT_ARG
# child SEQ_CUR for node 59
# node 60: type: TNT_INTCON val: 8675309

.data

  _x:
    .space 20

  _y:
    .space 5
    .align 2

  _str0:
    .asciiz "hello"
    .align 2

  _str1:
    .asciiz "test1"
    .align 2

  _str2:
    .asciiz "test2"
    .align 2

  _str3:
    .asciiz "test3"
    .align 2

.text

_x_at:

  # |--------------------------------|
  # |        <idx is in $a0>         |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  sll $t1, $t0, 2
  la $t0, _x
  addu $t2, $t0, $t1
  lw $t0, ($t2)
  move $v0, $t0
  j __leave_x_at

__leave_x_at:
  jr $ra

_y_at:

  # |--------------------------------|
  # |        <idx is in $a0>         |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a0
  la $t1, _y
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  move $v0, $t0
  j __leave_y_at

__leave_y_at:
  jr $ra

_char_at:

  # |--------------------------------|
  # |        <idx is in $a1>         |
  # |--------------------------------| sp+4
  # |       <string is in $a0>       |
  # |--------------------------------| sp+0  <-- start of caller's frame

  move $t0, $a1
  move $t1, $a0
  addu $t2, $t1, $t0
  lb $t0, ($t2)
  move $v0, $t0
  j __leave_char_at

__leave_char_at:
  jr $ra

main:

  # |--------------------------------|
  # |              $a3               |
  # |--------------------------------| sp+68
  # |              $a2               |
  # |--------------------------------| sp+64
  # |              $a1               |
  # |--------------------------------| sp+60
  # |              $a0               |
  # |--------------------------------| sp+56  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+52
  # |             local              |
  # |--------------------------------| sp+48
  # |           <padding>            |
  # |--------------------------------| sp+44
  # |              $ra               |
  # |--------------------------------| sp+40
  # |              $s4               |
  # |--------------------------------| sp+36
  # |              $s3               |
  # |--------------------------------| sp+32
  # |              $s2               |
  # |--------------------------------| sp+28
  # |              $s1               |
  # |--------------------------------| sp+24
  # |              $s0               |
  # |--------------------------------| sp+20
  # |           <stkarg 0>           |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -56($sp)
  sw $s0, 20($sp)
  sw $s1, 24($sp)
  sw $s2, 28($sp)
  sw $s3, 32($sp)
  sw $s4, 36($sp)
  sw $ra, 40($sp)
  sw $a0, 56($sp)
  sw $a1, 60($sp)
  sw $a2, 64($sp)
  sw $a3, 68($sp)

  li $t0, 1
  move $a0, $t0
  jal _x_at
  move $t0, $v0
  sw $t0, 48($sp)
  lw $t0, 48($sp)
  move $a0, $t0
  jal _x_at
  move $t0, $v0
  move $a0, $t0
  jal _x_at
  move $t0, $v0
  sw $t0, 48($sp)
  la $t0, _str0
  li $t1, 4
  move $a1, $t1
  move $a0, $t0
  jal _char_at
  move $t0, $v0
  move $a0, $t0
  jal _x_at
  move $t0, $v0
  move $a0, $t0
  jal _y_at
  move $t0, $v0
  move $a0, $t0
  jal _x_at
  move $t0, $v0
  sw $t0, 48($sp)
  lw $t0, 48($sp)
  move $a0, $t0
  jal _x_at
  move $s0, $v0
  li $t0, 3
  move $a0, $t0
  jal _x_at
  move $t0, $v0
  move $a0, $t0
  jal _y_at
  move $s1, $v0
  li $s2, 'a'
  la $s3, _str1
  la $s4, _str2
  la $t0, _str3
  lw $t1, 48($sp)
  move $a1, $t1
  move $a0, $t0
  jal _char_at
  move $t0, $v0
  move $a0, $t0
  jal _x_at
  move $t0, $v0
  move $a1, $t0
  move $a0, $s4
  jal _char_at
  move $t0, $v0
  move $a1, $t0
  move $a0, $s3
  jal _char_at
  move $t0, $v0
  li $t1, 8675309
  sw $t1, 16($sp)
  move $a3, $t0
  move $a2, $s2
  move $a1, $s1
  move $a0, $s0
  jal set_x

__leavemain:
  lw $a3, 68($sp)
  lw $a2, 64($sp)
  lw $a1, 60($sp)
  lw $a0, 56($sp)
  lw $ra, 40($sp)
  lw $s4, 36($sp)
  lw $s3, 32($sp)
  lw $s2, 28($sp)
  lw $s1, 24($sp)
  lw $s0, 20($sp)
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
