#!/usr/bin/env bash
cd /opt
wget https://dl.google.com/go/go1.9.3.linux-amd64.tar.gz
tar -xzf go1.9.3.linux-amd64.tar.gz
rm go1.9.3.linux-amd64.tar.gz

cat > /home/vagrant/.profile <<EOF
export GOPATH=\$HOME
export PATH=\$HOME/bin:/opt/go/bin:\$PATH
export ZOOKEEPER_SERVERS=192.168.12.11:2181,192.168.12.12:2181,192.168.12.13:2181
EOF
chown vagrant:vagrant /home/vagrant/.profile

sudo -u vagrant -i go get github.com/samuel/go-zookeeper/zk
sudo -u vagrant -i go get github.com/mmcgrana/zk
