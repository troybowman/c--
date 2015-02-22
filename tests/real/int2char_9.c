/* assignment: int --> char conversion: global var -> local var */

int x;

extern void printf(char format[], ...);

void main(void)
{
  char y;

  x = 123456;
  y = x;

  printf("x: %d %c\n", x, x);
  printf("y: %c %d\n", y, y);
}
