
cd $ASTROSOFT/fftw-3.3.10
./configure --prefix=$ASTROSOFT --enable-float --enable-threads --enable-shared CFLAGS=-fPIC FFLAGS=-fPIC
make check
make install
make clean

cd cfitsio-4.2.0
./configure --prefix=$ASTROSOFT CFLAGS=-fPIC FFLAGS=-fPIC
make shared
make install
make clean

cd $ASTROSOFT/psrcat_tar
source makeit
cp $ASTROSOFT/psrcat_tar/psrcat $ASTROSOFT/bin

sudo apt install -y pgplot5

cd $ASTROSOFT/tempo
./prepare
./configure F77=gfortran --prefix=$ASTROSOFT CFLAGS=-fPIC FFLAGS=-fPIC
make
make install

cd $PRESTO/src
make makewisdom
make prep
make
make clean

cd $PRESTO/python
make 
make install

cd $PRESTO
pip install .


