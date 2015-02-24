/* function calls: recursion on array params */

int sum(char x[], int i)
{
  if (x[i] == 0)
    return 0;
  else
    return x[i] + sum(x, i+1);
}

extern void printf(char format[], ...);

void main(void)
{
  int x;

  x = sum("hello world", 0);
  printf("%d\n", x);
}
