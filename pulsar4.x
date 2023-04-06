cd $ASTROSOFT/sigproc
./bootstrap
./configure --prefix=$ASTROSOFT --with-cfitsio-dir=$ASTROSOFT --with-fftw-dir=$ASTROSOFT F77=gfortran CFLAGS=-fPIC FFLAGS=-fPIC CPPFLAGS=-I$ASTROSOFT/include LDFLAGS="-L$ASTROSOFT/lib -L$PGPLOT_DIR -L/usr/lib/x86_64-linux-gnu" LIBS="-lX11 -ltempo2pred -lpng"
make 
make install

cd $ASTROSOFT/sigpyproc
pip install .

cd $ASTROSOFT/gnuplot-py-1.8
pip install .

pip install pandas

#
