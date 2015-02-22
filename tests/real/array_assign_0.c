/* array assignments: global --> global */

int x[10];
int y[10];

extern void printf(char format[], ...);

void main(void)
{
  int u;

  y[7] = 1234;
  x[0] = y[7];
  u = x[0];
  printf("%d\n", u);
}
