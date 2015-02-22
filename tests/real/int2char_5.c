/* assignment: char --> int conversion: locals-->globals */

int x;

extern void printf(char format[], ...);

void main(void)
{
  char y;

  y = 'Q';
  x = y;

  printf("x: %d %c\n", x, x);
  printf("y: %c %d\n", y, y);
}
