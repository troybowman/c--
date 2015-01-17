int f0(void) { return 0; }

void f1(void)
{
  int x;
  /* should all be handled with temporary registers */
  x = 1 + (2 + (3 + (4 + (5 + (6 + (7 + (8 + 9)))))));
}

void f2(void)
{
  int x;
  /* make the compiler run out of temporary registers */
  x = 1 + (2 + (3 + (4 + (5 + (6 + (7 + (8 + (9 + 10))))))));
}

void f3(void)
{
  int x;
  /* should all be handled with saved registers */
  x = f0() + (f0() + (f0() + (f0() + (f0() + (f0() + (f0() + (f0() + f0())))))));
}

void f4(void)
{
  int x;
  /* make the compiler run out of saved registers */
  x = f0() + (f0() + (f0() + (f0() + (f0() + (f0() + (f0() + (f0() + (f0() + f0()))))))));
}

void f5(void)
{
  int x;
  /* go nuts */
  x = f0() +
      (f0() +
       (f0() +
        (f0() +
         (f0() +
          (f0() +
           (f0() +
            (f0() +
             (f0() +
              (f0() +
               (f0() +
                (f0() +
                 (f0() +
                  (f0() +
                   (f0() +
                    (f0())))))))))))))));
  x = 1 +
      (2 +
       (3 +
        (4 +
         (5 +
          (6 +
           (7 +
            (8 +
             (9 +
              (10 +
               (11 +
                (12 +
                 (13 +
                  (14 +
                   (15))))))))))))));
}

void main(void) {}
