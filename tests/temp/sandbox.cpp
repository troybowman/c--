struct thing_t
{
  char a;
  char ***b;
};

struct fuckyou_t
{
  int x;
  int y;
  thing_t *z;
};

struct another_t;

fuckyou_t func() { fuckyou_t blah; return blah; }

int *func2(int *x) { return x; }

void func3(int **x) { return; }

int main()
{
  int x[4], y, z, *d;
  another_t *blah;
  int *ptr;

  fuckyou_t a[5][6][7];
  fuckyou_t *p = a[1][2];

  ptr = x;
  (ptr + 2)[0] = 3;

  a[2][*(x+1)][x[x[5]]].x = 5;

  (a+a[1][2][3].x)[0][1][1].y = 10;

  ***(((a+4-x[0])[100]+x[x[0]])[1][0]).z->b += 'a';

  // must catch:
  //func().x = 4;
  //blah += 4;
  //x[ptr] = 4;
  //ptr = 3;
  //ptr = 'a';
  //func3(&x);
  //ptr = &(x+2);

  *ptr = *ptr;
  *ptr += *ptr;

  ptr += ptr;

  int **ptr2;
  **ptr2 = 4;
  **ptr2 += **ptr2;

  *func2(&y) = 4;
  ptr = x;

  z = *&y;
  d = &*ptr;

  ptr = x;
  ptr += 4;
  ptr += 'a';

  return 0;
}
