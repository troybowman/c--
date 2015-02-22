/* simple arithmetic expressions: scalar variables only */

int x;
char y;
int z;
char u;

extern void printf(char format[], ...);

void main(void)
{
  x = 345;
  y = 10;
  x = x-y;
  y = -2;
  x = x+y;
  z = x/y;
  u = z*y;

  printf("%d %d %d %d\n", x, y, z, u);
}
