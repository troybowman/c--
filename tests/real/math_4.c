/* sha256 helper functions */

extern void printf(char format[], ...);

int rotl(int a, int b) { return ((a << b) | (a >> (32-b))); }
int rotr(int a, int b) { return ((a >> b) | (a << (32-b))); }
int ch(int x, int y, int z)  { return (x & y) ^ (~x & z); }
int maj(int x, int y, int z) { return (x & y) ^ (x & z) ^ (y & z); }
int ep0(int x)  { return rotr(x, 2)  ^ rotr(x, 13) ^ rotr(x, 22); }
int ep1(int x)  { return rotr(x, 6)  ^ rotr(x, 11) ^ rotr(x, 25); }
int sig0(int x) { return rotr(x, 7)  ^ rotr(x, 18) ^ (x >> 3); }
int sig1(int x) { return rotr(x, 17) ^ rotr(x, 19) ^ (x >> 10); }

int main(void)
{
  int a, b, c, d, e;

  a = 0x00000000;
  b = 0x00000001;
  c = 0xffffffff;
  d = 0x12345678;
  e = 0x9abcdef0;

  printf("rotr: %d, %d, %d, %d\n", rotr(a, 0), rotr(a, 1), rotr(a, 18), rotr(a, 25));
  printf("rotr: %d, %d, %d, %d\n", rotr(b, 0), rotr(b, 1), rotr(b, 18), rotr(b, 25));
  printf("rotr: %d, %d, %d, %d\n", rotr(c, 0), rotr(c, 1), rotr(c, 18), rotr(c, 25));
  printf("rotr: %d, %d, %d, %d\n", rotr(d, 0), rotr(d, 1), rotr(d, 18), rotr(d, 25));
  printf("rotr: %d, %d, %d, %d\n", rotr(e, 0), rotr(e, 1), rotr(e, 18), rotr(e, 25));

  printf("rotl: %d, %d, %d, %d\n", rotl(a, 0), rotl(a, 1), rotl(a, 9), rotl(a, 16));
  printf("rotl: %d, %d, %d, %d\n", rotl(b, 0), rotl(b, 1), rotl(b, 9), rotl(b, 16));
  printf("rotl: %d, %d, %d, %d\n", rotl(c, 0), rotl(c, 1), rotl(c, 9), rotl(c, 16));
  printf("rotl: %d, %d, %d, %d\n", rotl(d, 0), rotl(d, 1), rotl(d, 9), rotl(d, 16));
  printf("rotl: %d, %d, %d, %d\n", rotl(e, 0), rotl(e, 1), rotl(e, 9), rotl(e, 16));

  printf("ch:   %d\n", ch(a, c, e));
  printf("maj:  %d\n", maj(a, c, e));

  printf("ep0:  %d, %d, %d, %d, %d\n", ep0(a),  ep0(b),  ep0(c),  ep0(d),  ep0(e));
  printf("ep1:  %d, %d, %d, %d, %d\n", ep1(a),  ep1(b),  ep1(c),  ep1(d),  ep1(e));
  printf("sig0: %d, %d, %d, %d, %d\n", sig0(a), sig0(b), sig0(c), sig0(d), sig0(e));
  printf("sig1: %d, %d, %d, %d, %d\n", sig1(a), sig1(b), sig1(c), sig1(d), sig1(e));

  return 0;
}

