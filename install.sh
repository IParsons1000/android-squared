#!/data/data/com.termux/files/usr/bin/bash

pkg install x11-repo
pkg install termux-x11-nightly git
git clone https://github.com/antonyz89/docker-qemu-arm
cd docker-qemu-arm
./termux-setup.sh
cd alpine
./startqemu.sh
