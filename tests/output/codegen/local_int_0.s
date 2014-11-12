.data

_g0:
  .asciiz "\n"
  .align 2

.text

main:
	la $fp,  0($sp)
	la $sp, -4($sp)

  li $t0, 1234
  sw $t0, -4($fp)

  lw $a0, -4($fp)
  jal _print_int

  la $a0, _g0
  jal _print_string

__leavemain:
  li $v0, 10
  syscall

_print_int:
  li $v0, 1
  syscall
  jr $ra

_print_string:
  li $v0, 4
  syscall
  jr $ra
