/* assignment: char --> int conversion: local var -> global var */

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
