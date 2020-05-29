# fortran-motif
A collection of ISO C binding interfaces to X/Motif, to create graphical user
interfaces for Unix in Fortran 2008. Currently, `fortran-motif` is just a proof
of concept.

## Dependencies
The interfaces require either [Motif](https://en.wikipedia.org/wiki/Motif_(software))
or [LessTif](https://en.wikipedia.org/wiki/LessTif).

On FreeBSD, install Open Motif with:

```
# pkg install x11-toolkits/open-motif
```

On Linux, you may have to install additional development headers.

## Compilation
The compilation has been tested on FreeBSD 12 with Open Motif and GNU Fortran 9.
Build `fortran-motif` with the provided `Makefile` and (optional) arguments:

```
$ make
```

You probably want to set the argument `PREFIX=/usr` on Linux.

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
