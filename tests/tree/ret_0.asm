#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: get5
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_INTCON val: 5
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: getc
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET
# child RET_EXPR for node 2
# node 3: type: TNT_CHARCON str: 'c'
#-----------------------------------------------------------------------------
# SYNTAX TREE FOR FUNCTION: get_nothing
#-----------------------------------------------------------------------------
# node 1: type: TNT_STMT
# child SEQ_CUR for node 1
# node 2: type: TNT_RET

.data

.text

_get5:

  # |--------------------------------|

  li $t0, 5
  move $v0, $t0
  j __leave_get5

__leave_get5:
  jr $ra

_getc:

  # |--------------------------------|

  li $t0, 'c'
  move $v0, $t0
  j __leave_getc

__leave_getc:
  jr $ra

_get_nothing:

  # |--------------------------------|

  j __leave_get_nothing

__leave_get_nothing:
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
