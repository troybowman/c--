/* recursive procedures */

int u;

void f(char s[], int n)
{
  if (s[n] == 0)
    return;
  else {
    u = u+s[n];
    f(s, n+1);
  }
}

extern void printf(char format[], ...);

void main(void)
{
  f("hello world", 0);
  printf("%d\n", u);
}
