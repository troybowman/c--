CC = gcc
CFLAGS = -g -Wall -O2

CFILES = lex.yy.c parser.tab.c

compile: $(CFILES)
	$(CC) $(CFLAGS) $(CFILES) -lfl -o compile

lex.yy.c : scanner.l
	flex scanner.l

parser.tab.c : parser.y traversal.c
	bison -d -v parser.y

.PHONY: clean
clean:
	/bin/rm -f compile lex.yy.c parser.tab.c *.o
