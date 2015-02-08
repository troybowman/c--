.data

_g0:
  .asciiz "\n"
  .align 2

.text

main:
	la $fp, 0($sp)
	# local vars: int x[10], y[10], u;
	la $sp, -84($sp)

	li $t0, 1111
	sw $t0, -24($fp)

	li $t0, 2222
	sw $t0, -20($fp)

	li $t0, 3333
	sw $t0, -16($fp)

	li $t0, 4444
	sw $t0, -52($fp)

	li $t0, 5555
	sw $t0, -48($fp)

	li $t0, 6666
	sw $t0, -44($fp)

	lw $t0, -24($fp)
	sw $t0, -84($fp)

	lw $a0, -84($fp)
	jal _print_int

	la $a0, _g0
	jal _print_string

	lw $t0, -20($fp)
	sw $t0, -84($fp)

	lw $a0, -84($fp)
	jal _print_int

	la $a0, _g0
	jal _print_string

	lw $t0, -16($fp)
	sw $t0, -84($fp)

	lw $a0, -84($fp)
	jal _print_int

	la $a0, _g0
	jal _print_string

	lw $t0, -52($fp)
	sw $t0, -84($fp)

	lw $a0, -84($fp)
	jal _print_int

	la $a0, _g0
	jal _print_string

	lw $t0, -48($fp)
	sw $t0, -84($fp)

	lw $a0, -84($fp)
	jal _print_int

	la $a0, _g0
	jal _print_string

	lw $t0, -44($fp)
	sw $t0, -84($fp)

	lw $a0, -84($fp)
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
