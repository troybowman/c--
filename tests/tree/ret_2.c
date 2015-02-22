/* errors in return statements */

int getint(void) {}

void getnothing(void) { return something; }

int at(int array[], int idx) { return array; }

int main(void)
{
  int x[4];
  return;
  return at(x, 4);
  return x;
  return at;
  return x();
}
