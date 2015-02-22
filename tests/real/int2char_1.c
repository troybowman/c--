/* assignment: int --> char conversion: locals */

extern void printf(char format[], ...);

void main(void)
{
  char x;

  x = 123;
  printf("%c %d\n", x, x);
}
