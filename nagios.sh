#!/bin/bash
#
useradd nagios
cd /usr/local/src
wget http://syslab.comsenz.com/downloads/linux/nagios-plugins-1.4.13.tar.gz
wget http://syslab.comsenz.com/downloads/linux/nrpe-2.12.tar.gz
tar -xzvf nagios-plugins-1.4.13.tar.gz
cd nagios-plugins-1.4.13
./configure
make
make install
chown nagios:nagios /usr/local/nagios
chown -R nagios:nagios /usr/local/nagios/libexec
cd ../
tar -xzvf nrpe-2.12.tar.gz
cd nrpe-2.12
./configure
make all
make install-plugin
make install-daemon
make install-daemon-config
sed -i 's@allowed_hosts=127.0.0.1@allowed_hosts=113.123.123.123@' /usr/local/nagios/etc/nrpe.cfg
/usr/local/nagios/bin/nrpe -c /usr/local/nagios/etc/nrpe.cfg -d
echo "/usr/local/nagios/bin/nrpe -c /usr/local/nagios/etc/nrpe.cfg -d" >> /etc/rc.local




























