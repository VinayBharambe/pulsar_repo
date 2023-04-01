cd $ASTROSOFT/dedisp


cd $ASTROSOFT/psrdada

./bootstrap
./configure --prefix=$ASTROSOFT
make install



cd $ASTROSOFT/heimdall

./bootstrap
./configure --prefix=$ASTROSOFT --with-psrdada-dir=$ASTROSOFT --with-dedisp-dir=$ASTROSOFT --with-cuda-dir=/usr/local/cuda
make
make check
make install
make installcheck

cd Scripts
make install
