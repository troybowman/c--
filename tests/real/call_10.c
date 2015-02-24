/* function calls: side effects on globals */

int x;

int f(int i)
{
  int y;

  y = 1;
  while (i > 0) {
    x = x*i;
    y = 2*y;
    i = i-1;
  }
  return y;
}

extern void printf(char format[], ...);

void main(void)
{
  int a;

  x = 1;
  a = f(6);
  x = a+x;

  printf("%d\n", x);
}
