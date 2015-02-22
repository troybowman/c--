extern void printf(char format[], ...);

void main(void)
{
  int x;
  char c;

  x = 66;
  c = 'a';

  printf("one: %d\n", x);
  printf("two: %c\n", c);
  printf("three: %s\n", "hello");
  printf("all together: (%d, %c, %s)\n", x, c, "hello again");
  printf("");
  printf("%s", "");
  printf("c%cc%%%d%d%%%cccc%ds%ss%c%dd\n", x, x, x, x, c, "", c, c);
}
