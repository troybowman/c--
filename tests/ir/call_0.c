/* simple function calls */

void empty1(void) {}
void empty2(void) { return; }

int gimme5(void) { return 5; }

void main(void)
{
  int x;

  empty1();
  empty2();
  x = gimme5();
}
