/* errors in array indices */

int x[5];
char y[4];

int x_at(int idx) { return x[idx]; }

char y_at(int idx) { return y[idx]; }

char char_at(char string[], int idx, char x)
{
  return string[idx];
}

extern void sum(int x, int y, int z);

void main(void)
{
  x[0] = x[x_at(0)];
  x[x_at(0)] = x[0];

  y[x[x_at(y_at(char_at("test", 0)))]] = 'x';

  x[
    sum(
      x_at(1, 1),
      y_at(0, 2),
      char_at("I...", 7))
   ]   =  y[char_at("AM THE ONE WHO KNOCKS", 1)];

  x[
    sum(
      x_at(1),
      y_at(0),
      char_at("I...", 7, x[4]))
   ]   =  y[char_at("AM THE ONE WHO KNOCKS", 1)];
}
