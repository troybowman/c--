/* type consistency errors in assignments */

char x[4];
int y[5];

extern void print_int(int x);

void func1(void)
{
  x = 6;
}

void main(int args[])
{
  int x;
  x = 6;
  x = main;
  x = print_int;
  y[3] = y[3];
  main = x;
  args = args;
  print_int = 4;
  y[3] = x;
  x = args;
  x = y;
  y[6] = y[6];
  y[6] = y;
  y[main] = 4;
  y[y] = 4;
}
