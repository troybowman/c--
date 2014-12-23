/* same as if_0, but with brackets */

void f1(void) {}
void f2(void) {}
void f3(void) {}
void f4(void) {}
void f5(void) {}
void f6(void) {}
void f7(void) {}
void f8(void) {}
void f9(void) {}

void main(void)
{
  if ( 111 < 222 ) { f1(); }

  if ( 333 == 444 ) { f2(); }
  else { f3(); }

  if ( 555 != 666 )
    f4();
  else
  {
    if ( 777 >= 888 )
      f5();
    else
    {
      if ( 999 <= 1000 )
        f6();
      else
      {
        f7();
      }
    }
  }

  if ( 1001 == 1002 )
    f8();
  else
  {
    if ( 1003 != 1004 )
      f9();
  }
}
