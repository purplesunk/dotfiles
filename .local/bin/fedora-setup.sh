#!/bin/sh

sudo dnf update

#dnf copr enable sentry/kernel-fsync
#dnf update --refresh

# adding rpm free and non-free: 
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# multimedia codecs: 
sudo dnf -y install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf -y install lame\* --exclude=lame-devel
sudo dnf -y group upgrade --with-optional Multimedia

# nvidia drivers negativo17:
#dnf config-manager --add-repo=https://negativo17.org/repos/fedora-nvidia.repo
#dnf -y install nvidia-driver akmod-nvidia

# nvidia drivers from rpm: 
#sudo dnf -y install akmod-nvidia -y
#sudo dnf -y install xorg-x11-drv-nvidia-cuda

# adding flathub: 
flatpak remote-delete flathub
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


# things to do:
# /etc/vconsole
# KEYMAP="latam"
# FONT="ter-118n" if installed
#
# /etc/default/grub
# GRUB_TIMEOUT=0
# y configurar again
#
# sudo systemctl set-default graphical.target
#
# meibi hacer lo de compilar el driver de wifi
# if lo hago sudo dnf install dkms
#
# instalar-- posibles packetes: 
# firefox
# lato-fonts
# libreoffice
# alacritty
# gnome-calculator
# @development-tools
# Multimedia
# Hardware Support
# C Development Tools and Libraries
# terminus-fonts-console
# mpv
# evince
# neovim
# keepassxc
# ffmpegthumbnailer
# evince
# eog
# xfce4-taskmanager
# nautilus
# gedit
# file-roller
# qbittorrent
# adb
# bash-completion
# pipewire
# wireplumber 
# htop
# cpu-x
# newsboat
# xdg-user-dirs, xdg-user-dirs-gtk
# ffmpegthumbnailer
#
#
# window manager i3:
# @base-x
# redshift
# i3-gaps
# rofi
# lxappearance
# polybar
# nitrogen
# picom
# fontawesome-fonts
# pamix
# pavucontrol
# android-file-transfer
# gvfs-mtp
# gvfs-gphoto2
#
#
# brave:
# dnf-plugins-core
# sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
# sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
# sudo dnf install brave-browser
#
# mouse aceleration thingy flat accel install:
# libinput
# /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
#
# echo
# 'Section "InputClass"
#	Identifier "My Mouse"
#	Driver "libinput"
#	MatchIsPointer "yes"
#	Option "AccelProfile" "flat"
#	Option "AccelSpeed" "0"
#  EndSection'
# >> 50-mouse-acceleration.conf
# sudo mv 50-mouse-acceleration.conf /etc/X11/xorg.conf.d/
#
#
# meibi:
# timeshift
#
# xfce4: 
# sudo dnf install network-manager-applet\
# xfce4-panel xfce4-datetime-plugin\
# xfce4-session xfce4-settings xfconf xfdesktop\
# xfce4-appfinder xfce4-power-manager xfce4-pulseaudio-plugin\
# gvfs xfwm4 NetworkManager-wifi
# arc-theme
# xfce4-whiskermenu-plugin
#
# gnome:
# gnome-shell gnome-terminal gnome-terminal-nautilus \
# xdg-user-dirs xdg-user-dirs-gtk \
# sudo systemctl enable gdm
# sudo systemctl set-default graphical.target
# gnome-tweaks
