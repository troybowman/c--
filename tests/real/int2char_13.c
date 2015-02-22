/* assignment: char --> int conversion: global var -> local var */

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
