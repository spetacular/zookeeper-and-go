#!/usr/bin/env bash

apt-get update
apt-get install -y build-essential git-core mercurial
cd /opt
hg clone -u release https://code.google.com/p/go
cd go/src
./all.bash

cat > /home/vagrant/.profile <<EOF
export GOPATH=\$HOME
export PATH=\$HOME/bin:/opt/go/bin:\$PATH
export ZOOKEEPER_SERVERS=192.168.12.11:2181,192.168.12.12:2181,192.168.12.13:2181
export PS1='(go) \\w \$ '
EOF
chown vagrant:vagrant /home/vagrant/.profile