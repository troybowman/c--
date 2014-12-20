/* nested call/array lookups */

int checksum0(int x) { return x; }

int checksum1(int array[]) { return array[0] + array[1] + array[2]; }

int checksum2(int array[], int idx1, int idx2, int idx3)
{
  return array[idx1] * array[idx2] / array[idx3];
}

char div(int x) { return x / 5; }

void go(int array[], char c)
{
  char s[10];
  int x[10];

  c = x[div(c)];
  x[div(c)] = c;

  c = x[div(x[div(11)])];
  x[div(x[div(22)])] = c;

  x[
    checksum0(
      checksum2(
        array, x[33], s[44], c + x[div(55)]
        )
      )
    ] =
      s[
        checksum2(
          x, checksum1(array), s[77], x[div(88)] + c
          )
        ];
}
