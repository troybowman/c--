/* function calls in complex expressions */

int half(int x) { return x / 2; }

void main(void)
{
  int x;

  x = 1 + half(2);
  x = 3 + half(4) + half(5) + half(6) + half(7);
  x = half(8)+ (half(9) + (half(10) + (half(11))));
  x = ((((half(12)) + half(13))) + half(14)) + half(15);
}
