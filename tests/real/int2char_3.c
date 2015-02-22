/* assignment: char --> int conversion: globals */

int x;

extern void printf(char format[], ...);

void main(void)
{
  x = 'Q';
  printf("%d %c\n", x, x);
}
