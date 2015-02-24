/* function calls: int --> char parameter conversion */

int x;

char f(char x)
{
  return x+1;
}

extern void printf(char format[], ...);

void main(void)
{
  x = 12345;
  x = f(x);
  x = x+f(x);

  printf("%d\n", x);
}
