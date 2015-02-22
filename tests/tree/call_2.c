/* more complex function arguments */

int x[10];

extern void print_int(int x);
extern void print_misc(int x, char y, int z, char end[]);

void main(char argc, char argv[])
{
  char y[5];

  print_int(y[3]);
  print_int(y[x[y[argc]]]);
  print_misc(y[0], x[1], x[y[1]], "test");
}
