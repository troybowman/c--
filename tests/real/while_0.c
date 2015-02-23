/* simple while loop */

int i;

extern void printf(char format[], ...);

void main(void)
{
  i = 0;
  while ( i < 100 )
  {
    printf("%d\n", i);
    i = i+i+1;
  }
}
