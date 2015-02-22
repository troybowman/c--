/* more complex return expressions */

int x[5];

int func1(int argc, char argv[])
{
  char y, z;
  return 0;
  return x[5];
  return argc;
  return argv[0];
  return argv[x[argv[z]]];
}

void func2(void)
{
  return;
  return;
  x[0] = 5;
  return;
}
