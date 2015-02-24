/* simple recursion */

int fact(int n)
{
  if (n == 0)
    return 1;
  else
    return n*fact(n-1);
}

extern void printf(char format[], ...);

void main(void)
{
  printf("%d\n", fact(7));
}
