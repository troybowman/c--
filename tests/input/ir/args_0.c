/* simple function arguments */

int right_back(int x) { return x; }
int num_at(int array[], int idx) { return array[idx]; }
char char_at(char string[], int idx) { return string[idx]; }

void bunch(char one[],
           int two[],
           char three,
           int four,
           int five[],
           int six,
           int seven,
           char eight,
           char nine[],
           char ten) {}

void blip(int x) {}

int gint;
char gchar;

void stuff(void)
{
  int larray[500];
  int lint;

  gint = right_back(5);
  gint = right_back('a');
  lint = num_at(larray, 6);
  gchar = char_at("hello", 16);
  bunch("one", larray, '3', 4, larray, 6, 7, '8', "nine", 10);
  blip(500000);
}
