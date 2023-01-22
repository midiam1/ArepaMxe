#!/bin/bash

# Actualizo todo todito

sudo apt -y update

# Instalo las dependencias que me permitirán compilar MXE

sudo apt-get install p7zip-full autoconf automake autopoint bash bison bzip2 cmake flex gettext git g++ gperf intltool libffi-dev libtool libltdl-dev libssl-dev libxml-parser-perl make openssl patch perl pkg-config python ruby scons sed unzip wget xz-utils
