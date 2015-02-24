/* more complex recursion */

int g(int n);

int f(int n)
{
  if (n <= 1)
    return 1;
  else
    return g(n-1) + f(n-2);
}

int g(int n)
{
  if (n <= 1)
    return 1;
  else
    return f(n-1) + g(n-2);
}

extern void printf(char format[], ...);

void main(void)
{
  printf("%d\n", f(5));
}
