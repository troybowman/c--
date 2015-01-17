/*---------------------------------------------------------------------------*/
void one(int a) {}
void two(int a, int b) {}
void three(int a, int b, int c) {}
void four(int a, int b, int c, int d) {}
void five(int a, int b, int c, int d, int e) {}
void six(int a, int b, int c, int d, int e, int f) {}
void seven(int a, int b, int c, int d, int e, int f, int g) {}
void eight(int a, int b, int c, int d, int e, int f, int g, int h) {}

/*---------------------------------------------------------------------------*/
void f1a(int a, int b, int c, int d, int e, int f, int g, int h)
{
  one(1);
}

void f1b(int a, int b, int c, int d, int e, int f, int g, int h)
{
  two(1, 2);
}

void f1c(int a, int b, int c, int d, int e, int f, int g, int h)
{
  three(1, 2, 3);
}

void f1d(int a, int b, int c, int d, int e, int f, int g, int h)
{
  four(1, 2, 3, 4);
}

void f1e(int a, int b, int c, int d, int e, int f, int g, int h)
{
  five(1, 2, 3, 4, 5);
}

void f1f(int a, int b, int c, int d, int e, int f, int g, int h)
{
  six(1, 2, 3, 4, 5, 6);
}

void f1g(int a, int b, int c, int d, int e, int f, int g, int h)
{
  seven(1, 2, 3, 4, 5, 6, 7);
}

void f1h(int a, int b, int c, int d, int e, int f, int g, int h)
{
  eight(1, 2, 3, 4, 5, 6, 7, 8);
}

/*---------------------------------------------------------------------------*/
void f2a(int a, int b, int c, int d)
{
  one(1);
}

void f2b(int a, int b, int c)
{
  two(1, 2);
}

void f2c(int a, int b)
{
  three(1, 2, 3);
}

void f2d(int a)
{
  four(1, 2, 3, 4);
}

void f2e(int a, int b)
{
  five(1, 2, 3, 4, 5);
}

void f2f(int a, int b, int c)
{
  six(1, 2, 3, 4, 5, 6);
}

void f2g(int a, int b, int c, int d)
{
  seven(1, 2, 3, 4, 5, 6, 7);
}

void f2h(int a, int b, int c, int d, int e)
{
  eight(1, 2, 3, 4, 5, 6, 7, 8);
}

void main(void) {}
