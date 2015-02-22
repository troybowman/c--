/* assignment: int --> char conversion: global var -> global var */

int x;
char y;

extern void printf(char format[], ...);

void main(void)
{
  x = 123456;
  y = x;

  printf("x: %d %c\n", x, x);
  printf("y: %c %d\n", y, y);
}
