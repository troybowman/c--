/* more complex expressions for array index */

int i;
int x[10];

void test(int argc, char argv[])
{
  char c;

  i = argv[0];
  argv[0] = i;

  argv[i] = 0;
  argv[i] = argv[i];

  c = 'z';
  argv[c] = x[c];

  x[0] = argv[i];
  x[argv[i]] = argv[x[i]];

  x[argv[x['a']]] = argv[x['b']];
}

