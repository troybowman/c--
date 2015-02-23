/* nested while loops */

int a, b, c, d, e, LIM;
int res;

extern void printf(char format[], ...);

void main(void)
{
  a = 0; LIM = 3;
  res = 0;

  while (a < LIM)
  {
    b = 0;
    while (b < LIM)
    {
      c = 0;
      while (c < LIM)
      {
	      d = 0;
	      while (d < LIM)
        {
	        e = 0;
	        while (e < LIM)
          {
	          res = res + 1;
	          e = e+1;
	        }
	        d = d+1;
	      }
	      c = c+1;
      }
      b = b+1;
    }
    a = a+1;
  }

  printf("%d\n", res);
}
