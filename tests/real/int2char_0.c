/* assignment: int --> char conversion: globals */

char x;

extern void printf(char format[], ...);

void main(void)
{
  x = 123;
  printf("%c %d\n", x, x);
}
