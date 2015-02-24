/* function calls: multiple parameters */

int f(int a, int b, int c, int d, int e)
{
  return a+b*(c+d*e);
}

extern void printf(char format[], ...);

void main(void)
{
  int x;

  x = f(1,2,3,4,5);
  x = f(x,x,x,x,x);

  printf("%d\n", x);
}
