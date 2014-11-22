CC = g++

I = ./include/
SRC = ./src/
BIN = ./bin/
OBJ = ./obj/

CFLAGS = -I$(I)

ifndef NDEBUG
  CFLAGS += -g -Wall
else
  CFLAGS += -O2 -DNDEBUG
endif

ifdef __MAC__
  LIBFLEX = -ll
else
  LIBFLEX = -lfl
endif

OBJFILES = $(OBJ)parser.o $(OBJ)scanner.o $(OBJ)symbol.o $(OBJ)treenode.o $(OBJ)messages.o
HFILES   = $(I)symbol.h $(I)treenode.h $(I)messages.h

#------------------------------------------------------------------------------
$(BIN)c--: $(OBJFILES)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBFLEX)

#------------------------------------------------------------------------------
$(OBJ)parser.o: $(OBJ)parser.cpp
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJ)parser.cpp: $(SRC)parser.y $(HFILES)
	bison -o $@ -d -v $<

#------------------------------------------------------------------------------
$(OBJ)scanner.o: $(OBJ)scanner.cpp
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJ)scanner.cpp: $(SRC)scanner.l $(HFILES)
	flex -o $@ $<

#------------------------------------------------------------------------------
$(OBJ)symbol.o: $(SRC)symbol.cpp $(HFILES)
	$(CC) $(CFLAGS) -Wno-varargs -c -o $@ $<

$(OBJ)treenode.o: $(SRC)treenode.cpp $(HFILES)
	$(CC) $(CFLAGS) -Wno-varargs -c -o $@ $<

$(OBJ)messages.o: $(SRC)messages.cpp $(HFILES)
	$(CC) $(CFLAGS) -c -o $@ $<

#------------------------------------------------------------------------------
.PHONY: clean
clean:
	rm -rf $(BIN)c--* $(OBJ)*
