#! /bin/sh
############################
#
#author:xiongchuanliang
#create date:2012-12-25
#desc: Oracle 11g for Linux
############################
######################################
DATE=`date +%Y+%m+%d`
mkdir /bak
#Creating Required Operating System Groups and Users
groupadd -g 507 oinstall
groupadd -g 502 dba
groupadd -g 503 oper
groupadd -g 504 asmadmin
groupadd -g 505 asmoper
groupadd -g 506 asmdba
useradd -g oinstall -G dba,asmdba,oper -d /home/oracle oracle
useradd -g oinstall -G asmadmin,asmdba,asmoper,oper,dba grid
id oracle
id grid
passwd oracle
passwd grid
######################################
mkdir -p /u01/app/grid
mkdir -p /u01/app/crs_base
mkdir -p /u01/app/crs_home
mkdir -p /u01/app/oracle/product/11.2.0/db_1
chown -R oracle:oinstall /u01/app/oracle
chown -R grid:oinstall /u01/app/crs*
chown -R grid:oinstall /u01/app/grid
mkdir -p /u01/app/oraInventory
chown -R grid:oinstall /u01/app/oraInventory
chmod -R 775 /u01/
ls -al /u01
######################################
#CheckResource Limits for the Oracle Software Installation Users
yes|cp /etc/security/limits.conf /bak/bak_limits.conf
#Installation Owner Resource Limit Recommended Ranges
echo "#xcl "${DATE} >> /etc/security/limits.conf
echo "oracle soft nproc 2047" >> /etc/security/limits.conf
echo "oracle hard nproc 16384" >> /etc/security/limits.conf
echo "oracle soft nofile 1024" >> /etc/security/limits.conf
echo "oracle hard nofile 65536" >> /etc/security/limits.conf
###########
#aio
yes|cp /proc/sys/fs/aio-max-nr /bak/aio-max-nr
echo > /proc/sys/fs/aio-max-nr 1048576
###########
#Configuring Kernel Parameters for Linux
yes|cp /etc/sysctl.conf /bak/sysctl.conf
echo " ########### " >> /etc/sysctl.conf
echo "#xcl "${DATE} >> /etc/sysctl.conf
echo "fs.aio-max-nr = 1048576" >> /etc/sysctl.conf
echo "fs.file-max = 6815744" >> /etc/sysctl.conf
echo "kernel.shmall = 2097152" >> /etc/sysctl.conf
echo "kernel.shmmax = 536870912" >> /etc/sysctl.conf
echo "kernel.shmmni = 4096" >> /etc/sysctl.conf
echo "kernel.sem = 250 32000 100 128" >> /etc/sysctl.conf
echo "net.ipv4.ip_local_port_range = 1024 65000" >> /etc/sysctl.conf
echo "net.core.rmem_default=262144" >> /etc/sysctl.conf
echo "net.core.rmem_max=262144" >> /etc/sysctl.conf
echo "net.core.wmem_default=262144" >> /etc/sysctl.conf
echo "net.core.wmem_max=262144" >> /etc/sysctl.conf
/sbin/sysctl -p
###########
cp /etc/pam.d/login /bak/login
#64bit
echo "#xcl "${DATE} >> /etc/pam.d/login
echo "session required /lib/security/pam_limits.so" >> /etc/pam.d/login
echo "session required pam_limits.so" >> /etc/pam.d/login
#32bit
#session required pam_limits.so
######################################
#Limits
cat /etc/security/limits.conf
#AIO
cat /proc/sys/fs/aio-max-nr
#pam_limits.so
cat /etc/pam.d/login
#Displaying and Changing Kernel Parameter Values
cat /etc/sysctl.conf
######################################