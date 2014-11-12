.data

_g0:
	.asciiz "\n"
	.align 2

_x:
	.space 4

_y:
	.space 1
	.align 2

_z:
	.space 4

_u:
	.space 1
	.align 2

.text

main:
	la $fp, 0($sp)
	# frame summary:
	#  minimum space for 4 argument values
	la $sp, -16($sp)

	li $t0, 345
	sw $t0, _x

	li $t0, 10
	sb $t0, _y

	lw $t0, _x
	lb $t1, _y
	sub $t0, $t0, $t1
	sw $t0, _x

	li $t0, 2
	mul $t0, $t0, -1
	sb $t0, _y

	lw $t0, _x
	lb $t1, _y
	add $t1, $t1, $t0
	sw $t1, _x

	lw $t0, _x
	lb $t1, _y
	div $t0, $t0, $t1
	sw $t0, _z

	lw $t0, _z
	lb $t1, _y
	mul $t1, $t1, $t0
	sb $t1, _u

	lw $a0, _x
	jal _print_int

	la $a0, _g0
	jal _print_string

	lb $a0, _y
	jal _print_int

	la $a0, _g0
	jal _print_string

	lw $a0, _z
	jal _print_int

	la $a0, _g0
	jal _print_string

	lb $a0, _u
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
