/* several assignments to several local arrays */

extern void printf(char format[], ...);

void main(void)
{
  int x[10], y[10];
  int u;

  x[4] = 1111;
  x[5] = 2222;
  x[6] = 3333;
  y[7] = 4444;
  y[8] = 5555;
  y[9] = 6666;

  u = x[4];
  printf("%d\n", u);
  u = x[5];
  printf("%d\n", u);
  u = x[6];
  printf("%d\n", u);
  u = y[7];
  printf("%d\n", u);
  u = y[8];
  printf("%d\n", u);
  u = y[9];
  printf("%d\n", u);

  printf("\n%d, %d, %d, %d, %d, %d\n", x[4], x[5], x[6], y[7], y[8], y[9]);
}
