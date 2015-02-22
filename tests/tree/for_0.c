/* simple for loops */

int char_at(char string[], int idx) { return string[idx]; }

void main(void)
{
  int x;

  for (;;)
    x = 1;

  for ( x = 0; x < 10; x = 5 )
    x = char_at("test", x);

  for ( ; x < 10; )
  {
    x = char_at("test", x);
    return;
  }
}
