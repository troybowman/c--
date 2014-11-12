.data

_g0:
  .asciiz "\n"
  .align 2

.text

main:
  la $fp, 0($sp)
  # 5 local ints
  la $sp, -20($sp)

  li $t0, 111
  sw $t0,	-4($fp)

  li $t0, 222
  sw $t0, -8($fp)

  li $t0, 333
  sw $t0, -12($fp)

  li, $t0, 444
  sw $t0, -16($fp)

  li $t0, 555
  sw $t0, -20($fp)

  lw $a0, -4($fp)
  jal _print_int

  la $a0, _g0
  jal _print_string

  lw $a0, -8($fp)
  jal _print_int

  la $a0, _g0
  jal _print_string

  lw $a0, -12($fp)
  jal _print_int

  la $a0, _g0
  jal _print_string

  lw $a0, -16($fp)
  jal _print_int

  la $a0, _g0
  jal _print_string

  lw $a0, -20($fp)
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
