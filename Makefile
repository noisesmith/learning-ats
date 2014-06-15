ATSHOMEQ=/usr/local

ATSCC=$(ATSHOMEQ)/bin/patscc
ATSOPT=$(ATSHOMEQ)/bin/patsopt

ATSCCFLAGS=-DATS_MEMALLOC_LIBC

%_ex: %.dats
	$(ATSCC) $(ATSCCFLAGS) $< -o $@


RMF=rm -f

clean:: ; $(RMF) *~ */*~
clean:: ; $(RMF) *ex */*ex
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
