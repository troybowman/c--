.data

_g0:
	.asciiz "\n"
	.align 2

.text

main:
	la $fp, 0($sp)
	# frame summary
	#  local vars: int x[2], u;
	#  minimum space for 4 argument values
	la $sp, -28($sp)

	li $t0, 1
	sw $t0, -8($fp)

	li $t0, 2
	sw $t0, -4($fp)

	lw $t0, -8($fp)
	mul $t0, $t0, 4
	la $t1, -8($fp)
	add $t1, $t1, $t0
	lw $t0, 0($t1)
	sw $t0, -12($fp)

	lw $a0, -12($fp)
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
