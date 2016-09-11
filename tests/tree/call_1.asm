#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: main
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 2
# node 3: type: TNT_ARG
# child SEQ_CUR for node 3
# node 4: type: TNT_SYMBOL sym: a
# child SEQ_NEXT for node 1
# node 5: type: TNT_STMT
# child SEQ_CUR for node 5
# node 6: type: TNT_CALL sym: print_int
# child CALL_ARGS for node 6
# node 7: type: TNT_ARG
# child SEQ_CUR for node 7
# node 8: type: TNT_SYMBOL sym: l1
# child SEQ_NEXT for node 5
# node 9: type: TNT_STMT
# child SEQ_CUR for node 9
# node 10: type: TNT_CALL sym: print_char
# child CALL_ARGS for node 10
# node 11: type: TNT_ARG
# child SEQ_CUR for node 11
# node 12: type: TNT_SYMBOL sym: b
# child SEQ_NEXT for node 9
# node 13: type: TNT_STMT
# child SEQ_CUR for node 13
# node 14: type: TNT_CALL sym: print_char
# child CALL_ARGS for node 14
# node 15: type: TNT_ARG
# child SEQ_CUR for node 15
# node 16: type: TNT_SYMBOL sym: l1
# child SEQ_NEXT for node 13
# node 17: type: TNT_STMT
# child SEQ_CUR for node 17
# node 18: type: TNT_CALL sym: print_string
# child CALL_ARGS for node 18
# node 19: type: TNT_ARG
# child SEQ_CUR for node 19
# node 20: type: TNT_SYMBOL sym: d
# child SEQ_NEXT for node 17
# node 21: type: TNT_STMT
# child SEQ_CUR for node 21
# node 22: type: TNT_CALL sym: print_string
# child CALL_ARGS for node 22
# node 23: type: TNT_ARG
# child SEQ_CUR for node 23
# node 24: type: TNT_STRCON str: "test"
# child SEQ_NEXT for node 21
# node 25: type: TNT_STMT
# child SEQ_CUR for node 25
# node 26: type: TNT_CALL sym: print_array
# child CALL_ARGS for node 26
# node 27: type: TNT_ARG
# child SEQ_CUR for node 27
# node 28: type: TNT_SYMBOL sym: c
# child SEQ_NEXT for node 25
# node 29: type: TNT_STMT
# child SEQ_CUR for node 29
# node 30: type: TNT_CALL sym: print_array
# child CALL_ARGS for node 30
# node 31: type: TNT_ARG
# child SEQ_CUR for node 31
# node 32: type: TNT_SYMBOL sym: args
# child SEQ_NEXT for node 29
# node 33: type: TNT_STMT
# child SEQ_CUR for node 33
# node 34: type: TNT_CALL sym: print_misc
# child CALL_ARGS for node 34
# node 35: type: TNT_ARG
# child SEQ_CUR for node 35
# node 36: type: TNT_SYMBOL sym: args
# child SEQ_NEXT for node 35
# node 37: type: TNT_ARG
# child SEQ_CUR for node 37
# node 38: type: TNT_SYMBOL sym: l2
# child SEQ_NEXT for node 37
# node 39: type: TNT_ARG
# child SEQ_CUR for node 39
# node 40: type: TNT_SYMBOL sym: l1
# child SEQ_NEXT for node 39
# node 41: type: TNT_ARG
# child SEQ_CUR for node 41
# node 42: type: TNT_SYMBOL sym: d

.data

  _a:
    .space 4

  _b:
    .space 1
    .align 2

  _c:
    .space 20

  _d:
    .space 10
    .align 2

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
  # |              $a1               |
  # |--------------------------------| sp+36
  # |              args              |
  # |--------------------------------| sp+32  <-- start of caller's frame
  # |               l2               |
  # |--------------------------------| sp+28
  # |               l1               |
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

  lw $t0, _a
  move $a0, $t0
  jal print_int
  lw $t0, 24($sp)
  move $a0, $t0
  jal print_int
  lb $t0, _b
  move $a0, $t0
  jal print_char
  lw $t0, 24($sp)
  move $a0, $t0
  jal print_char
  la $t0, _d
  move $a0, $t0
  jal print_string
  la $t0, _str0
  move $a0, $t0
  jal print_string
  la $t0, _c
  move $a0, $t0
  jal print_array
  lw $t0, 32($sp)
  move $a0, $t0
  jal print_array
  lw $t0, 32($sp)
  la $t1, 28($sp)
  lw $t2, 24($sp)
  la $t3, _d
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
