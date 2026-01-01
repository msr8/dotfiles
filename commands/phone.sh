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


# -------------------- Configs --------------------
mkdir ~/repos
cd ~/repos
git clone https://github.com/msr8/dotfiles
cd ~

cp .bashrc-phone ~/.bashrc
cd ~/.config
mkdir neofetch nvim



# -------------------- Jupyterlab --------------------
# pip install jupyter




