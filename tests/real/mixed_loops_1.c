/* mixed for loops, while loops, and conditionals */

extern void printf(char format[], ...);

void main(void)
{
  int i, j, k, a, b;
  int res;

  res = 123;
  for (i = 0; i < 5; i = i+1) {
    j = 0;
    while (j < 5) {
      k = (i+j)/2;
      if (k > i) {
        for (a = 0; a < 5; a = a+1) {
          b = (a+k)/2;
          if (b > j)
            res = res + b;
          else
            res = res + k;
        }
      }
      j = j+1;
    }
  }

  printf("%d\n", res);
}
