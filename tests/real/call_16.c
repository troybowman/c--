/* mixed function and procedure calls */

int u;

void incr(int x);

int f(int u)
{
  if (u == 0)
    return 1;
  else {
    incr(u);
    return f(u-1);
  }
}

void incr(int x)
{
  u = x+u;
}

extern void printf(char format[], ...);

void main(void)
{
  int x;

  u = 1;
  x = f(6);
  x = u+x;

  printf("%d\n", x);
}
