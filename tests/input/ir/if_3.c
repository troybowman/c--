/* more nested ifs */

int f1(void) { return 1; }
int f2(void) { return 2; }
int f3(void) { return 3; }

void main(void)
{
  int x;

  if ( x == 1 )
    if ( x == 2 )
      if ( x == 3 )
        if ( x == 4 )
          if ( x == 5 )
          {
            if ( x == 6 )
              if ( x == 7 )
                if ( x == 8 )
                  x = f1();
            x = f2();
          }
          else
          {
            if ( x == 9 )
              if ( x == 10 )
                if ( x == 11 )
                  x = f1();
            x = f2();
          }

  x = f3();
}
