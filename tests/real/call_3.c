/* simple nested function call */

int add(int x, int y)
{
  return x+y;
}

int two(void)
{
  return 2;
}

extern void printf(char format[], ...);

void main(void)
{
  int f;

  f = add(1, two());
  printf("%d\n", f);
}
