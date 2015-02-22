.data

_g0:
	.asciiz "\n"
	.align 2

.text

main:
	la $fp, 0($sp)
	# frame summary
	#  local vars: int x[10], u;
	#  minimum space for 4 argument values
	la $sp, -60($sp)

	li $t0, 1
	sw $t0, -40($fp)

	li $t0, 2
	sw $t0, -36($fp)

	li $t0, 3
	sw $t0, -32($fp)

	li $t0, 4
	sw $t0, -28($fp)

	li $t0, 5
	sw $t0, -24($fp)

	li $t0, 6
	sw $t0, -20($fp)

	li $t0, 7
	sw $t0, -16($fp)

	li $t0, 8
	sw $t0, -12($fp)

	li $t0, 9
	sw $t0, -8($fp)

	li $t0, 10
	sw $t0, -4($fp)

	lw $t0, -40($fp)

	la $t1, -40($fp)
	sll $t0, $t0, 2
	add $t1, $t1, $t0
	lw $t0, 0($t1)

	la $t1, -40($fp)
	sll $t0, $t0, 2
	add $t1, $t1, $t0
	lw $t0, 0($t1)

	la $t1, -40($fp)
	sll $t0, $t0, 2
	add $t1, $t1, $t0
	lw $t0, 0($t1)

	la $t1, -40($fp)
	sll $t0, $t0, 2
	add $t1, $t1, $t0
	lw $t0, 0($t1)

	la $t1, -40($fp)
	sll $t0, $t0, 2
	add $t1, $t1, $t0
	lw $t0, 0($t1)

	la $t1, -40($fp)
	sll $t0, $t0, 2
	add $t1, $t1, $t0
	lw $t0, 0($t1)

	la $t1, -40($fp)
	sll $t0, $t0, 2
	add $t1, $t1, $t0
	lw $t0, 0($t1)

	la $t1, -40($fp)
	sll $t0, $t0, 2
	add $t1, $t1, $t0
	lw $t0, 0($t1)

	la $t1, -40($fp)
	sll $t0, $t0, 2
	add $t1, $t1, $t0
	lw $t0, 0($t1)

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
