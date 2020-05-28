.POSIX:
.SUFFIXES:

FC      = gfortran
PREFIX  = /usr/local
DEBUG   = # -ggdb3 -O0

FFLAGS  = $(DEBUG) -Wall -std=f2008 -fmax-errors=1 -fcheck=all -Wno-unused-dummy-argument
LDFLAGS = -I$(PREFIX)/include/ -L$(PREFIX)/lib/
LDLIBS  = -lXm -lXt -lX11 -lXpm

XLIB    = xlib
XT      = xt
XM      = xm

CLICK   = click

.PHONY: all clean $(CLICK) $(XLIB) $(XM) $(XT)

all: $(XLIB) $(XM) $(XT)

$(XLIB):
	$(FC) $(FFLAGS) -c src/x11/xlib.f90

$(XM):
	$(FC) $(FFLAGS) -c src/xm/xm.f90

$(XT):
	$(FC) $(FFLAGS) -c src/xt/xt.f90

$(CLICK): $(XLIB) $(XM) $(XT)
	$(FC) $(FFLAGS) $(LDFLAGS) -o click examples/click/click.f90 xlib.o xm.o xt.o $(LDLIBS)

clean:
	rm *.mod *.o
	rm $(CLICK)
