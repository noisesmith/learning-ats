ATSHOMEQ=/usr/local

ATSCC=$(ATSHOMEQ)/bin/patscc
ATSOPT=$(ATSHOMEQ)/bin/patsopt

CFLAGS=-lportaudio -Wall -lm -lrt -lasound -ljack -lpthread 

ATSCCFLAGS=$(CFLAGS) -DATS_MEMALLOC_LIBC

pink: pink.dats
	$(ATSCC)  pink.dats -o pink $(ATSCCFLAGS)

pink_c: pink.c
	gcc  pink.c -o pink_c $(CFLAGS)
