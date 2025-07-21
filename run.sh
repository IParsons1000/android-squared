#!/data/data/com.termux/files/usr/bin/bash

termux-x11 :0 &>/dev/null &
./docker-qemu-arm/alpine/startqemu.sh
