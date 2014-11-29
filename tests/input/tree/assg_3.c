/* assign symbols to other symbols */

int one;

int main(char x, char y)
{
  char z;

  one = x;
  one = y;
  x = one;
  y = y;

  z = one;
  one = z;
  y = z;
}
