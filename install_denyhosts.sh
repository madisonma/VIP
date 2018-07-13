#!/bin/bash
#
cd /usr/local/src
wget ftp://192.168.91.151/pub/tools/DenyHosts-2.6.tar.gz
tar -xzvf DenyHosts-2.6.tar.gz 
cd DenyHosts-2.6
python setup.py install
cd /usr/share/denyhosts/
cp daemon-control-dist daemon-control
chown root daemon-control
chmod 700 daemon-control
grep -v "^#" denyhosts.cfg-dist > denyhosts.cfg
echo "/usr/share/denyhosts/daemon-control start" >> /etc/rc.local
cd /etc/init.d
ln -s /usr/share/denyhosts/daemon-control denyhosts
chkconfig --add denyhosts
chkconfig --level 345 denyhosts on
service denyhosts start

