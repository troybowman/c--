/* simple constant arguments */

extern void print_string(char str[]);
extern void print_strings(
    char str1[],
    char str2[],
    char str3[],
    char str4[]);
extern void print_int(int x);
extern void print_ints(int x, int y, int z);
extern void print_misc(char one[], char two, char three[], int four);

void main(void)
{
  print_string("hello");
  print_int(5);
  print_int('x');
  print_strings("one", "two", "three", "four");
  print_ints(1, 2, '3');
  print_misc("one", '2', "three", 4);
}
