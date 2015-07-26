/* assignments to a number of global scalars */

int x, y, z;

extern void printf(char format[], ...);

void main(void)
{
  x = 13579;
  y = 24680;
  z = 21436;
  printf("%d\n%d\n%d\n", x, y, z);
}
