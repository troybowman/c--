/* function calls: char --> int parameter conversion, globals */

int x;
char y;

char f(int x)
{
  return x+1;
}

extern void printf(char format[], ...);

void main(void)
{
  y = 1;
  x = f(y);
  y = x+f(x);
  x = y+f('Q');

  printf("%d\n", x);
}
