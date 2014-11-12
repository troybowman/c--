.data

_g0:
	.asciiz "\n"
	.align 2

.text

main:
	la $fp, 0($sp)
	# frame summary:
	#  local vars: int x[10], y[10], u;
	#  minimum space for 4 argument values
	la $sp, -100($sp)

	li $t0, 1234
	sw $t0, -52($fp)

	lw $t0, -52($fp)
	sw $t0, -40($fp)

	lw $t0, -40($fp)
	sw $t0, -100($fp)

	lw $a0, -100($fp)
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
