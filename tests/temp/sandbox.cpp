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

int main()
{
  int x[4];
  fuckyou_t a[5][6][7];
  fuckyou_t *p = a[1][2];

  a[2][*(x+1)][x[x[5]]].x = 5;

  (a+a[1][2][3].x)[0][1][1].y = 10;

  ***(((a+4-x[0])[100]+x[x[0]])[1][0]).z->b += 'a';

  return 0;
}
