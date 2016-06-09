CC = g++
CFLAGS += -g

ifndef NDEBUG
  B=dbg
else
  B=opt
  CFLAGS += -O3 -DNDEBUG
endif

BIN = ./bin/$(B)/
OBJ = ./obj/$(B)/
SRC = ./src/

ifdef __MAC__
	# We require bison 3.0, but Xcode is still stuck on bison 2.3.
	# So on mac we use the homebrew versions of flex and bison, which are up to date.
	# 'brew install flex' and 'brew install bison' should do the trick.
  FLEXDIR  = /usr/local/opt/flex/
  BISONDIR = /usr/local/opt/bison/
  IFLEX = -I$(FLEXDIR)include
  LFLEX = -L$(FLEXDIR)lib
  FLEX = $(FLEXDIR)bin/flex
  BISON = $(BISONDIR)bin/bison
else
  FLEX  = flex
  BISON = bison
endif

OBJFILES = $(OBJ)parser.o $(OBJ)scanner.o $(OBJ)symbol.o $(OBJ)treenode.o \
 $(OBJ)ir.o $(OBJ)asm.o $(OBJ)main.o $(OBJ)logger.o

HFILES = $(SRC)common.h $(SRC)symbol.h $(SRC)treenode.h $(SRC)ir.h \
 $(SRC)logger.h $(SRC)parser.h $(SRC)asm.h

#------------------------------------------------------------------------------
$(BIN)c--: $(OBJ)parser.cpp $(OBJ)scanner.cpp $(OBJFILES)
	$(CC) $(CFLAGS) -o $@ $(OBJFILES) $(LFLEX) -lfl

#------------------------------------------------------------------------------
$(OBJ)parser.cpp: $(SRC)parser.y $(HFILES)
	$(BISON) -o $@ -d -v $<

$(OBJ)scanner.cpp: $(SRC)scanner.l $(HFILES)
	$(FLEX) --header-file=$(OBJ)scanner.hpp -o $@ $<

#------------------------------------------------------------------------------
$(OBJ)parser.o: $(OBJ)parser.cpp
	$(CC) $(IFLEX) -I$(SRC) $(CFLAGS) -c -o $@ $<

$(OBJ)scanner.o: $(OBJ)scanner.cpp
	$(CC) $(IFLEX) -I$(SRC) $(CFLAGS) -c -o $@ $<

$(OBJ)symbol.o: $(SRC)symbol.cpp $(HFILES)
	$(CC) $(CFLAGS) -Wno-varargs -c -o $@ $<

$(OBJ)treenode.o: $(SRC)treenode.cpp $(HFILES)
	$(CC) $(CFLAGS) -Wno-varargs -c -o $@ $<

$(OBJ)ir.o: $(SRC)ir.cpp $(HFILES)
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJ)asm.o: $(SRC)asm.cpp $(HFILES)
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJ)main.o: $(SRC)main.cpp $(HFILES)
	$(CC) $(CFLAGS) -Wno-format-security -c -o $@ $<

$(OBJ)logger.o: $(SRC)logger.cpp $(HFILES)
	$(CC) $(CFLAGS) -c -o $@ $<

#------------------------------------------------------------------------------
.PHONY: clean
clean:
	rm -rf bin/*/c--* obj/*/*
