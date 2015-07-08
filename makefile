CC = g++

I   = ./include/
SRC = ./src/

CFLAGS += -I$(I)

ifndef NDEBUG
  CFLAGS += -g -Wall
  BIN = ./bin/debug/
  OBJ = ./obj/debug/
else
  CFLAGS += -O2 -DNDEBUG
  BIN = ./bin/release/
  OBJ = ./obj/release/
endif

# We require bison 3.0, but xcode is still stuck on bison 2.3.
# So on mac we use the homebrew versions of flex and bison, which are up to date.
# 'brew install flex' and 'brew install bison' should do the trick.
ifdef __MAC__
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

OBJFILES = $(OBJ)parser.o $(OBJ)scanner.o $(OBJ)symbol.o $(OBJ)treenode.o\
 $(OBJ)ir.o $(OBJ)logger.o $(OBJ)main.o $(OBJ)asm.o

HFILES = $(I)common.h $(I)symbol.h $(I)treenode.h $(I)ir.h\
 $(I)logger.h $(I)parser.h $(I)asm.h

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
	$(CC) $(IFLEX) $(CFLAGS) -c -o $@ $<

$(OBJ)scanner.o: $(OBJ)scanner.cpp
	$(CC) $(IFLEX) $(CFLAGS) -c -o $@ $<

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
	rm -rf $(BIN)c--* $(OBJ)*
