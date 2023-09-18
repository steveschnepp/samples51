#####################################################################
# Config
#####################################################################
CC = sdcc
CFLAGS += --stack-auto 

#####################################################################
# Rules
#####################################################################
HEADERS := $(wildcard *.h)
SRC := $(wildcard *.c)
IHX := $(SRC:.c=.ihx)

%.ihx: %.c $(HEADERS)
	 $(CC) $(CFLAGS) $(LDFLAGS) -o $@ $<

.PHONY: clean all

all: $(IHX)

clean:
	-rm -f *.asm *.ihx *.lk *.lst *.map *.mem *.rel *.rst *.sym
