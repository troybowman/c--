extern void printf(char format[], ...);

void main(void)
{
  printf("%d ",  1 << 0);
  printf("%d ",  1 << 1);
  printf("%d ",  1 << 2);
  printf("%d ",  1 << 3);
  printf("%d\n", 1 << 4);

  printf("%d ",  8 >> 0);
  printf("%d ",  8 >> 1);
  printf("%d ",  8 >> 2);
  printf("%d ",  8 >> 3);
  printf("%d\n", 8 >> 4);

  printf("%d ",  (1 & 0));
  printf("%d ",  (1 & 1));
  printf("%d ",  (1 & 2));
  printf("%d ",  (1 & 3));
  printf("%d\n", (1 & 4));

  printf("%d ",  (1 | 0));
  printf("%d ",  (1 | 1));
  printf("%d ",  (1 | 2));
  printf("%d ",  (1 | 3));
  printf("%d\n", (1 | 4));

  printf("%d ",  (0 ^ 0));
  printf("%d ",  (1 ^ 0));
  printf("%d ",  (2 ^ 1));
  printf("%d ",  (3 ^ 2));
  printf("%d\n", (4 ^ 3));

  printf("%d ",  ~0);
  printf("%d ",  ~1);
  printf("%d ",  ~2);
  printf("%d ",  ~3);
  printf("%d\n", ~4);
}
