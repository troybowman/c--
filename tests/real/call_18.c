/* global arrays and functions */

int x[10];

int id(int x)
{
  return x;
}

extern void printf(char format[], ...);

void main(void)
{
  int i;
  int res;

  for (i = 0; i < 10; i = i+1)
    x[i] = i;

  res = x[id(x[id(x[id(x[id(5)])])])];
  x[id(x[id(x[id(x[id(0)+1]+1)+1]+1)+1]+1)+1] = res+1;
  res = x[id(x[id(x[id(x[id(0)+1]+1)+1]+1)+1]+1)+1];

  printf("%d\n", res);
}
