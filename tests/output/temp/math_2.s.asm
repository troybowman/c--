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
	la $fp, 0($sp)
	# frame sumarry:
	#  local vars: char a, b, c; (4 bytes each)
	#  four argument values
	la $fp, -28($sp)
	
	li $t0, 2
	sw $t0, _x
	
	li $t0, 3
	sw $t0, _y
	
	li $t0, 4
	sw $t0, _z
	
	li $t0, 'a'
	lw $t1, _x
	mul $t1, $t1, $t0
	sb $t1, -4($fp)
	
	# a
	lb $t0, -4($fp)
	
	# (x+y)
	lw $t1, _x
	lw $t2, _y
	add $t2, $t2, $t1
	
	# z
	lw $t3, _z
	
	# (x+y)*z
	mul $t2, $t2, $t3
	
	# a/(x+y)*z
	div $t0, $t0, $t3
	
	# b = a/(x+y)*z
	sb $t0, -8($fp)
	
	# a
	lb $t0, -4($fp)
	
	# (x+y)
	lw $t1, _x
	lw $t2, _y
	add $t2, $t2, $t1
	
	# z
	lw $t3, _z
	
	# (x+y)*z
	mul $t2, $t2, $t3
	
	# a/(x+y)*z
	div $t0, $t0, $t3
	
	# a
	lw $t1, -4($fp)
	# b
	lw $t3, -8($fp)
	# a + b
	add $t1, $t1, $t3
	# a/(x+y)*z-a+b
	sub $t0, $t0, $t1
	
	# c = a/(x+y)*x-a+b
	sb $t0, -12($fp)
	
	lb $a0, -12($fp)
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