.POSIX:
.SUFFIXES:

CC      = gcc
FC      = gfortran
AR      = ar
PREFIX  = /usr/local
DEBUG   = # -ggdb3 -O0

FFLAGS  = $(DEBUG) -Wall -Wno-unused-dummy-argument -std=f2008 -fmax-errors=1 -fcheck=all
LDFLAGS = -I$(PREFIX)/include/ -L$(PREFIX)/lib/
LDLIBS  = -lXm -lXt -lX11
ARFLAGS = -cr

XLIB    = xlib.o
XT      = xt.o
XM      = xm.o
XMHTML  = xmhtml.o
TARGET  = libfortran-motif.a

BITMAP  = examples/bitmap/bitmap
CLICK   = examples/click/click
WWW     = examples/www/www

.PHONY: all bitmap clean click www xmhtml

all: $(XLIB) $(XM) $(XT) $(XMHTML)
	$(AR) $(ARFLAGS) $(TARGET) xlib.o xm.o xt.o xmhtml.o

motif: $(XLIB) $(XM) $(XT)
	$(AR) $(ARFLAGS) $(TARGET) xlib.o xm.o xt.o

# Modules.
$(XLIB):
	$(FC) $(FFLAGS) -c src/x11/xlib.f90

$(XM):
	$(FC) $(FFLAGS) -c src/xm/xm.f90

$(XT):
	$(FC) $(FFLAGS) -c src/xt/xt.f90

$(XMHTML):
	$(FC) $(FFLAGS) -c src/xmhtml/xmhtml.f90

# Examples.
bitmap: motif
	$(FC) $(FFLAGS) $(LDFLAGS) -o $(BITMAP) $(BITMAP).f90 $(TARGET) $(LDLIBS) -lXpm

click: motif
	$(FC) $(FFLAGS) $(LDFLAGS) -o $(CLICK) $(CLICK).f90 $(TARGET) $(LDLIBS)

www: all
	$(FC) $(FFLAGS) $(LDFLAGS) -o $(WWW) $(WWW).f90 $(TARGET) $(LDLIBS) -lXpm -lXmHTML

clean:
	rm *.mod *.o *.a
	if [ -e $(BITMAP) ]; then rm $(BITMAP); fi
	if [ -e $(CLICK) ]; then rm $(CLICK); fi
	if [ -e $(WWW) ]; then rm $(WWW); fi
