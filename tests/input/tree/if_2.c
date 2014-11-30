/* more complex if conditions */

int boring(int x) { return x; }

void main(void)
{
  int x;
  char s[10];

  if ( 3 < 4 && 5 < 6) {}

  if ( !(3 < x) ) {}

  if ( x > 0 && x != s[x] ) {}

  else if ( (s[0] == s[1])
         || (s[1] == s[2])
         && (s[2] != x) ) {}

  else if ( !(boring(0) < boring(1)
           && boring(2) < boring(3)
           && x == boring(4)) ) {}
}
