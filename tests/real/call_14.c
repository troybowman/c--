/* simple procedure calls */

int y;

void acc(int x)
{
  y = y*x;
}

extern void printf(char format[], ...);

void main(void)
{
  int n, f;

  y = 1;
  for (n = 7; n > 0; n = n-1)
    acc(n);

  printf("%d\n", y);
}
