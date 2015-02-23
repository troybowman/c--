/* mixed for and while loops */

extern void printf(char format[], ...);

void main(void)
{
  int i, j, k, res;

  res = 0;
  for (i = 0; i < 5; i = i+1) {
    j = 0;
    while (j < 10) {
      for (k = 0; k < 15; k = k+3)
        res = res + (i+j+k)/3;
      j = j+2;
    }
  }

  printf("%d\n", res);
}
