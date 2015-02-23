/* nested for loops */

extern void printf(char format[], ...);

void main(void)
{
  int i, j, k, res;

  res = 0;
  for (i = 0; i < 5; i = i+1)
    for (j = 0; j < 10; j = j+2)
      for (k = 0; k < 15; k = k+3)
        res = res + (i+j+k)/3;

  printf("%d\n", res);
}
