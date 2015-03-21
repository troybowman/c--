
.data

.text

main:
  la $sp, -0($sp)


__leavemain:
  la $sp, 0($sp)
  jr $ra
