CC = gcc
CFLAGS = -g -Wall -O2

CFILES = lex.yy.c parser.tab.c

ifdef __MAC__
  LIBFLEX=-ll
else
  LIBFLEX=-lfl
endif

c--: $(CFILES)
	$(CC) $(CFLAGS) -o $@ $(CFILES) $(LIBFLEX)

lex.yy.c : scanner.l
	flex scanner.l

parser.tab.c : parser.y
	bison -d parser.y

.PHONY: clean
clean:
	rm -rf c--* lex.yy.c parser.tab* *.o
