/* ambiguous else */

int main(void)
{
  int x;
  if ( x == 4 )
    if ( x == 5 )
      if ( x == 6 )
        return 7;
  else
    return 8;

  if ( x == 9 )
    if ( x == 10 )
    {
      if ( x == 11 )
        if ( x == 12 )
          return 13;
        else if ( x == 14 )
          return 15;
        else return 16;
    }
  else return 17;
}
