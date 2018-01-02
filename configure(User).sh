#! /bin/sh
############################
#
#author:xiongchuanliang
#create date:2012-12-25
#desc: User specific environment and startup programs
############################
DATE=`date +%Y-%m-%d`
env_etc_profile="/etc/profile"
env_profile="/home/oracle/.bash_profile"
######################################
env_ORACLE_HOSTNAME="erpdbserver"
env_ORACLE_OWNER="oracle"
env_ORACLE_BASE="/u01/app/oracle"
env_ORACLE_HOME="/product/11.2.0/db_1"
env_ORACLE_UNQNAME="xcldb"
env_ORACLE_SID="xcldb"
#AMERICAN_AMERICA.AL32UTF8
env_NLS_LANG="AMMERICAN_AMERICA.ZHS16GBK"
######################################
yes|cp ${env_etc_profile} ${env_etc_profile}"_bak"
yes|cp ${env_profile} ${env_profile}"_bak"
######################################
echo " " >> ${env_etc_profile}
echo "###########################" >> ${env_etc_profile}
echo "###xcl "${DATE} >> ${env_etc_profile}
echo "if [ \$USER = \"oracle\" ]; then" >> ${env_etc_profile}
echo " if [ \$SHELL = \"/bin/ksh\" ]; then" >> ${env_etc_profile}
echo " ulimit -p 16384" >> ${env_etc_profile}
echo " ulimit -n 65536" >> ${env_etc_profile}
echo " else" >> ${env_etc_profile}
echo " ulimit -u 16384 -n 65536" >> ${env_etc_profile}
echo " fi" >> ${env_etc_profile}
echo "fi" >> ${env_etc_profile}
echo "###########################" >> ${env_etc_profile}
######################################
echo "###########################" >> ${env_profile}
echo "###xcl "${DATE} >> ${env_profile}
echo "TMP=/tmp" >> ${env_profile}
echo "TMPDIR=\$TMP" >> ${env_profile}
echo "export TMP TMPDIR" >> ${env_profile}
echo " " >> ${env_profile}
#export ORACLE_HOSTNAME="${env_ORACLE_HOSTNAME} >> ${env_profile}
echo "ORACLE_OWNER="${env_ORACLE_OWNER} >> ${env_profile}
echo "ORACLE_BASE="${env_ORACLE_BASE} >> ${env_profile}
echo "ORACLE_HOME=\$ORACLE_BASE"${env_ORACLE_HOME} >> ${env_profile}
echo "ORACLE_UNQNAME="${env_ORACLE_UNQNAME} >> ${env_profile}
echo "ORACLE_SID="${env_ORACLE_SID} >> ${env_profile}
echo "export ORACLE_OWNER ORACLE_BASE ORACLE_HOME ORACLE_UNQNAME ORACLE_SID" >> ${env_profile}
echo " " >> ${env_profile}
echo "CLASSPATH=\$ORACLE_HOME/JRE:\$ORACLE_HOME/jlib:\$ORACLE_HOME/rdbms/jlib" >> ${env_profile}
echo "LD_LIBRARY_PATH=\$ORACLE_HOME/lib:/lib:/usr/lib:/usr/local/lib" >> ${env_profile}
echo "export CLASSPATH LD_LIBRARY_PATH" >> ${env_profile}
echo " " >> ${env_profile}
echo "ORACLE_TERM=xterm" >> ${env_profile}
#export ORACLE_TERM=vt100
echo "NLS_LANG="${env_NLS_LANG} >> ${env_profile}
echo "TNS_ADMIN=\$ORACLE_HOME/network/admin" >> ${env_profile}
#echo "SQLPATH=~/mydba/sql:\$ORACLE_HOME/sqlplus/admin" >> ${env_profile}
#echo "export ORACLE_TERM NLS_LANG TNS_ADMIN SQLPATH" >> ${env_profile}
echo "export ORACLE_TERM NLS_LANG TNS_ADMIN " >> ${env_profile}
echo " " >> ${env_profile}
echo "PATH=\$ORACLE_HOME/bin:/usr/local/bin:/bin:/usr/sbin:/usr/bin:\$PATH" >> ${env_profile}
echo "export PATH" >> ${env_profile}
echo " " >> ${env_profile}
#echo "PS1='\`whoami\`@\`hostname -s\`' [\$PWD]" >> ${env_profile}
#echo "export PS1" >> ${env_profile}
echo "PS1='[\`whoami\`@\`hostname -s\`] :'" >> ${env_profile}
echo " " >> ${env_profile}
echo "umask 022" >> ${env_profile}
echo "###########################" >> ${env_profile}
echo ""