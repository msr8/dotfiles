# Necceseties
sudo dnf install -y neofetch neovim lsd bat zoxide python3 python3-pip java-17-openjdk-devel.x86_64 lolcat cowsay cmatrix git lshw acpi ncdu authbind exif exiv2 qpdf android-tools # android-tools gives adb
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
wget https://desktop.docker.com/linux/main/amd64/139021/docker-desktop-4.28.0-x86_64.rpm -O docker-desktop.rpm
sudo dnf install -y docker-desktop.rpm
rm docker-desktop.rpm
# Remember to do `rm ~/.docker/config.json` if you get the pass init error when logging in

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

# Git LFS (https://github.com/git-lfs/git-lfs/blob/main/INSTALLING.md)
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | sudo bash
sudo dnf install -y git-lfs
# git lfs migrate import --include="*.csv"

# Mojo (https://docs.modular.com/mojo/manual/get-started)
# To update: `modular update mojo`
curl -s https://get.modular.com | sh -
modular install mojo
MOJO_PATH=$(modular config mojo.path) \
  && BASHRC=$( [ -f "$HOME/.bash_profile" ] && echo "$HOME/.bash_profile" || echo "$HOME/.bashrc" ) \
  && echo 'export MODULAR_HOME="'$HOME'/.modular"' >> "$BASHRC" \
  && echo 'export PATH="'$MOJO_PATH'/bin:$PATH"' >> "$BASHRC" \
  && source "$BASHRC"
# https://github.com/modularml/mojo/issues/855
sudo dnf install -y ncurses-devel libedit
sudo ln -s /usr/lib64/libncurses.so.6.4 /lib64/libpanel.so.6
# sudo ln -s /usr/lib64/libedit.so.0 /usr/lib64/libedit.so.6
# source ~/.bash_profile


# # Scrolling issues
# sudo dnf install -y imwheel
# sudo dnf install -y xorg-x11-drv-evdev







echo "Everything ran succesfully :D"


