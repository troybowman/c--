#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: print_string
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_STRCON str: "hello"
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 6
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_INTCON val: 5
# child SEQ_NEXT for node 5
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_CHARCON str: 'x'
# child SEQ_NEXT for node 9
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_CALL sym: print_strings
# child CALL_ARGS for node 14
# node 15: type: TNT_ARG
# child SEQ_CUR for node 15
# node 16: type: TNT_STRCON str: "one"
# child SEQ_NEXT for node 15
# node 17: type: TNT_ARG
# child SEQ_CUR for node 17
# node 18: type: TNT_STRCON str: "two"
# child SEQ_NEXT for node 17
# node 19: type: TNT_ARG
# child SEQ_CUR for node 19
# node 20: type: TNT_STRCON str: "three"
# child SEQ_NEXT for node 19
# node 21: type: TNT_ARG
# child SEQ_CUR for node 21
# node 22: type: TNT_STRCON str: "four"
# child SEQ_NEXT for node 13
# node 23: type: TNT_STMT
# child SEQ_CUR for node 23
# node 24: type: TNT_CALL sym: print_ints
# child CALL_ARGS for node 24
# node 25: type: TNT_ARG
# child SEQ_CUR for node 25
# node 26: type: TNT_INTCON val: 1
# child SEQ_NEXT for node 25
# node 27: type: TNT_ARG
# child SEQ_CUR for node 27
# node 28: type: TNT_INTCON val: 2
# child SEQ_NEXT for node 27
# node 29: type: TNT_ARG
# child SEQ_CUR for node 29
# node 30: type: TNT_CHARCON str: '3'
# child SEQ_NEXT for node 23
# node 31: type: TNT_STMT
# child SEQ_CUR for node 31
# node 32: type: TNT_CALL sym: print_misc
# child CALL_ARGS for node 32
# node 33: type: TNT_ARG
# child SEQ_CUR for node 33
# node 34: type: TNT_STRCON str: "one"
# child SEQ_NEXT for node 33
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_CHARCON str: '2'
# child SEQ_NEXT for node 35
# node 37: type: TNT_ARG
# child SEQ_CUR for node 37
# node 38: type: TNT_STRCON str: "three"
# child SEQ_NEXT for node 37
# node 39: type: TNT_ARG
# child SEQ_CUR for node 39
# node 40: type: TNT_INTCON val: 4

.data

  _str0:
    .asciiz "hello"
    .align 2

  _str1:
    .asciiz "one"
    .align 2

  _str2:
    .asciiz "two"
    .align 2

  _str3:
    .asciiz "three"
    .align 2

  _str4:
    .asciiz "four"
    .align 2

.text

main:

  # |--------------------------------|
  # |              $a3               |
  # |--------------------------------| sp+36
  # |              $a2               |
  # |--------------------------------| sp+32
  # |              $a1               |
  # |--------------------------------| sp+28
  # |              $a0               |
  # |--------------------------------| sp+24  <-- start of caller's frame
  # |           <padding>            |
  # |--------------------------------| sp+20
  # |              $ra               |
  # |--------------------------------| sp+16
  # |     <minimum 4 arg slots>      |
  # |--------------------------------| sp+0
  la $sp, -24($sp)
  sw $ra, 16($sp)
  sw $a0, 24($sp)
  sw $a1, 28($sp)
  sw $a2, 32($sp)
  sw $a3, 36($sp)

  la $t0, _str0
  move $a0, $t0
  jal print_string
  li $t0, 5
  move $a0, $t0
  jal print_int
  li $t0, 'x'
  move $a0, $t0
  jal print_int
  la $t0, _str1
  la $t1, _str2
  la $t2, _str3
  la $t3, _str4
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal print_strings
  li $t0, 1
  li $t1, 2
  li $t2, '3'
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal print_ints
  la $t0, _str1
  li $t1, '2'
  la $t2, _str3
  li $t3, 4
  move $a3, $t3
  move $a2, $t2
  move $a1, $t1
  move $a0, $t0
  jal print_misc

__leavemain:
  lw $a3, 36($sp)
  lw $a2, 32($sp)
  lw $a1, 28($sp)
  lw $a0, 24($sp)
  lw $ra, 16($sp)
  la $sp, 24($sp)
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
