/* nested function calls */

int x[5];
char y[5];

/*---------------------------------------------------------------------------*/
int x_at(int idx) { return x[idx]; }

/*---------------------------------------------------------------------------*/
char y_at(int idx) { return y[idx]; }

/*---------------------------------------------------------------------------*/
char char_at(char string[], int idx)
{
  return string[idx];
}

/*---------------------------------------------------------------------------*/
extern void set_x(int x1, int x2, int x3, int x4, int x5);

/*---------------------------------------------------------------------------*/
extern void print_int(int x);

/*---------------------------------------------------------------------------*/
void main(void)
{
  int local;

  local = x_at(1);
  local = x_at(x_at(local));
  local = x_at(y_at(x_at(char_at("hello", 4))));

  set_x(
    x_at(local),
    y_at(x_at(3)),
    'a',
    char_at("test1", char_at("test2", x_at(char_at("test3", local)))),
    8675309);
}
