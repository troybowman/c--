/* assignment: int --> char conversion: globals-->locals */

int y;

extern void printf(char format[], ...);

void main(void)
{
  char x;

  y = 123456;
  x = y;

  printf("x: %c %d\n", x, x);
  printf("y: %d %c\n", y, y);
}
