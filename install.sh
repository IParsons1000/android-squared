#!/data/data/com.termux/files/usr/bin/bash

pkg update -y
pkg install -y proot proot-distro
pkg install -y x11-repo
pkg install -y termux-x11-nightly pulseaudio

proot-distro install debian
wget https://github.com/cu233/proot_proc/raw/refs/heads/master/proc.tar.xz
tar xf proc.tar.xz filesystems
cat <<EOF | proot-distro login debian --bind ~/filesystems:/proc/filesystems -- /usr/bin/bash
apt update -y
apt install sudo adduser -y
adduser asq
usermod -a -G sudo asq
echo 'asq    ALL=(ALL:ALL) ALL' >> /etc/sudoers
apt install -y xorg xinit xterm
echo 'allowed_users = anybody' >>/etc/X11/Xwrapper.config
apt install -y xwayland weston
curl https://repo.waydro.id | bash
apt install waydroid -y
mkdir /etc/xdg || true
mkdir /etc/xdg/weston || true
touch /etc/xdg/weston/weston.ini || true
cat <<EOF >>/etc/xdg/weston/weston.ini
[autolaunch]
path=/usr/bin/waydroid show-full-ui
EOF
exit
EOF
