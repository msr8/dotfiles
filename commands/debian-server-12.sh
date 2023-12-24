# Made for Debian 12 (bullseye)
# wget https://raw.githubusercontent.com/msr8/dotfiles/main/commands/debian-server-12.sh -O debian-server-12.sh && bash debian-server-12.sh



set -e


sudo apt-get -y update && sudo apt-get -y upgrade

sudo apt-get install -y neofetch gdu neovim tmux neovim git curl lsd bat zoxide

# Configs
cd ~
wget https://raw.githubusercontent.com/msr8/dotfiles/main/config/bashrc-debian-server -O .bashrc
if [ ! -d ".config" ]; then
    mkdir .config
fi
cd ~/.config
mkdir neofetch
wget https://raw.githubusercontent.com/msr8/dotfiles/main/config/neofetch/config.conf -O neofetch/config.conf
mkdir nvim
wget https://raw.githubusercontent.com/msr8/dotfiles/main/config/nvim/init.vim -O nvim/init.vim
neofetch

# Python
sudo apt-get install -y python3 python3-pip


# MongoDB (https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-debian/)
if [ "$1" == "--mongodb"  ]; then
    sudo apt-get install -y gnupg curl
    curl -fsSL https://pgp.mongodb.com/server-7.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
    echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/7.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
    sudo apt-get update
    # The libssl1.1 package isn available on debian 12, so gotta install it manually (https://www.reddit.com/r/mongodb/comments/14bpu38/mongodb_not_allowed_to_be_installed_on_debian_12/)
    curl ftp.us.debian.org/debian/pool/main/o/openssl/libssl1.1_1.1.1w-0+deb11u1_amd64.deb -o libssl1.1_1.1.1w-0+deb11u1_amd64.deb
    sudo dpkg -i libssl1.1_1.1.1w-0+deb11u1_amd64.deb
    rm libssl1.1_1.1.1w-0+deb11u1_amd64.deb
    # ---
    sudo apt-get install -y mongodb-org
    sudo systemctl start mongod
    # sudo systemctl status mongod
    sudo systemctl enable mongod
fi


# # Disable firewall (since it doesnt let us send requests to servers for some reason)
# sudo ufw disable
# sudo systemctl disable nftables.service
# sudo iptables -P INPUT ACCEPT
# sudo iptables -P OUTPUT ACCEPT
# sudo iptables -P FORWARD ACCEPT
# sudo iptables -F





# # To run on host
# kitten ssh root@<ip>
# mongodump --db spotify --out ~/spotify-mongodb-dump
# scp -r ~/spotify-mongodb-dump/ root@<ip>:/root/spotify-mongodb-dump # add the -6 flag if using ipv6
# scp -r ~/Documents/Even_Newer_Python_Stuff/SPOTIFY_RECCOMENDER root@<ip>:/root/spotify-scraper

# # Once the above commands are ran
# cd $HOME/spotify-mongodb-dump
# mongorestore --db spotify spotify/
# cd $HOME/spotify-scraper
# python3 -m pip install -r requirements.txt --break-system-packages

