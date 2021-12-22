#  Makefile for CCSR libraries
#

include	../Mkinclude

DIR	      = sysdep

FFLAGS 	      = $(STDFFLAGS) -I$(INCDIR) 

CFLAGS        = $(STDCFLAGS) -I$(INCDIR)

CPPFLAGS       = $(STDCPPFLAGS) $(CPPOPT)-I$(INCDIR) 

EXTHDRS	      = 

HDRS	      =

MAKEFILE      = Makefile

OBJS	      = y$(SYSTEM).o $(SYSLIBINC)

SRCS	      = y$(SYSTEM).F 

SRCS_ALL      = y$(SYSTEM).F 

all: lib

lib:	$(OBJS) yy$(SYSTEM).c
		$(CC) -c yy$(SYSTEM).c
		$(AR) $(LIBRARY) $(OBJS)
		$(RANLIB) $(LIBRARY)

clean:
		$(RM) *.o *~ core *.trace *.f *.html

index:
		@$(INDEX) $(HDRS) $(SRCS)

tags:
		@$(TAGS) $(HDRS) $(SRCS)

pack: $(SRCS:.F=.ftr)

ftr: $(SRCS:.F=.ftr)

rmftr:
	$(RM) $(FTRFILE)

sublist: 
	egrep '( SUBROU| ENTRY  )' $(SRCS) /dev/null | $(AWK) -f ../../sh/util/sublist dir=$(DIR) | sort > SUBLIST

html: $(SRCS:.F=.html)


###
