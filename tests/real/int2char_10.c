/* assignment: int --> char conversion: local var -> global var */

char y;

extern void printf(char format[], ...);

void main(void)
{
  int x;

  x = 123456;
  y = x;

  printf("x: %d %c\n", x, x);
  printf("y: %c %d\n", y, y);
}
