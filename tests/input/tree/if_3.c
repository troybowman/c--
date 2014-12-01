/* nested ! and () */

int getint(void) { return 4; }
void nest(void)
{
  int x[10];
  char y;

  if ( ((( y == 6 ))) ) {}

  else if ( !!!(x[10] < 3) ) {}

  else if ( !(!(!(!(((((y == 6)))))))) ) {}

  if ( y < 4 && y > 5 && y == 6 && y == 7 ) {}

  if ( y < 4 && (y > 5 && (y == 6 && !(y == 7))) ) {}
}
