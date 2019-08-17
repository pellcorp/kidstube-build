#!/bin/bash

# only on ubuntu 18.10+

sudo apt install build-essential qt5-default qttools5-dev-tools qt5-qmake qtdeclarative5-dev libqt5sql5-sqlite libqt5x11extras5-dev libmpv-dev

# not actually a bzip2 :-(
rm -rf /tmp/minitube-3.1/
wget https://github.com/flaviotordini/minitube/releases/download/3.1/minitube-3.1.tar.bz2 -O /tmp/minitube_3.1.orig.tar.gz
if [ $? -ne 0 ]; then
	exit 1
fi
tar -zxvf /tmp/minitube_3.1.orig.tar.gz -C /tmp
cp -r debian /tmp/minitube-3.1/
pushd /tmp/minitube-3.1
debuild -uc -us
if [ $? -ne 0 ]; then
	exit 1
fi
popd

cp /tmp/minitube_3.1-1kidstube_amd64.deb dist/

