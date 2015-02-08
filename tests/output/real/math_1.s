.data

_g0:
	.asciiz "\n"
	.align 2

_y:
	.space 5
	.align 2

.text

main:
	la $fp, 0($sp)
	# frame summary:
	#  local vars: int[5], u;
	#  minimum space for 4 arguments
	la $sp, -40($sp)

	li $t0, 0
	sw $t0, -20($fp)

	li $t0, 1
	sw $t0, -16($fp)

	li $t0, 2
	sw $t0, -12($fp)

	li $t0, 3
	sw $t0, -8($fp)

	li $t0, 4
	sw $t0, -4($fp)

	li $t0, 1
	la $t1, _y
	sb $t0, 0($t1)

	li $t0, 2
	la $t1, _y
	sb $t0, 1($t1)

	li $t0, 3
	la $t1, _y
	sb $t0, 2($t1)

	li $t0, 4
	la $t1, _y
	sb $t0, 3($t1)

	li $t0, 55
	la $t1, _y
	sb $t0, 4($t1)

	la $t0, -20($fp)
	
	li $t1, 2
	lw $t2, -16($fp)
	mul $t2, $t2, $t1
	
	li $t1, 1
	sub $t2, $t2, $t1
	
	sll $t2, $t2, 2
	add $t0, $t0, $t2
	lw $t2, 0($t0)

	sw $t2, -24($fp)

	lw $a0, -24($fp)
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
