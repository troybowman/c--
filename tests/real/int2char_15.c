/* assignment: char --> int conversion: local var -> local var */

extern void printf(char format[], ...);

void main(void)
{
  int x;
  char y;

  y = 'Q';
  x = y;

  printf("x: %d %c\n", x, x);
  printf("y: %c %d\n", y, y);
}
