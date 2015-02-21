extern void printf(char format[], ...);

void main(void)
{
  int x;
  char c;

  x = 1;
  c = 'a';

  printf("one: %d\n", x);
  printf("two: %c\n", c);
  printf("three %s\n", "hello");

  printf("all together: (%d, %c, %s)\n",
          x, c, "hello again");
}
