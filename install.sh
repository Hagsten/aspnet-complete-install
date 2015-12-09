#!/usr/bin/env bash
# Complete installation of ASP.NEt vNext with all its dependencies

echo "Begin"
echo "Installing DNVM and its dependencies..."

sudo apt-get install unzip curl

curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh

echo "DNVM installation complete"
echo "Installing DNX and its dependencies..."

sudo apt-get install libunwind8 gettext libssl-dev libcurl4-openssl-dev zlib1g libicu-dev uuid-dev

read

dnvm upgrade -r coreclr

echo "DNX installation complete"
echo "Installing libuv..."

sudo apt-get install make automake libtool curl
curl -sSL https://github.com/libuv/libuv/archive/v1.4.2.tar.gz | sudo tar zxfv - -C /usr/local/src
cd /usr/local/src/libuv-1.4.2
sudo sh autogen.sh
sudo ./configure
sudo make
sudo make install
sudo rm -rf /usr/local/src/libuv-1.4.2 && cd ~/
sudo ldconfig

echo "Libuv installation complete"
echo "ASP.NET vNext Installation complete"
