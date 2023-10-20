
chmod +x $ASTROSOFT/install3.x

cd $ASTROSOFT && ./install3.x

sudo apt install pgplot gcc-9 curl

update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1

cd $ASTROSOFT && curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py

cd $ASTROSOFT && python2 get-pip.py

pip2 install numpy scipy pandas astropy matplotlib sympy nose ipython ipykernel

cd $ASTROSOFT && wget http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio-4.2.0.tar.gz
cd $ASTROSOFT && wget ftp://ftp.fftw.org/pub/fftw/fftw-3.3.10.tar.gz
cd $ASTROSOFT && wget http://www.atnf.csiro.au/people/pulsar/psrcat/downloads/psrcat_pkg.tar.gz
cd $ASTROSOFT && wget https://altushost-swe.dl.sourceforge.net/project/gnuplot-py/Gnuplot-py/1.8/gnuplot-py-1.8.tar.gz
cd $ASTROSOFT && wget https://codeload.github.com/swig/swig/tar.gz/refs/tags/v2.0.11
cd $ASTROSOFT && wget https://github.com/scottransom/presto/archive/refs/tags/v2.2.tar.gz

cd $ASTROSOFT && tar -xvf cfitsio-4.2.0.tar.gz
cd $ASTROSOFT && rm cfitsio-4.2.0.tar.gz
cd $ASTROSOFT && tar -xvf fftw-3.3.10.tar.gz
cd $ASTROSOFT && rm fftw-3.3.10.tar.gz
cd $ASTROSOFT && tar -xvf psrcat_pkg.tar.gz
cd $ASTROSOFT && rm psrcat_pkg.tar.gz
cd $ASTROSOFT && tar -xvf pgplot5.2.tar.gz
cd $ASTROSOFT && rm pgplot5.2.tar.gz
cd $ASTROSOFT && mv v2.0.11 swig.tar.gz
cd $ASTROSOFT && tar -xvf swig.tar.gz
cd $ASTROSOFT && rm swig.tar.gz
cd $ASTROSOFT && tar -xvf gnuplot-py-1.8.tar.gz
cd $ASTROSOFT && rm gnuplot-py-1.8.tar.gz
cd $ASTROSOFT && tar -xvf v2.2.tar.gz
cd $ASTROSOFT && rm v2.2.tar.gz
cd $ASTROSOFT && mv presto-2.2 presto

cd $ASTROSOFT && git clone https://github.com/nanograv/tempo.git
cd $ASTROSOFT && git clone https://bitbucket.org/psrsoft/tempo2.git
cd $ASTROSOFT && git clone https://git.code.sf.net/p/psrchive/code psrchive
cd $ASTROSOFT && git clone https://github.com/SixByNine/sigproc.git
cd $ASTROSOFT && git clone https://git.code.sf.net/p/dspsr/code dspsr
cd $ASTROSOFT && git clone https://github.com/ajameson/dedisp.git
cd $ASTROSOFT && git clone https://git.code.sf.net/p/psrdada/code psrdada
cd $ASTROSOFT && git clone https://git.code.sf.net/p/heimdall-astro/code heimdall
cd $ASTROSOFT && git clone https://github.com/ewanbarr/sigpyproc.git
cd $ASTROSOFT && git clone https://github.com/gajjarv/PulsarSearch.git




cd $ASTROSOFT/fftw-3.3.10 && ./configure --prefix=$ASTROSOFT --enable-float --enable-threads --enable-shared CFLAGS=-fPIC FFLAGS=-fPIC
cd $ASTROSOFT/fftw-3.3.10 && make check
cd $ASTROSOFT/fftw-3.3.10 && make install
cd $ASTROSOFT/fftw-3.3.10 && make clean


cd $ASTROSOFT/cfitsio-4.2.0 && ./configure --prefix=$ASTROSOFT CFLAGS=-fPIC FFLAGS=-fPIC
cd $ASTROSOFT/cfitsio-4.2.0 && make shared
cd $ASTROSOFT/cfitsio-4.2.0 && make install
cd $ASTROSOFT/cfitsio-4.2.0 && make clean

cd $ASTROSOFT/psrcat_tar && source makeit
cp $ASTROSOFT/psrcat_tar/psrcat $ASTROSOFT/bin


cd $ASTROSOFT/tempo && ./prepare
cd $ASTROSOFT/tempo && ./configure F77=gfortran --prefix=$ASTROSOFT CFLAGS=-fPIC FFLAGS=-fPIC
cd $ASTROSOFT/tempo && make
cd $ASTROSOFT/tempo && make install


cd $PRESTO/src && make makewisdom
cd $PRESTO/src && make prep
cd $PRESTO/src && make
cd $PRESTO/src && make clean

cd $PRESTO/python/ && make clean
cd $PRESTO/python/ && make
cd $PRESTO/python/ && make fftfit


cd $ASTROSOFT/tempo2 && ./bootstrap
cd $ASTROSOFT/tempo2 && ./configure F77=gfortran --prefix=$ASTROSOFT --with-cfitsio-dir=$ASTROSOFT --with-fftw3-dir=$ASTROSOFT CFLAGS=-fPIC FFLAGS=-fPIC CXXFLAGS="-I$ASTROSOFT/include -I$PGPLOT_DIR" LDFLAGS=-L$PGPLOT_DIR
cd $ASTROSOFT/tempo2 && make
cd $ASTROSOFT/tempo2 && make install
cd $ASTROSOFT/tempo2 && make plugins
cd $ASTROSOFT/tempo2 && make plugins−install
cd $ASTROSOFT/tempo2 && make unsupported
cd $ASTROSOFT/tempo2 && make unsupported-install


cd $ASTROSOFT/swig-2.0.11 && ./autogen.sh
cd $ASTROSOFT/swig-2.0.11 && ./configure --prefix=/content/pulsar_repo
cd $ASTROSOFT/swig-2.0.11 && make
cd $ASTROSOFT/swig-2.0.11 && make install

cd $ASTROSOFT/psrchive && ./bootstrap
cd $ASTROSOFT/psrchive && ./configure --prefix=$ASTROSOFT --with-cfitsio-dir=$ASTROSOFT F77=gfortran CFLAGS=-fPIC FFLAGS=-fPIC LDFLAGS=-L$PGPLOT_DIR

