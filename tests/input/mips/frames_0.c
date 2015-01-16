void f0(void) {}
void f1(void) { f0(); }
void f2(int one) {}
void f3(int one) { f0(); }
void f4(int one, int two) {}
void f5(int one, int two) { f0(); }
void f7(char one, char two, int three) {}
void f8(char one, char two, int three) { f0(); }
void f9(int one, int two, int three, int four) {}
void f10(int one, int two, int three, int four) { f0(); }
void f11(int one, int two, int three, int four, int five) {}
void f12(int one[], int two[], int three[], int four[], int five[]) { f0(); }
void f14(char one, char two, char three[], char four[], char five[], char six) {}
void f15(char one, char two, char three[], char four[], char five[], char six) { f0(); }
void main(void) {}
