#!/data/data/com.termux/files/usr/bin/bash

git clone https://github.com/antonyz89/docker-qemu-arm
cd docker-qemu-arm
./termux-setup.sh
pkg install x11-repo
pkg install termux-x11-nightly
cd alpine
sed -i -e 's/-nographic//g' startqemu.sh
./startqemu.sh
