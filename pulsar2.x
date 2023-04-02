#!/usr/bin/bash

cd $ASTROSOFT/tempo2
./bootstrap
./configure F77=gfortran --prefix=$ASTROSOFT --with-cfitsio-dir=$ASTROSOFT --with-fftw3-dir=$ASTROSOFT CFLAGS=-fPIC FFLAGS=-fPIC CXXFLAGS="-I$ASTROSOFT/include -I$PGPLOT_DIR" LDFLAGS=-L$PGPLOT_DIR
make
make install
make plugins
make plugins−install
make unsupported
make clean


cd $ASTROSOFT/psrchive
./bootstrap
./configure F77=gfortran --prefix=$ASTROSOFT --with-cfitsio-dir=$ASTROSOFT --with-fftw3-dir=$ASTROSOFT --enable-shared CFLAGS=-fPIC FFLAGS=-fPIC
make
make install
make clean


cd $ASTROSOFT/dspsr
./bootstrap
./configure --prefix=$ASTROSOFT --with-cfitsio-dir=$ASTROSOFT F77=gfortran CFLAGS=-fPIC FFLAGS=-fPIC LDFLAGS=-L$PGPLOT_DIR
make
make install
make clean

