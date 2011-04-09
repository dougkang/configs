INC_DIR=include
BIN_DIR=bin
OBJ_DIR=obj
LIB_DIR=lib
SRC_DIR=src

CC=g++
CFLAGS=-O3 -I$(INC_DIR)

LIBS=

_DEPS=
DEPS=$(patsubst %,$(INC_DIR)/%,$(_DEPS))

_OBJ=
OBJ=$(patsubst %,$(OBJ_DIR)/%,$(_OBJ))

$(OBJDIR)/%.o: $(SRC_DIR)/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS) $(LIBS)

hello: $(OBJ)
	$(CC) -o $(BDIR)/$@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 
