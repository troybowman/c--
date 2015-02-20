extern void printf(char format[], ...);

void main(void)
{
  int i;
  char c;
  char str[10];

  printf("");
  printf(" ");
  printf("%");
  printf("%%%%%%%%");
  printf(" % % % % ");
  printf("%d", i);
  printf("%c", c);
  printf("%s", str);
  printf("%s", "str");
  printf("%d%c%s\n", i, c, "hello");
  printf(" %d %c %s ", i, c, str);
  printf(" % % %s % %", "blahblahblah");
}
