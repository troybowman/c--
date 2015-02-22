.data

_g0:
	.asciiz "\n"
	.align 2

_y:
	.space 40

.text

main:
	lw $fp, 0($sp)
	# frame summary:
	#   local vars: int x[10], u;
	#   minimum space for 4 argument values
	la $sp, -60($sp)

	li $t0, 1234
	la $t1, _y
	sw $t0, 28($t1)

	la $t0, _y
	lw $t1, 28($t0)
	sw $t1, -40($fp)

	lw $t0, -40($fp)
	sw $t0, -44($fp)

	lw $a0, -44($fp)
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
