/* assignment: char --> int conversion: global var -> global var */

int x;
char y;

extern void printf(char format[], ...);

void main(void)
{
  y = 'Q';
  x = y;

  printf("x: %d %c\n", x, x);
  printf("y: %c %d\n", y, y);
}
