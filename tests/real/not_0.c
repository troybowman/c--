/* simple not operator */

extern void printf(char format[], ...);

int main(void)
{
  int x, y;

  x = 5;
  y = 6;

  if ( !(x == y) )
    printf("this should print\n");

  if ( x < y && !(x != x) )
    printf("this should also print\n");

  if ( !(x != y && y == y) )
    printf("this shouldn't print\n");

  if ( !!!!(x == 5) )
    printf("finally, this should print\n");

  return 0;
}
