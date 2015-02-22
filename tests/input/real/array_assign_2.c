/* array assignments: local --> local */

extern void printf(char format[], ...);

void main(void)
{
  int x[10];
  int y[10];
  int u;

  y[7] = 1234;
  x[0] = y[7];
  u = x[0];
  printf("%d\n", u);
}
