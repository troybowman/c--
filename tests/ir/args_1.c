/* nested function calls */

int sum(int x, int y) { return x + y; }
int diff(int x, int y) { return x - y; }
int dub(int x) { return x * 2; }

void lots(int one, int two, int three, int four, int five) {}

int x;

void main(void)
{
  char y[5];

  x = sum(dub(333), dub(444));
  lots(dub(555), sum(666, x), diff(x, x), dub(y[777]), diff(y[888], y[999]));
  y[4] = dub(dub(dub(dub(diff(1000, 1001)))));
}
