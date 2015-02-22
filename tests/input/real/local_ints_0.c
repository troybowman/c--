/* assignments to several local scalar variables */

extern void printf(char format[], ...);

void main(void)
{
  int x, y, z, u, v;

  x = 111;
  y = 222;
  z = 333;
  u = 444;
  v = 555;

  printf("%d\n%d\n%d\n%d\n%d\n",
          x, y, z, u, v);
}
