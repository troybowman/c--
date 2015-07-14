extern void printf(char format[], ...);

void main(void)
{
  int a, b, c;

  printf("%d ",  0x0);
  printf("%d ",  0xA);
  printf("%d ",  0x16);
  printf("%d ",  0x12345678);
  printf("%d\n", 0x0000ABCD);

  printf("%d\n", 0x1234 + 0x5678);
  printf("%d\n", 0x9101 + 0x1121);

  a = 0x1111;
  b = 0x2222;
  c = 0x3333;

  printf("%d\n", a * b - c);

  printf("%d\n", -a);
  printf("%d\n", -b);
}
