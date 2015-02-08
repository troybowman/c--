/* nested array assignents: local arrays */

extern void print_int (int n);
extern void print_string (char s[]);

void main(void)
{
  int x[2];

  int u;

  x[0] = 1;
  x[1] = 2;

  u = x[x[0]];

  print_int(u);
  print_string("\n");
}
