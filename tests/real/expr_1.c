extern void printf(char format[], ...);

int id(int x) { return x; }

void sum(int a, int b, int c, int d, int e,
         int f, int g, int h, int i, int j,
         int k, int l, int m, int n, int o,
         int p, int q, int r, int s, int t)
{
  printf("sum: %d\n", a+b+c+d+e+f+g+h+i+j+k+l+m+n+o+p+q+r+s+t);
}

void main(void)
{
  int x;
  int y[5];
  char z;

  x = 1;
  y[0] = 0;
  y[1] = 1;
  y[2] = 2;
  y[3] = 3;
  y[4] = 4;
  z = 'b';

  sum(1, 2, 3, 4, 5,
      x, x*x, x+x+x, id(x)/x, id(y[3]),
      id(y[3])+id(y[3]), z/z/z, x+z, x*id(z), y[3]+y[3]+y[3],
      y[y[y[x]]], y[y[x]]*id(y[4]), id(id(id(y[id(2)]))), x+z, y[x]);
}
