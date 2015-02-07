extern void print_int(int x);

char char_at(char string[], int idx) { return string[idx]; }

char L0(char string[]) { return char_at(string, 0); }
char L2(char string[]) { return char_at(string, 2); }
char L4(char string[]) { return char_at(string, 4); }

char str1;
char str3;
char str5;

void main(void)
{
  str1 = L0("test one");
  str3 = L2("test two");
  str5 = L4("test three");
  if ( str1 < str3 )
    print_int(str1);
  else if ( str5 == 16 )
    print_int(str3);
  else
    print_int(str5);
}
