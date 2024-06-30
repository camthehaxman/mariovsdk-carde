CC ?= gcc

CFLAGS = -Wall -Wextra -Werror -std=c11 -O2

.PHONY: all clean

SRCS = lvlcksum.c

ifeq ($(OS),Windows_NT)
EXE := .exe
else
EXE :=
endif

all: lvlcksum$(EXE)
	@:

lvlcksum$(EXE): $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $@ $(LDFLAGS)

clean:
	$(RM) lvlcksum lvlcksum.exe
