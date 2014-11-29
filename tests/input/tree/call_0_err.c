/* type consistency errors in function calls */

void func1(void);
int func2(void);

void junk(void)
{
  int x;

  not_here();
  x = func1();
  func2();
}

int bunch(int x, int y, int z);
void print_string(char string[]);

int main(char arg[])
{
  int x;
  char string[6];

  x = bunch(1, 2, arg);
  x = bunch(x, bunch(1, 2, 3), bunch(x, x, x));
  x = bunch(x, bunch(1, 2, 3), bunch(x, x, arg));
  x = bunch();
  x = bunch(arg, arg, bunch(arg, arg, bunch(arg, arg, arg)));
  x = 6;
  print_string(string);
  print_string(string[4]);
  x = bunch();
  bunch();
  bunch(1, 2);
  print_string(main);
  return 3;
}
