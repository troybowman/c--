/* assignment to a single local array */

extern void printf(char format[], ...);

void main(void)
{
  int x[10];
  int y;

  x[5] = 4321;
  y = x[5];
  printf("%d\n", y);
}
