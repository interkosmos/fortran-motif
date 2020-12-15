# fortran-motif
A collection of ISO C binding interfaces to X/Motif, to create graphical user
interfaces for Unix in Fortran 2008. Currently, *fortran-motif* is just a proof
of concept. The library includes selected bindings to Xlib, Xt, Xm, and the
[XmHTML](https://sourceforge.net/projects/xmhtml/) widget to render HTML 3.2
inside a Motif widget (optional).

## Dependencies
Either use [Motif](https://en.wikipedia.org/wiki/Motif_(software)) or
[LessTif](https://en.wikipedia.org/wiki/LessTif).

On FreeBSD, install Open Motif with:

```
# pkg install x11-toolkits/open-motif
```

On Linux, additional development headers may be required. If you want to
use the XmHTML widget, install:

```
# pkg install x11-toolkits/xmhtml
```

## Compilation
The compilation has been tested on FreeBSD 12 with Open Motif and GNU Fortran
10.  Build *fortran-motif* with the provided `Makefile` and (optional)
arguments:

```
$ make motif
```

You probably want to add the argument `PREFIX=/usr` on Linux. In order to
include bindings to the XmHTML widget, run:

```
$ make all
```

## Examples
See directory `examples/` for Motif applications written in Fortran:

* **bitmap** shows an XBM bitmap.
* **click** displays an XmPushButton widget inside an XmForm widget.

Compile a particular example with:

```
$ make <name>
```

## Licence
ISC
