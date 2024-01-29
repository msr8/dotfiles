# Run using bash -e

# Updating system
sudo dnf -y update && sudo dnf -y upgrade

# Configuring dnf.conf
STR=$'\n\n# Added for speed:\nfastestmirror=True\nmax_parallel_downloads=10\ndefaultyes=True\nkeepcache=True'
echo "$STR" | sudo tee -a /etc/dnf/dnf.conf

# Adding RPMfusion repos (https://docs.fedoraproject.org/en-US/quick-docs/rpmfusion-setup)
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y groupupdate core --skip-broken --allowerasing

# Installing media codecs (https://docs.fedoraproject.org/en-US/quick-docs/installing-plugins-for-playing-movies-and-music)
# sudo dnf -y groupupdate multimedia sound-and-video
# sudo dnf -y install ffmpeg-libs
sudo dnf -y install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf -y install lame\* --exclude=lame-devel
sudo dnf -y group upgrade --with-optional Multimedia --skip-broken --allowerasing

# Flathub (https://flatpak.org/setup/Fedora)
# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Hostname
sudo hostnamectl set-hostname hp14

# XFCE
sudo dnf install -y @xfce-desktop-environment

# DWM
sudo dnf -y install git xsetroot make gcc libX11-devel libXft-devel libXinerama-devel imlib2-devel yajl # yajl needed for the IPC patch
mkdir ~/repos
cd ~/repos
git clone https://github.com/msr8/my-dwm.git
cd my-dwm
sudo make clean install

# Hyprland
sudo dnf -y install hyprland
sudo dnf -y install hyprland-devel








reboot