/* assignment to a single local scalar variable */

extern void printf(char format[], ...);

void main(void)
{
  int x;

  x = 1234;
  printf("%d\n", x);
}
