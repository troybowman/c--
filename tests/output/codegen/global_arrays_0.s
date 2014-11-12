.data

_g0:
	.asciiz "\n"
	.align 2

_x:
	.space 40

_y:
	.space 40

_z:
	.space 40

.text

main:
	la $fp,  0($sp)
	la $sp, -4($sp)

	li $t0, 111111
	la $t1, _x
	sw $t0, 16($t1)

	li $t0, 222222
	la $t1, _x
	sw $t0, 20($t1)

	li $t0, 333333
	la $t1, _x
	sw $t0, 24($t1)

	li $t0, 444444
	la $t1, _y
	sw $t0, 28($t1)

	li $t0, 555555
	la $t1, _y
	sw $t0, 32($t1)

	li $t0, 666666
	la $t1, _y
	sw $t0, 36($t1)

	la $t0, _x
	lw $t1, 16($t0)
	sw $t1, -4($fp)

	lw $a0, -4($fp)
	jal _print_int

	la $a0, _g0
	jal _print_string

	la $t0, _x
	lw $t1, 20($t0)
	sw $t1, -4($fp)

	lw $a0, -4($fp)
	jal _print_int

	la $a0, _g0
	jal _print_string

	la $t0, _x
	lw $t1, 24($t0)
	sw $t1, -4($fp)

	lw $a0, -4($fp)
	jal _print_int

	la $a0, _g0
	jal _print_string

	la $t0, _y
	lw $t1, 28($t0)
	sw $t1, -4($fp)

	lw $a0, -4($fp)
	jal _print_int

	la $a0, _g0
	jal _print_string

	la $t0, _y
	lw $t1, 32($t0)
	sw $t1, -4($fp)

	lw $a0, -4($fp)
	jal _print_int

	la $a0, _g0
	jal _print_string

	la $t0, _y
	lw $t1, 36($t0)
	sw $t1, -4($fp)

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
