/* more nested ifs */

void f1(void) {}
void f2(void) {}
void f3(void) {}
void f4(void) {}

void main(void)
{
  int x;
  if ( x == 0 )
    f1();
  else
  {
    if ( x == 2 )
      f1();
    else
      f2();
    f3();
  }
  f4();
}
