extern void printf(char format[], ...);

void main(void)
{
  int x;
  char y;
  char str[10];

  x = printf("");
  x = str[printf("hello")];
  printf(printf("wut"));

  printf(str);
  printf(str, "%d", x);

  printf("%s", x);
  printf("%d, %d, %d", "hey", "there", "fancypants");
  printf("%c", "c");

  printf("%d%c", x);

  printf("", x);
  printf("no format specifiers", "");
}
