extern void printf(char format[], ...);

void main(void)
{
  int x, a[3];

  x = 1;

  x += 1;
  printf("x: %d\n", x);
  x -= 1;
  printf("x: %d\n", x);
  x *= 3;
  printf("x: %d\n", x);
  x /= 3;
  printf("x: %d\n", x);

  a[0] = 0x00; a[1] = 0x00; a[2] = 0xff;

  printf("a: %d, %d, %d\n", a[0], a[1], a[2]);

  a[0] &= 0xff;
  a[1] |= 0xff;
  a[2] ^= 0x2b;

  printf("a: %d, %d, %d\n", a[0], a[1], a[2]);
}
