/* nested array assignents: local arrays */

extern void printf(char format[], ...);

void main(void)
{
  int x[2];

  int u;

  x[0] = 1;
  x[1] = 2;

  u = x[x[0]];

  printf("%d\n", u);
}
