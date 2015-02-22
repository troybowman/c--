/* more complex expressions: scalar variables only */

int x, y, z;

extern void printf(char format[], ...);

void main(void)
{
  char a, b, c;

  x = 2;
  y = 3;
  z = 4;
  a = 'a'*x;
  b = a/(x+y)*z;
  c = a/(x+y)*z-a+b;

  printf("%d\n", c);
}
