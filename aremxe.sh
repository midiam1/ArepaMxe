#!/bin/bash

# Guión para compilar ArepaCoin
# Probado en x32
# 012023

# Gracias a Elpidio Moreno

# Varias librerías fueron descargadas de https://fossies.org/

# Actualizo todo todito

apt -y update

# Creamos una memoria de intercambio [ Swap File ] para no
# tener errores al compilar .
clear

dd if =/dev/zero of=/swapfile bs=1024 count=1048576
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile 
echo /swapfile swap swap defaults 0 0 >> /etc/fstab

clear
swapon -s
free -h

# Instalo herramientas de red
sudo apt install net-tools -y

# Instalación webmin ------------------------------------------------------------------

# Agrego unas dependencias
sudo apt-get install software-properties-common apt-transport-https wget -y
# importa la Webmin GPG key
sudo wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -
# Agrego el repositorio
sudo add-apt-repository "deb [arch=amd64] http://download.webmin.com/download/repository sarge contrib"
# Instalo Webmin
sudo apt-get install webmin -y

# --------------------------------------------------------------------------------------



# Instalo las dependencias que me permitirán compilar MXE, vamos a trabajar con sudo su

apt-get -y install p7zip-full autoconf automake autopoint bash bison bzip2 cmake flex gettext git g++ gperf intltool libffi-dev libtool libltdl-dev libssl-dev libxml-parser-perl make openssl patch perl pkg-config python ruby scons sed unzip wget xz-utils
apt-get -y install g++-multilib libc6-dev-i386
apt get -y install lzip
apt-get -y install python-mako
apt-get -y install libgtk2.0-dev
apt-get -y install python-pip
apt -y update

# Clone mxe desde el repositorio, al descargar crea el directorio
# desde donde vamos a trabajar

cd /mnt
git clone https://github.com/mxe/mxe.git

# Compilamos boost y Qt5

cd /mnt/mxe
make MXE_TARGETS="i686-w64-mingw32.static" boost
make MXE_TARGETS="i686-w64-mingw32.static" qttools



