#!/bin/bash
#To determine the distribution and version fo linux installed
cat /proc/version
#To deternmine whether the required kernel is installed.
uname -r
#On Linux x86-64
#At least 4 GB of RAM
grep MemTotal /proc/meminfo
#To determine the size of the configured swap space, enter the following command:
grep SwapTotal /proc/meminfo

#Checking the Software Requirement
#Package Requirements
rpm -q --qf '%{NAME}-%{VERSION}-%{RELEASE}(%{ARCH})\n' binutils \
compat-libstdc++-33 \
elfutils-libelf \
elfutils-libelf-devel \
gcc \
gcc-c++ \
glibc \
glibc-common \
glibc-devel \
glibc-headers \
ksh \
libaio \
libaio-devel \
libgcc \
libstdc++ \
libstdc++-devel \
make \
sysstat \
unixODBC \
unixODBC-devel 

#To determine if the Oracle Inverntory group exit
grep oinstall /etc/group


