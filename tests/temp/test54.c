/* a sequence of function calls */

int add(int x, int y)
{
  return x+y;
}

extern void print_int (int n);
extern void print_string (char s[]);

void main(void)
{
  int a, b, c, d, e;
  int i, f;

  f = 1;
  for (i = 7; i > 0; i = i-1) {
    a = add(i, 0);
    print_string("a is now: ");
    print_int(a);
    print_string("\n");
    b = add(a, 1);
    print_string("b is now: ");
    print_int(b);
    print_string("\n");
    c = add(2, b);
    print_string("c is now: ");
    print_int(c);
    print_string("\n");
    d = add(c, -5);
    print_string("d is now: ");
    print_int(d);
    print_string("\n");
    e = add(d, 1);
    print_string("e is now: ");
    print_int(e);
    print_string("\n");
    f = f*add(e, 1);
    print_string("f is now: ");
    print_int(f);
    print_string("\n");
  }
  print_int(f);
  print_string("\n");  
}
