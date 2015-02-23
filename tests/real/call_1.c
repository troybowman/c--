/* a sequence of function calls */

int add(int x, int y)
{
  return x+y;
}

extern void printf(char format[], ...);

void main(void)
{
  int a, b, c, d, e;
  int i, f;

  f = 1;
  for (i = 7; i > 0; i = i-1)
  {
    a = add(i, 0);
    printf("a is now: %d\n", a);
    b = add(a, 1);
    printf("b is now: %d\n", b);
    c = add(2, b);
    printf("c is now: %d\n", c);
    d = add(c, -5);
    printf("d is now: %d\n", d);
    e = add(d, 1);
    printf("e is now: %d\n", e);
    f = f*add(e, 1);
    printf("f is now: %d\n", f);
  }

  printf("%d\n", f);
}
