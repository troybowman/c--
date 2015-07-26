/* assignments to several local chars */

extern void printf(char format[], ...);

void main(void)
{
  char x, y, z;

  x = 'A';
  y = 'B';
  z = 'C';

  printf("%c %c %c\n", x, y, z);
}
