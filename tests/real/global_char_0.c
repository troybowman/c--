/* simple assignment to a global char variable */

char x;

extern void printf(char format[], ...);

void main(void)
{
  x = 'Q';
  printf("%c\n", x);
}
