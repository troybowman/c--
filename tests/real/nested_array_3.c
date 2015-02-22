/* nested array assignents: global arrays */

int x[10];

extern void printf(char format[], ...);

void main(void)
{
  int u;

  x[0] = 1;
  x[1] = 2;
  x[2] = 3;
  x[3] = 4;
  x[4] = 5;
  x[5] = 6;
  x[6] = 7;
  x[7] = 8;
  x[8] = 9;
  x[9] = 10;

  u = x[x[x[x[x[x[x[x[x[x[0]]]]]]]]]];

  printf("%d %d\n", u, x[x[x[x[x[2]]]]]);
}
