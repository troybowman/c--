/* assignment to a single global array */

int x[10];

extern void printf(char format[], ...);

void main(void)
{
  int y;

  x[7] = 3142;
  y = x[7];
  printf("%d\n", y);
}
