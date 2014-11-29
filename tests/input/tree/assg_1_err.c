/* syntax errors in more complex assignments */

int main(int argc, char argv[])
{
  int x;
  char y;

  argv 0 = 1;
  argv[0] = 2;
  argv[=] = 2;
  argv[] = x;

  x = [3];

  argv = argv[4:5];

  x = argv[y[argv[y[_]]]];
  x = argv[y[argv[y[]]]];

  argv[4,5] = 4;
  argv[argv[argv['a']]] = 3;
  argv[argv[argv[]] = 2;
  argv[5 = 3;
  argv[5] = 3;
  argc = argv = x;
  x = 'd';
}
