.data

_g0:
	.asciiz "\n"
	.align 2

_x:
	.space 40

_y:
	.space 40

.text

main:
	la $fp, 0($sp)
	# local var: int u;
	la $sp -4($sp)

	li $t0, 1234
	la $t1, _y
	sw $t0, 28($t1)

	la $t0, _y
	lw $t1, 28($t0)
	la $t0, _x
	sw $t1, 0($t0)

	la $t0, _x
	lw $t1, 0($t0)
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
