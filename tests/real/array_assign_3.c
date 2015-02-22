/* array assignments: local --> global */

int x[10];

extern void printf(char format[], ...);

void main(void)
{
  int y[10];
  int u;

  y[7] = 1234;
  x[0] = y[7];
  u = x[0];

  printf("%d\n", u);
}
