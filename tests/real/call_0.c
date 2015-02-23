/* simple function calls */

int id(int x)
{
  return x;
}

extern void printf(char format[], ...);

void main(void)
{
  int n, f;

  f = 1;
  for (n = 7; n > 0; n = n-1)
    f = id(n)*f;

  printf("%d\n", f);
}
