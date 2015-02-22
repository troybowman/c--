/* function calls in expressions */

char c;

int get5(void) { return 5; }

char getc(void) { return 'c'; }

extern void print_int(int x);

int main(void)
{
  int x;

  x = get5();
  c = getc();

  c = get5();
  x = getc();

  print_int(get5());
  print_int(getc());

  return 0;
}
