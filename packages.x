
mkdir -p /home/$USER/pulsar_repo
cd /home/$USER/pulsar_repo

wget http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio-4.2.0.tar.gz
wget ftp://ftp.fftw.org/pub/fftw/fftw-3.3.10.tar.gz
wget http://www.atnf.csiro.au/people/pulsar/psrcat/downloads/psrcat_pkg.tar.gz
wget ftp://ftp.astro.caltech.edu/pub/pgplot/pgplot5.2.tar.gz
wget https://altushost-swe.dl.sourceforge.net/project/gnuplot-py/Gnuplot-py/1.8/gnuplot-py-1.8.tar.gz
wget https://codeload.github.com/swig/swig/tar.gz/refs/tags/v2.0.11
wget https://github.com/scottransom/presto/archive/refs/tags/v2.2.tar.gz
mv v2.011 swig.tar.gz

git clone https://github.com/nanograv/tempo.git
git clone https://bitbucket.org/psrsoft/tempo2.git
git clone git://git.code.sf.net/p/psrchive/code psrchive
git clone https://github.com/SixByNine/sigproc.git
git clone git://git.code.sf.net/p/dspsr/code dspsr
git clone https://github.com/scottransom/presto.git
git clone https://github.com/ajameson/dedisp.git
git clone https://git.code.sf.net/p/psrdada/code psrdada
git clone git://git.code.sf.net/p/heimdall-astro/code heimdall
git clone https://github.com/ewanbarr/sigpyproc.git
git clone https://github.com/gajjarv/PulsarSearch.git

tar -xvf cfitsio-4.2.0.tar.gz
rm cfitsio-4.2.0.tar.gz
tar -xvf fftw-3.3.10.tar.gz
rm fftw-3.3.10.tar.gz
tar -xvf psrcat_pkg.tar.gz
rm psrcat_pkg.tar.gz
tar -xvf pgplot5.2.tar.gz
rm pgplot5.2.tar.gz
tar -xvf swig.tar.gz
rm swig.tar.gz
