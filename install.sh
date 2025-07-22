#!/data/data/com.termux/files/usr/bin/bash

pkg update -y
pkg install -y proot proot-distro
pkg install -y x11-repo
pkg install -y termux-x11-nightly

proot-distro install debian
cat <<EOF | proot-distro login debian -- /usr/bin/bash
apt update -y
apt install sudo adduser
adduser asq
usermod -a -G sudo asq
echo 'asq    ALL=(ALL:ALL) ALL' >> /etc/sudoers
apt install -y xorg xinit xterm
exit
EOF
