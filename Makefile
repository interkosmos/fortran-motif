.POSIX:
.SUFFIXES:

FC       = gfortran
AR       = ar
PREFIX   = /usr/local
DEBUG    = # -ggdb3 -O0

FFLAGS   = $(DEBUG) -Wall -Wno-unused-dummy-argument -std=f2008 -fmax-errors=1 -fcheck=all
LDFLAGS  = -I$(PREFIX)/include/ -L$(PREFIX)/lib/
LDLIBS   = -lXm -lXt -lX11 -lXpm
ARFLAGS  = -cr

XLIB     = xlib.o
XT       = xt.o
XM       = xm.o
TARGET   = libfortran-motif.a

BITMAP   = examples/bitmap/bitmap
CLICK    = examples/click/click

.PHONY: all bitmap clean click

all: $(XLIB) $(XM) $(XT)
	$(AR) $(ARFLAGS) $(TARGET) xlib.o xm.o xt.o

$(XLIB):
	$(FC) $(FFLAGS) -c src/x11/xlib.f90

$(XM):
	$(FC) $(FFLAGS) -c src/xm/xm.f90

$(XT):
	$(FC) $(FFLAGS) -c src/xt/xt.f90

bitmap: $(XLIB) $(XM) $(XT)
	$(FC) $(FFLAGS) $(LDFLAGS) -o $(BITMAP) $(BITMAP).f90 $(XLIB) $(XM) $(XT) $(LDLIBS)

click: $(XLIB) $(XM) $(XT)
	$(FC) $(FFLAGS) $(LDFLAGS) -o $(CLICK) $(CLICK).f90 $(XLIB) $(XM) $(XT) $(LDLIBS)

clean:
	rm *.mod *.o
	rm $(TARGET)
	rm $(BITMAP)
	rm $(CLICK)
