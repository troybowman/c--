/* simple for loops */

extern void printf(char format[], ...);

void main(void)
{
  int i, res;

  i = 0;
  res = 0;
  for ( ; i < 10; i = i+1)
    res = res+i;

  for (i = 0; i < 10; ) {
    res = res+i;
    i = i+1;
  }

  for (i = 0; ; i = i+1) {
    res = res+i;
    if (i > 10) {
      printf("%d\n", res);
      return;
    }
  }
}
