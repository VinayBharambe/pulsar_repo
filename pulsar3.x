cd $ASTROSOFT/dedisp
#Edit the Makefile.inc and add your GPU_ARCH. For eg. for me it is sm_60. Refer to the manual for more details
make INSTALL_DIR=$ASTROSOFT install

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

cd $ASTROSOFT/heimdall/Scripts
make install
