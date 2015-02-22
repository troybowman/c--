/* simple math */

int sum(int x, int y) { return x + y; }

void main(void)
{
  int x;
  char y[10];

  x = 1 + 2;
  x = 2 - 3;
  x = 4 * 5;
  x = 6 / 7;

  y[0] = y[1] + y[2];

  x = sum(y[4], x) / sum(150, 777);
}
