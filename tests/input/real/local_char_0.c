/* simple assignment to a local char variable */

extern void printf(char format[], ...);

void main(void)
{
  char x;

  x = 'Q';
  printf("%c\n", x);
}
