/* assignment: int --> char conversion: local var -> local var */

extern void printf(char format[], ...);

void main(void)
{
  int x;
  char y;

  x = 123456;
  y = x;

  printf("x: %d %c\n", x, x);
  printf("y: %c %d\n", y, y);
}
