extern void printf(char format[], ...);

int strlen(char string[])
{
  int i;
  for ( i = 0; string[i] != 0; i = i + 1 );
  return i;
}

void func1(int array[], char string[], int strlen)
{
  array[2] = 5;
}

void func2(char string[])
{
  int array[10];

  func1(array, string, strlen(string));

  printf("array[2] = %d\n", array[2]);
}

void main(void)
{
  func2("hey look at me");
}
