/* assignment: int --> char conversion: locals-->globals */

char x;

extern void printf(char format[], ...);

void main(void)
{
  int y;

  y = 123456;
  x = y;

  printf("x: %c %d\n", x, x);
  printf("y: %d %c\n", y, y);
}
