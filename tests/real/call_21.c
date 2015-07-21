extern void printf(char format[], ...);

void func1(int x, int y, int z)
{
  x = -1;
  y = -1;
  z = -1;
}

void func2(int x, int y)
{
  func1(x, y, 0);
}

void func3(int x, int y, int z)
{
  func2(x, y);
  printf("z: %d\n", z);
}

void main(void)
{
  func3(5, 6, 7);
}
