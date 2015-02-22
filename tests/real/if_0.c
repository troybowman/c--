/* simple conditionals */

extern void printf(char format[], ...);

void main(void)
{
  int x, y, res1, res2;

  if (1 > 0)
    res1 = 1111;
  else
    res1 = 2222;
  x = 1;
  y = -1;
  if (x > y)
    res2 = 3333;
  else
    res2 = 4444;

  printf("%d %d\n", res1, res2);
}
