
#PATH TO THE MAIN PULSAR SOFTWARE DIRECTORY
export ASTROSOFT=/home/pulsar/pulsar_repo

#OSTYPE
export OSTYPE=linux

#PSRCAT
export PSRCAT_RUNDIR=$ASTROSOFT/psrcat_tar
export PSRCAT_FILE=$ASTROSOFT/psrcat_tar/psrcat.db

#TEMPO
export TEMPO=$ASTROSOFT/tempo

#TEMPO2
export TEMPO2=$ASTROSOFT/tempo2/T2runtime

# PGPLOT
export PGPLOT_DIR=/usr/lib/pgplot5
export PGPLOT_DEV=/xwindow


#PRESTO
export PRESTO=$ASTROSOFT/presto


#LD_LIBRARY PATH
export LD_LIBRARY_PATH=/usr/lib:/usr/lib/x64_64-linux-gnu:$PGPLOT_DIR:$ASTROSOFT/lib:$PRESTO/lib:$PRESTO/lib64:


#PATH
export PATH=$PATH:$ASTROSOFT/bin:$PRESTO/bin:$PGPLOT_DIR:$PRESTO/python:$ASTROSOFT/bin/psrchive:/bin:/sbin:/usr/sbin:/usr/local/sbin:/home/pulsar/.local/bin


export PKG_CONFIG_PATH=$ASTROSOFT/cfitsio-4.2.0
