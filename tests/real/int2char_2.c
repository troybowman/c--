/* assignment: char --> int conversion: locals */

extern void printf(char format[], ...);

void main(void)
{
  int x;

  x = 'Q';
  printf("%d %c\n", x, x);
}

