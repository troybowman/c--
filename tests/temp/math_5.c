extern void printf(char format[], ...);

int k[64];

/*---------------------------------------------------------------------------*/
void init_k(void)
{
  k[0]  = 0x428a2f98; k[1]  = 0x71374491; k[2]  = 0xb5c0fbcf; k[3]  = 0xe9b5dba5;
  k[4]  = 0x3956c25b; k[5]  = 0x59f111f1; k[6]  = 0x923f82a4; k[7]  = 0xab1c5ed5;
  k[8]  = 0xd807aa98; k[9]  = 0x12835b01; k[10] = 0x243185be; k[11] = 0x550c7dc3;
  k[12] = 0x72be5d74; k[13] = 0x80deb1fe; k[14] = 0x9bdc06a7; k[15] = 0xc19bf174;
  k[16] = 0xe49b69c1; k[17] = 0xefbe4786; k[18] = 0x0fc19dc6; k[19] = 0x240ca1cc;
  k[20] = 0x2de92c6f; k[21] = 0x4a7484aa; k[22] = 0x5cb0a9dc; k[23] = 0x76f988da;
  k[24] = 0x983e5152; k[25] = 0xa831c66d; k[26] = 0xb00327c8; k[27] = 0xbf597fc7;
  k[28] = 0xc6e00bf3; k[29] = 0xd5a79147; k[30] = 0x06ca6351; k[31] = 0x14292967;
  k[32] = 0x27b70a85; k[33] = 0x2e1b2138; k[34] = 0x4d2c6dfc; k[35] = 0x53380d13;
  k[36] = 0x650a7354; k[37] = 0x766a0abb; k[38] = 0x81c2c92e; k[39] = 0x92722c85;
  k[40] = 0xa2bfe8a1; k[41] = 0xa81a664b; k[42] = 0xc24b8b70; k[43] = 0xc76c51a3;
  k[44] = 0xd192e819; k[45] = 0xd6990624; k[46] = 0xf40e3585; k[47] = 0x106aa070;
  k[48] = 0x19a4c116; k[49] = 0x1e376c08; k[50] = 0x2748774c; k[51] = 0x34b0bcb5;
  k[52] = 0x391c0cb3; k[53] = 0x4ed8aa4a; k[54] = 0x5b9cca4f; k[55] = 0x682e6ff3;
  k[56] = 0x748f82ee; k[57] = 0x78a5636f; k[58] = 0x84c87814; k[59] = 0x8cc70208;
  k[60] = 0x90befffa; k[61] = 0xa4506ceb; k[62] = 0xbef9a3f7; k[63] = 0xc67178f2;
}

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
  for ( i=0; i<buflen; i=i+1 )
    buf[i] = val;
}

/*---------------------------------------------------------------------------*/
/*int strlen(char string[])*/
/*{*/
  /*int i;*/
  /*for ( i = 0; string[i] != '\0'; i = i + 1 );*/
  /*return i;*/
/*}*/

/*---------------------------------------------------------------------------*/
void get_hex_str(char out[], char hash[])
{
  int i;
  char map[16];

  map[0]  = '0'; map[1]  = '1'; map[2]  = '2'; map[3]  = '3';
  map[4]  = '4'; map[5]  = '5'; map[6]  = '6'; map[7]  = '7';
  map[8]  = '8'; map[9]  = '9'; map[10] = 'a'; map[11] = 'b';
  map[12] = 'c'; map[13] = 'd'; map[14] = 'e'; map[15] = 'f';

  for ( i=0; i<32; i=i+1 )
  {
    out[2*i]   = map[(hash[i] & 0xf0) >> 4];
    out[2*i+1] = map[(hash[i] & 0x0f)];
  }

  out[64] = 0;
}

/*---------------------------------------------------------------------------*/
void sha256_transform(int state[], char block[])
{
  int a, b, c, d, e, f, g, h, i, j, t1, t2, m[64];
  int one, two, three, four;

  for ( i = 0, j = 0; i < 16; i = i + 1, j = j + 4 )
    m[i] = (block[j] << 24) | (block[j+1] << 16) | (block[j+2] << 8) | (block[j+3]);

  for ( ; i < 64; i = i + 1 )
    m[i] = sig1(m[i-2]) + m[i-7] + sig0(m[i-15]) + m[i-16];

  a = state[0];
  b = state[1];
  c = state[2];
  d = state[3];
  e = state[4];
  f = state[5];
  g = state[6];
  h = state[7];

  for ( i = 0; i < 64; i = i + 1 )
  {
    t1 = h + ep1(e) + ch(e, f, g) + k[i] + m[i];
    t2 = ep0(a) + maj(a, b, c);
    h = g;
    g = f;
    f = e;
    e = d + t1;
    d = c;
    c = b;
    b = a;
    a = t1 + t2;
  }

  state[0] = state[0] + a;
  state[1] = state[1] + b;
  state[2] = state[2] + c;
  state[3] = state[3] + d;
  state[4] = state[4] + e;
  state[5] = state[5] + f;
  state[6] = state[6] + g;
  state[7] = state[7] + h;
}

/*---------------------------------------------------------------------------*/
void sha256_init(int state[], int count[])
{
  count[0] = 0; /* block index */
  count[1] = 0; /* bit count (low part) */
  count[2] = 0; /* bit count (high part) */

  state[0] = 0x6a09e667;
  state[1] = 0xbb67ae85;
  state[2] = 0x3c6ef372;
  state[3] = 0xa54ff53a;
  state[4] = 0x510e527f;
  state[5] = 0x9b05688c;
  state[6] = 0x1f83d9ab;
  state[7] = 0x5be0cd19;
}

/*---------------------------------------------------------------------------*/
void sha256_update(int state[], char block[], int count[], char data[], int datalen)
{
  int i;

  for ( i = 0; i < datalen; i=i+1 )
  {
    block[count[0]] = data[i];
    count[0] = count[0] + 1;
    if ( count[0] == 64 )
    {
      /* update block count */
      count[1] = count[1] + 1;
      if ( count[1] == 0 )
        count[2] = count[2] + 1;
      sha256_transform(state, block);
      count[0] = 0;
    }
  }
}

/*---------------------------------------------------------------------------*/
void sha256_final(char hash[], int state[], char block[], int count[])
{
  int i, h, l;

  i = count[0];

  if ( count[0] < 56 )
  {
    block[i] = 0x80;
    i = i + 1;
    for ( ; i < 56; i = i + 1 )
      block[i] = 0x00;
  }
  else
  {
    block[i] = 0x80;
    i = i + 1;
    for ( ; i < 64; i = i + 1 )
      block[i] = 0x00;
    sha256_transform(state, block);
    memset(block, 0, 56);
  }

  /* store bit count as big-endian, 64-bit value */
  h = (count[2] << 9) | (count[1] >> 23);
  l = (count[1] << 9) | (count[0] << 3);

  block[63] = l;
  block[62] = l >> 8;
  block[61] = l >> 16;
  block[60] = l >> 24;

  block[59] = h;
  block[58] = h >> 8;
  block[57] = h >> 16;
  block[56] = h >> 24;

  sha256_transform(state, block);

	for ( i = 0; i < 4; i = i + 1)
  {
		hash[i]    = (state[0] >> (24 - i * 8)) & 0x000000ff;
		hash[i+4]  = (state[1] >> (24 - i * 8)) & 0x000000ff;
		hash[i+8]  = (state[2] >> (24 - i * 8)) & 0x000000ff;
		hash[i+12] = (state[3] >> (24 - i * 8)) & 0x000000ff;
		hash[i+16] = (state[4] >> (24 - i * 8)) & 0x000000ff;
		hash[i+20] = (state[5] >> (24 - i * 8)) & 0x000000ff;
		hash[i+24] = (state[6] >> (24 - i * 8)) & 0x000000ff;
		hash[i+28] = (state[7] >> (24 - i * 8)) & 0x000000ff;
	}
}

/*---------------------------------------------------------------------------*/
void sha256_from_str(char string[], int strlen)
{
  int state[8], count[3];
  char block[64], output[65], hash[32];

  sha256_init(state, count);
  sha256_update(state, block, count, string, strlen);
  sha256_final(hash, state, block, count);

  get_hex_str(output, hash);

  printf("input string: %s\n", string);
  printf("sha256 hash:  %s\n", output);
}

/*---------------------------------------------------------------------------*/
void phase_simple_strings(void)
{
  /*sha256_from_str("", 0);*/
  /*sha256_from_str("abc", 3);*/
  /*sha256_from_str("abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq", 56);*/
  /*sha256_from_str("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", 32);*/
  /*sha256_from_str("this is a secret message", 24);*/
  sha256_from_str("abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu", 112);
}

/*---------------------------------------------------------------------------*/
void main(void)
{
  init_k();
  phase_simple_strings();
}
