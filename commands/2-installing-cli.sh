# Necceseties
sudo dnf install -y neofetch neovim lsd bat zoxide python3 python3-pip lolcat cowsay cmatrix git lshw acpi ncdu authbind exif exiv2 android-tools # android-tools gives adb
sudo dnf install -y cargo ruby
pip install rich sty tqdm requests scikit-learn jupyterlab jupyterlab-night jupyterlab-pygments jupyterlab-widgets jupyterlab_horizon_theme catppuccin-jupyterlab flask flask_restful flask_session
pip install trash-cli yt-dlp
cargo install viu macchina
cd ~/repos
git clone https://github.com/msr8/dotfiles

# Binaries in dotfiles/bin
cd ~/repos/dotfiles/bins
cp clangrun ~/.local/bin/
cp pdfstr   ~/.local/bin/

# Config
cd ~/repos/dotfiles/config
cat bashrc >> ~/.bashrc
cp -r blesh      ~/.config/
cp -r neofetch   ~/.config/
cp -r nvim       ~/.config/

# Ble.sh
cd ~/repos
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local

# Fuck (have to build it from source cause of the missing `imp` module in py3.12)
cd ~/repos
git clone https://github.com/nvbn/thefuck
cd thefuck
pip install -r requirements.txt
sudo python setup.py develop # Doing sudo cause of permission issues when not doing it

# Docker (https://docs.docker.com/engine/install/fedora/)
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager -y --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker

# Exiftool
cd ~/repos
git clone https://github.com/exiftool/exiftool
sudo dnf install -y perl
cd exiftool
perl Makefile.PL
make
make test
make install
cp exiftool ~/.local/bin
cp -r lib ~/.local/bin

# Scrcpy
cd ~/repos
git clone 



# # Scrolling issues
# sudo dnf install -y imwheel
# sudo dnf install -y xorg-x11-drv-evdev







echo "Everything ran succesfully :D"


