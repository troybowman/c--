int dub(int x)  { return x * 2; }
int half(char x) { return x / 2; }

int sum(int x, char y, int z) { return x + y + z; }

int sumchars(char string[], int len)
{
  int i, sum;
  sum = 0;
  for ( i = 0; i < len; i = i + 1 )
    sum = sum + string[i];
  return sum;
}

void main(int argc, char argv[])
{
  int x[10];
  char y;

  for (;;)
    for (; 0 == 0;)
      for (;;)
        while ( x[y] == dub(y + 111) )
          while ( sumchars("abcdefg", 222) < sumchars(argv, 333) )
            for ( x[444] = dub(555)
                         + dub(666)
                         + dub(dub(sumchars("hey", 777)));

                  x[x[888]] == half(sum(y, y, y))
               && half(y) < x[y]
               || y + y * x[999] != 1000; )
            {
              while ( x[0] == 1001 )
                y = y - 1002;
            }

}
