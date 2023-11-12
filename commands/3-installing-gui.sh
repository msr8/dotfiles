# Necceseties
sudo dnf install -y firefox kitty feh gedit lshw-gui xev pavucontrol network-manager-applet arandr
sudo dnf install -y plank plank-docklets rofi xfdashboard polybar oneko
sudo dnf install -y xdotool wmctrl brightnessctl xbacklight pamixer scrot dunst
sudo gem install fusuma

# Config
cd ~/repos/dotfiles
cp -r fonts ~/.fonts
cd config
cp -r fusuma     ~/.config/
cp -r picom      ~/.config/
cp -r plank      ~/.config/
cp -r skippy-xd  ~/.config/
cp -r jupyter    ~/.jupyter
cp dwm-autostart.sh  ~/.config/; chmod +x ~/.config/dwm-autostart.sh
sudo cp 30-touchpad.conf /usr/share/X11/xorg.conf.d/
mkdir ~/.config/kitty
cp kitty/linux-kitty.conf ~/.config/kitty/kitty.conf

# Set theme and icon
cd ~/repos/dotfiles/config/gtk-3.0
if [ -d ~/.config/gtk-3.0 ]; then
    cp settings.ini ~/.config/gtk-3.0
else
    mkdir ~/.config/gtk-3.0
    cp settings.ini ~/.config/gtk-3.0
fi


# # Autostart
# cd ~/repos/dotfiles/bins
# python3 gen_autostart.py "fusuma"    "Starts the fusuma daemon"    "fusuma -d"
# python3 gen_autostart.py "imwheel"   "Starts the imwheel daemon"   "imwheel"
# python3 gen_autostart.py "oneko"     "Starts the oneko process"    "oneko -tofocus"
# python3 gen_autostart.py "picom"     "Starts the picom daemon"     "picom"
# python3 gen_autostart.py "plank"     "Starts the plank daemon"     "plank"
# python3 gen_autostart.py "skippy-xd" "Starts the skippy-xd daemon" "skippy-xd --start-daemon"
# python3 gen_autostart.py "swhkd"     "Starts the swhkd daemons"    "swhks & pkexec swhkd"

# Eww
sudo dnf remove -y rust # Doing this cause I need nightly rust for eww
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo dnf install -y gtk3 pango gdk-pixbuf2 cairo glib2 libgcc glibc rust-gdk-sys+default-devel # Have it below rustup cause rustup deletes these packages if I install them before
cd ~/repos
git clone https://github.com/elkowar/eww
cd eww
cargo build --release --no-default-features --features x11
cd target/release
chmod +x ./eww
mv ./eww ~/.local/bin


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


# Skippy-xd
cd ~/repos
sudo dnf -y install cmake gcc-c++ gtk3-devel libwnck3-devel libXcomposite-devel libXdamage-devel libX11-devel libXrandr-devel libXinerama-devel startup-notification-devel libXft-devel giflib-devel make gcc
git clone https://github.com/richardgv/skippy-xd.git
cd skippy-xd
make
sudo make install

# Picom
sudo dnf install -y dbus-devel gcc git libconfig-devel libdrm-devel libev-devel libX11-devel libX11-xcb libXext-devel libxcb-devel libGL-devel libEGL-devel meson pcre2-devel pcre-devel pixman-devel uthash-devel xcb-util-image-devel xcb-util-renderutil-devel xorg-x11-proto-devel
cd ~/repos
git clone https://github.com/ibhagwan/picom
cd picom
meson setup --buildtype=release build
ninja -C build
ninja -C build install


# Lightdm
sudo dnf install -y lightdm lightdm-gtk
sudo systemctl enable lightdm.service

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
sudo dnf install -y install qt4 qt4-devel ffmpeg-devel alsa-lib-devel pulseaudio-libs-devel jack-audio-connection-kit-devel make gcc gcc-c++ mesa-libGL-devel mesa-libGLU-devel libX11-devel libXext-devel libXfixes-devel
cd ~/repos
git clone https://github.com/MaartenBaert/ssr
cd ssr
./simple-build-and-install


# Vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install -y code


# Joplin
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash















echo "Everything ran succesfully :D"
