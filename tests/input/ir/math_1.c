/* test arithmetic expression grouping */

void main(void)
{
  int x1, x2, x3, x4, x5, x6;

  x1 = 1 + 2 + 3 + 4;

  x2 = (1 + 2) + (3 + 4);

  x3 = 1 + (2 + (3 + (4)));

  x4 = (((1) + 2) + 3) + 4;

  x5 = 1 + 2 / 3 * 4 - 5;

  x6 = (1 + 2) / (3 * 4) - 5;
}
