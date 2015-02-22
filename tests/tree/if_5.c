/* test tree for if statement body in different situations */

void main(void)
{
  if ( 3 < 4 )
    return;

  if ( 5 == 6 )
  {
    return;
  }

  if ( 7 > 8 )
  {
    return;
    return;
  }
}
