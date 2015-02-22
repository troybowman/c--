/* assignments to several global chars */

char x, y, z;

extern void printf(char format[], ...);

void main(void)
{
  x = 'A';
  y = 'B';
  z = 'C';

  printf("%c %c %c\n", x, y, z);
}
