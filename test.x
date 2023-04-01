#!/usr/bin/bash

mkdir -p /home/$USER/Public
cd /home/$USER/Public

wget http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio-4.2.0.tar.gz
wget ftp://ftp.fftw.org/pub/fftw/fftw-3.3.10.tar.gz
wget http://www.atnf.csiro.au/people/pulsar/psrcat/downloads/psrcat_pkg.tar.gz
wget ftp://ftp.astro.caltech.edu/pub/pgplot/pgplot5.2.tar.gz
git clone https://github.com/nanograv/tempo.git
git clone https://bitbucket.org/psrsoft/tempo2.git
git clone git://git.code.sf.net/p/psrchive/code psrchive
git clone https://github.com/SixByNine/sigproc.git
git clone git://git.code.sf.net/p/dspsr/code dspsr
git clone https://github.com/scottransom/presto.git
git clone https://github.com/npat−efault/ppgplot.git

tar -xvf cfitsio-4.2.0.tar.gz
rm cfitsio-4.2.0.tar.gz
tar -xvf fftw-3.3.10.tar.gz
rm fftw-3.3.10.tar.gz
tar -xvf psrcat_pkg.tar.gz
rm psrcat_pkg.tar.gz
tar -xvf pgplot5.2.tar.gz
rm pgplot5.2.tar.gz
