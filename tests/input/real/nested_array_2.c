/* nested array assignments: mixed global/local, int/char arrays */

char y[5];

extern void printf(char format[], ...);

void main(void)
{
  int x[5];

  x[0] = 0;  y[0] = 1;
  x[1] = 1;  y[1] = 2;
  x[2] = 2;  y[2] = 3;
  x[3] = 3;  y[3] = 4;
  x[4] = 4;  y[4] = 55;

  printf("%d\n", y[x[y[x[y[x[y[x[y[x[0]]]]]]]]]]);
}
