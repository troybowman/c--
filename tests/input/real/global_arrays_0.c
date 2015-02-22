/* several assignments to several global arrays */

int x[10], y[10], z[10];

extern void printf(char format[], ...);

void main(void)
{
  int u;

  x[4] = 111111;
  x[5] = 222222;
  x[6] = 333333;
  y[7] = 444444;
  y[8] = 555555;
  y[9] = 666666;

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
