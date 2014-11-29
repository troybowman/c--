/* simple symbol arguments */

extern void print_int(int x);
extern void print_char(char c);
extern void print_string(char str[]);
extern void print_array(int a[]);
extern void print_misc(int a[], char b[], int c, char d[]);

int a;
char b;
int c[5];
char d[10];

void main(int args[])
{
  int l1;
  char l2[4];

  print_int(a);
  print_int(l1);
  print_char(b);
  print_char(l1);

  print_string(d);
  print_string("test");

  print_array(c);
  print_array(args);
  print_misc(args, l2, l1, d);
}
