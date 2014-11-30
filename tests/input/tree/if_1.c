/* if statments that are syntactically different but functionally equivalent */

void main(int arg)
{
  int x;
  if ( arg == 1 )
    x = 'a';
  else if ( arg == 2 )
    x = 'b';
  else if ( arg == 3 )
    x = 'c';
  else
    x = 'z';

  if ( arg == 1 )
    x = 'a';
  else
  {
    if ( arg == 2 )
      x = 'b';
    else
    {
      if ( arg == 3 )
        x = 'c';
      else
      {
        x = 'z';
      }
    }
  }

}
