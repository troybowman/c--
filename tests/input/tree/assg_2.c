int x[6];

int func1(void)
{
  x[0] = 1; x[1] = 2; x[2] = 3;
  x[3] = 4; x[4] = 5; x[5] = 6;
}

void main(char x[])
{
  x[0] = 'h';
  x[1] = 'e';
  x[2] = 'l';
  x[3] = 'l';
  x[4] = 'o';
}
