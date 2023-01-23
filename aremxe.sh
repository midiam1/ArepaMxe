#!/bin/bash

# Guión para compilar ArepaCoin
# 012023

# Gracias a Elpidio Moreno

# Actualizo todo todito

sudo apt -y update

# Creamos una memoria de intercambio [ Swap File ] para no
# tener errores al compilar .
clear

sudo dd if =/dev/zero of=/swapfile bs=1024 count=1048576
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile 
sudo echo /swapfile swap swap defaults 0 0 >> /etc/fstab

# Instalo las dependencias que me permitirán compilar MXE

sudo apt-get -y install p7zip-full autoconf automake autopoint bash bison bzip2 cmake flex gettext git g++ gperf intltool libffi-dev libtool libltdl-dev libssl-dev libxml-parser-perl make openssl patch perl pkg-config python ruby scons sed unzip wget xz-utils
sudo apt-get -y install g++-multilib libc6-dev-i386

# Clone mxe desde el repositorio, al descargar crea el directorio
# desde donde vamos a trabajar

cd /mnt
sudo git clone https://github.com/mxe/mxe.git

# Compilamos boost y Qt5

cd /mnt/mxe
sudo make MXE_TARGETS="i686-w64-mingw32.static" boost
sudo make MXE_TARGETS="i686-w64-mingw32.static" qttools



