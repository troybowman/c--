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

ifdef __MAC__
  LIBFLEX = -ll
else
  LIBFLEX = -lfl
endif

OBJFILES = $(OBJ)parser.o   $(OBJ)scanner.o $(OBJ)symbol.o   \
					 $(OBJ)treenode.o $(OBJ)ir.o 			$(OBJ)messages.o \
					 $(OBJ)main.o     $(OBJ)asm.o 		$(OBJ)printf.o

HFILES   = $(I)common.h $(I)symbol.h   $(I)treenode.h \
					 $(I)ir.h  		$(I)messages.h $(I)parser.h   \
					 $(I)asm.h 		$(I)printf.h

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

$(OBJ)printf.o: $(SRC)printf.cpp $(HFILES)
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJ)ir.o: $(SRC)ir.cpp $(HFILES)
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJ)asm.o: $(SRC)asm.cpp $(HFILES)
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJ)main.o: $(SRC)main.cpp $(HFILES)
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJ)messages.o: $(SRC)messages.cpp $(HFILES)
	$(CC) $(CFLAGS) -Wno-format-security -c -o $@ $<

#------------------------------------------------------------------------------
.PHONY: clean
clean:
	rm -rf $(BIN)c--* $(OBJ)*
