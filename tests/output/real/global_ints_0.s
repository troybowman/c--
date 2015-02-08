.data

_g0:
	.asciiz "\n"
	.align 2

_x:
	.space 4

_y:
	.space 4

_z:
	.space 4

.text

main:
	li $t0, 13579
	sw $t0, _x

	li $t0, 24680
	sw $t0, _y

	li $t0, 21436
	sw $t0, _z

	lw $a0, _x
	jal _print_int

	la $a0, _g0
	jal _print_string

	lw $a0, _y
	jal _print_int

	la $a0, _g0
	jal _print_string

	lw $a0, _z
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
