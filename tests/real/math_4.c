/* sha256 helper functions */

extern void printf(char format[], ...);

/*---------------------------------------------------------------------------*/
int rotl(int a, int b) { return ((a << b) | (a >> (32-b))); }
int rotr(int a, int b) { return ((a >> b) | (a << (32-b))); }
int ch(int x, int y, int z)  { return (x & y) ^ (~x & z); }
int maj(int x, int y, int z) { return (x & y) ^ (x & z) ^ (y & z); }
int ep0(int x)  { return rotr(x, 2)  ^ rotr(x, 13) ^ rotr(x, 22); }
int ep1(int x)  { return rotr(x, 6)  ^ rotr(x, 11) ^ rotr(x, 25); }
int sig0(int x) { return rotr(x, 7)  ^ rotr(x, 18) ^ (x >> 3); }
int sig1(int x) { return rotr(x, 17) ^ rotr(x, 19) ^ (x >> 10); }

/*---------------------------------------------------------------------------*/
void memset(char buf[], char val, int buflen)
{
  int i;
  for ( i = 0; i < buflen; i += 1 )
    buf[i] = val;
}

/*---------------------------------------------------------------------------*/
int strlen(char string[])
{
  int i;
  for ( i = 0; string[i] != 0; i += 1 );
  return i;
}

/*---------------------------------------------------------------------------*/
void get_hex_str(char out[], char hash[])
{
  int i;
  char map[16];

  map[0]  = '0'; map[1]  = '1'; map[2]  = '2'; map[3]  = '3';
  map[4]  = '4'; map[5]  = '5'; map[6]  = '6'; map[7]  = '7';
  map[8]  = '8'; map[9]  = '9'; map[10] = 'a'; map[11] = 'b';
  map[12] = 'c'; map[13] = 'd'; map[14] = 'e'; map[15] = 'f';

  for ( i = 0; i < 32; i += 1 )
  {
    out[2*i]   = map[(hash[i] & 0xf0) >> 4];
    out[2*i+1] = map[(hash[i] & 0x0f)];
  }

  out[65] = 0;
}

/*---------------------------------------------------------------------------*/
int main(void)
{
  int a, b, c, d, e;
  char hash[32], string[65];

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

  memset(hash, 'a', 32);
  get_hex_str(string, hash);
  printf("hashstr: %s\n", string);

  hash[0]  = 0x42; hash[1]  = 0x40; hash[2] =  0xfc; hash[3]  = 0x98;
  hash[4]  = 0xc9; hash[5]  = 0x95; hash[6] =  0x2e; hash[7]  = 0x2f;
  hash[8]  = 0xc2; hash[9]  = 0xe0; hash[10] = 0xe7; hash[11] = 0x63;
  hash[12] = 0xc3; hash[13] = 0x5e; hash[14] = 0x39; hash[15] = 0x91;
  hash[16] = 0x5c; hash[17] = 0x3d; hash[18] = 0xc4; hash[19] = 0x40;
  hash[20] = 0x4a; hash[21] = 0xe1; hash[22] = 0x07; hash[23] = 0x35;
  hash[24] = 0xed; hash[25] = 0xd3; hash[26] = 0xe6; hash[27] = 0x17;
  hash[28] = 0xf7; hash[29] = 0x41; hash[30] = 0x12; hash[31] = 0xa2;

  get_hex_str(string, hash);
  printf("hashstr: %s\n", string);

  printf("strlen: %d\n", strlen(""));
  printf("strlen: %d\n", strlen(string));

  return 0;
}
