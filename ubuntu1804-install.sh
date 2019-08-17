#!/bin/bash

sudo add-apt-repository -y -n ppa:beineri/opt-qt-5.12.0-bionic
sudo add-apt-repository -y -n ppa:mc3man/bionic-media
sudo apt-get update

wget https://github.com/pellcorp/kidstube-build/raw/master/dist/minitube_3.1-1kidstube_amd64.deb -O /tmp/minitube_3.1-1kidstube_amd64.deb
sudo dpkg -i /tmp/minitube_3.1-1kidstube_amd64.deb
rm /tmp/minitube_3.1-1kidstube_amd64.deb
sudo apt-get -y install --fix-broken

sudo apt-get -y install qt512-meta-minimal qt512x11extras

sudo tee -a /usr/bin/kidstube <<- EOM
#!/bin/bash

source /opt/qt512/bin/qt512-env.sh
/usr/bin/minitube $@
EOM
sudo chmod 777 /usr/bin/kidstube

cp /usr/share/applications/minitube.desktop /tmp/minitube.desktop
sed -i 's:Exec=minitube:Exec=kidstube:g' /tmp/minitube.desktop
sudo desktop-file-install /tmp/minitube.desktop
rm /tmp/minitube.desktop

