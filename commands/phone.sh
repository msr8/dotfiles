# -------------------- Configuring SSH --------------------
# First, set a password
passwd
# Then, start the ssh daemon
sshd

# We can kill the daemon with `pkill sshd`
# if slow speed when download, `termux-change-repo` and change to a different mirror



# -------------------- Installing packages --------------------
pkg update
pkg upgrade -y
# Neccessities
pkg install -y lsd neovim git openssh neofetch python curl wget cmatrix cowsay exiftool ncdu imagemagick speedtest-go bat zoxide macchina
# Cyber Sec
pkg install -y nmap
# Pip stuff
pip install rich sty tqdm requests flask flask_restful flask_session
pip install thefuck trash-cli yt-dlp



# -------------------- Cloning dotfiles --------------------
mkdir ~/repos
cd ~/repos
git clone https://github.com/msr8/dotfiles
cd ~



# -------------------- Configs --------------------
cd ~/.config
mkdir blesh neofetch nvim
cp ~/repos/dotfiles/config/bashrc-phone ~/.bashrc
cp ~/repos/dotfiles/config/blesh/init.sh ~/.config/blesh/init.sh
cp ~/repos/dotfiles/config/neofetch/config.conf ~/.config/neofetch/config.conf
cp -r ~/repos/dotfiles/config/nvim/* ~/.config/nvim/
cd ~



# -------------------- Scripts --------------------
mkdir ~/scripts
cp ~/repos/dotfiles/scripts/* ~/scripts/
chmod +x ~/scripts/*
cd ~



# -------------------- Ble.sh --------------------
cd ~/repos
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
cd ~





# -------------------- Jupyterlab --------------------
# pip install jupyter




