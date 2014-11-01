CC = g++
CFLAGS = -g -Wall -O2

PARSER_CPP = parser.cpp
SCANNER_CPP = scanner.cpp

CPPFILES = $(PARSER_CPP) $(SCANNER_CPP)

ifdef __MAC__
  LIBFLEX=-ll
else
  LIBFLEX=-lfl
endif

c--: $(CPPFILES)
	$(CC) $(CFLAGS) -o $@ $(CPPFILES) $(LIBFLEX)

$(SCANNER_CPP): scanner.l
	flex -o $@ scanner.l

$(PARSER_CPP): parser.y
	bison -o $@ -d -v parser.y

.PHONY: clean
clean:
	rm -rf c--* $(PARSER_CPP) $(SCANNER_CPP) parser.tab* *.o parser.output
