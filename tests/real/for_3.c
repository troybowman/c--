extern void printf(char format[], ...);

void main(void)
{
  int i, j;
  char a1[5], a2[17];

  a1[0] = 'h'; a1[1] = 'e'; a1[2] = 'l'; a1[3] = 'l'; a1[4] = 'o';

  a2[0]  = 'w'; a2[1]  = 'X'; a2[2]  = 'X'; a2[3]  = 'X';
  a2[4]  = 'o'; a2[5]  = 'X'; a2[6]  = 'X'; a2[7]  = 'X';
  a2[8]  = 'r'; a2[9]  = 'X'; a2[10] = 'X'; a2[11] = 'X';
  a2[12] = 'l'; a2[13] = 'X'; a2[14] = 'X'; a2[15] = 'X';
  a2[16] = 'd';

  for ( i=0, j=0; i<5 && j<17; i=i+1, j=j+4 )
    printf("%c %c\n", a1[i], a2[j]);
}
