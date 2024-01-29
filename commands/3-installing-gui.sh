# Necceseties
sudo dnf install -y firefox kitty feh gedit lshw-gui xev pavucontrol network-manager-applet arandr vlc qbittorrent cool-retro-term syncthing nyancat # GUI applications
sudo dnf install -y xdotool wmctrl brightnessctl xbacklight pamixer scrot dunst aircrack-ng pulseaudio pipewire --skip-broken # Tools I would not need in a CLI-only machine | Gotta do --skip-broken cause of pulseaudio and pipewire
sudo dnf install -y plank plank-docklets rofi xfdashboard polybar oneko # Ricing
sudo gem install fusuma

# Config
cd ~/repos/dotfiles/config
cp -r fusuma     ~/.config/
cp -r picom      ~/.config/
cp -r plank      ~/.config/
cp -r skippy-xd  ~/.config/
cp -r jupyter    ~/.jupyter
cp autostart-dwm.sh   ~/.config/; chmod +x ~/.config/autostart-dwm.sh
cp autostart-xfce.sh  ~/.config/; chmod +x ~/.config/autostart-xfce.sh
sudo cp 30-touchpad.conf /usr/share/X11/xorg.conf.d/
mkdir ~/.config/kitty
cp kitty/linux-kitty.conf ~/.config/kitty/kitty.conf

# Set theme and icons
cd ~/repos/dotfiles/config/gtk-3.0
if [ ! -d ~/.config/gtk-3.0 ]; then
    mkdir ~/.config/gtk-3.0
fi
cp settings.ini ~/.config/gtk-3.0


# # Autostart
# cd ~/repos/dotfiles/bins
# python3 gen_autostart.py "fusuma"    "Starts the fusuma daemon"    "fusuma -d"
# python3 gen_autostart.py "imwheel"   "Starts the imwheel daemon"   "imwheel"
# python3 gen_autostart.py "oneko"     "Starts the oneko process"    "oneko -tofocus"
# python3 gen_autostart.py "picom"     "Starts the picom daemon"     "picom"
# python3 gen_autostart.py "plank"     "Starts the plank daemon"     "plank"
# python3 gen_autostart.py "skippy-xd" "Starts the skippy-xd daemon" "skippy-xd --start-daemon"
# python3 gen_autostart.py "swhkd"     "Starts the swhkd daemons"    "swhks & pkexec swhkd"

# # Eww
# sudo dnf remove -y rust # Doing this cause I need nightly rust for eww
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# sudo dnf install -y gtk3 pango gdk-pixbuf2 cairo glib2 libgcc glibc rust-gdk-sys+default-devel # Have it below rustup cause rustup deletes these packages if I install them before
# cd ~/repos
# git clone https://github.com/elkowar/eww
# cd eww
# cargo build --release --no-default-features --features x11
# cd target/release
# chmod +x ./eww
# mv ./eww ~/.local/bin


# Rofi
cd ~/repos
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh

# Swhkd
sudo dnf install -y systemd-devel
cd ~/repos
git clone https://github.com/waycrate/swhkd
cd swhkd
make
sudo make install
sudo cp ~/repos/dotfiles/config/swhkdrc /etc/swhkd/swhkdrc


# Wallpaper
cd ~/repos
git clone https://github.com/msr8/wallpapers

# Icons
cd ~
mkdir .icons
cd .icons
git clone https://github.com/EliverLara/candy-icons

# Themes
cd ~
mkdir .themes
cd .themes
wget https://github.com/EliverLara/Sweet/releases/download/v3.0/Sweet-Dark-v40.zip
wget https://github.com/Roboron3042/Cyberpunk-Neon/raw/master/gtk/oomox-cyberpunk-neon.zip
wget https://github.com/Roboron3042/Cyberpunk-Neon/raw/master/gtk/materia-cyberpunk-neon.zip
unzip Sweet-Dark-v40.zip
unzip oomox-cyberpunk-neon.zip
unzip materia-cyberpunk-neon.zip
rm Sweet-Dark-v40.zip
rm oomox-cyberpunk-neon.zip
rm materia-cyberpunk-neon.zip

# Fonts
cp -r fonts ~/.fonts


# # Skippy-xd
# cd ~/repos
# sudo dnf -y install cmake gcc-c++ gtk3-devel libwnck3-devel libXcomposite-devel libXdamage-devel libX11-devel libXrandr-devel libXinerama-devel startup-notification-devel libXft-devel giflib-devel make gcc
# git clone https://github.com/richardgv/skippy-xd.git
# cd skippy-xd
# make
# sudo make install

# Picom
sudo dnf install -y dbus-devel gcc git libconfig-devel libdrm-devel libev-devel libX11-devel libX11-xcb libXext-devel libxcb-devel libGL-devel libEGL-devel meson pcre2-devel pcre-devel pixman-devel uthash-devel xcb-util-image-devel xcb-util-renderutil-devel xorg-x11-proto-devel
cd ~/repos
git clone https://github.com/ibhagwan/picom
cd picom
meson setup --buildtype=release build
ninja -C build
ninja -C build install


# Lightdm
# sudo dnf install -y lightdm lightdm-gtk
# sudo systemctl enable lightdm.service

# Polybar (https://github.com/polybar/polybar/wiki/Compiling)
sudo dnf install -y gcc-c++ clang git cmake @development-tools python3-sphinx python3-packaging
sudo dnf install -y cairo-devel libuv-devel xcb-util-devel libxcb-devel xcb-proto xcb-util-image-devel xcb-util-wm-devel
sudo dnf install -y xcb-util-xrm-devel xcb-util-cursor-devel alsa-lib-devel pulseaudio-libs-devel i3-devel jsoncpp-devel libmpdclient-devel libcurl-devel libnl3-devel
cd ~/repos
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install



# Simple screen recorder
# sudo dnf install -y qt4 qt4-devel ffmpeg-devel alsa-lib-devel pulseaudio-libs-devel jack-audio-connection-kit-devel make gcc gcc-c++ mesa-libGL-devel mesa-libGLU-devel libX11-devel libXext-devel libXfixes-devel
# cd ~/repos
# git clone https://github.com/MaartenBaert/ssr
# cd ssr
# ./simple-build-and-install
sudo dnf install -y simplescreenrecorder


# Vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install -y code


# Joplin
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash


# Draw.io aka Diagrams.net
cd ~
wget https://github.com/jgraph/drawio-desktop/releases/download/v22.1.11/drawio-x86_64-22.1.11.rpm -O drawio.rpm
sudo dnf install -y drawio.rpm
rm drawio.rpm


# # MongoDB (and Compass) (https://www.mongodb.com/docs/v2.4/tutorial/install-mongodb-on-linux/)
# cd ~
# curl -O http://downloads.mongodb.org/linux/mongodb-linux-x86_64-2.4.14.tgz
# tar -zxvf mongodb-linux-x86_64-2.4.14.tgz
# # ??
# # Compass (https://www.mongodb.com/docs/compass/current/install/)
# wget https://downloads.mongodb.com/compass/mongodb-compass-1.40.4.x86_64.rpm
# sudo yum install mongodb-compass-1.40.4.x86_64.rpm


# Spotify (https://docs.fedoraproject.org/en-US/quick-docs/installing-spotify/)
sudo dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client
# Spicetify
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh


# Arduino IDE (https://developer.fedoraproject.org/start/hw/arduino/about.html)
sudo dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install cc.arduino.arduinoide


# Activate Linux XD (https://github.com/MrGlockenspiel/activate-linux)
# Gotta build it manually cause of expired GPG key
# dnf config-manager --add-repo https://download.opensuse.org/repositories/home:tschmitz:activate-linux/Fedora_Rawhide/home:tschmitz:activate-linux.repo
# dnf install -y activate-linux
cd ~/repos
git clone https://github.com/MrGlockenspiel/activate-linux
cd activate-linux
make
cp activate-linux ~/.local/bin




echo "Everything ran succesfully :D"
