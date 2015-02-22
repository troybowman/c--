/* nested {} */

int main(void)
{
  int x;
  char y[50];

  {}
  {
    {
      {
        {

        }
      }
    }
  }
  {
    {
      {
        {
          if ( x == y[13] )
            return 1;
        }
      }
    }
    return 2;
  }
  { return 3; { return 4; { return 5; } } }
  if ( 3 < 4 ) {{{}}}
  else {{{ x = x; }}}
}
