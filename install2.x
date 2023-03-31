gparted
w3m

psrcat-installation
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt update
sudo apt install gcc-9
sudo apt install g++-9 // not needed for psrcat

cd psrcat_tar
nano makeit
change /usr/local/gcc to /usr/local/gcc-9
source makeit
cp psrcat $ASTROSOFT/bin

sudo apt install pgplot5


psrchive
 remove -enable shared

presto 
 make makewisdom
 make prep
 make 
 make install

cd presto 
pip install .

sudo apt install python-is-python3

CUDA
follow the page instractions...

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.0.1/local_installers/cuda-repo-ubuntu2204-12-0-local_12.0.1-525.85.12-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-12-0-local_12.0.1-525.85.12-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-12-0-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda

sudo apt-get install nvidia-gds

## set the path variable in $PATH= /usr/local/cuda/bin

BOOST

sudo apt install libboost-all-dev


DEDISP

nvcc --help
 (search for a supported value of --gpu-code)
Eg. sm_60

edit Makefile.inc

GPU_ARCH = sm_60

INSTALL_DIR = $(ASTROSOFT)

make

make install

---------
PSRDADA

sudo apt install librdmacm-dev

./bootstrap
./configure --prefix=$ASTROSOFT
make install

---------

heimdall

./bootstrap
./configure --prefix=$ASTROSOFT --with-psrdada-dir=$ASTROSOFT --with-dedisp-dir=$ASTROSOFT --with-cuda-dir=/usr/local/cuda
make
make check
make install
make installcheck

cd Scripts
make install
