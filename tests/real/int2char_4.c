/* assignment: char --> int conversion: globals-->locals */

char y;

extern void printf(char format[], ...);

void main(void)
{
  int x;

  y = 'Q';
  x = y;

  printf("x: %d %c\n", x, x);
  printf("y: %c %d\n", y, y);
}

