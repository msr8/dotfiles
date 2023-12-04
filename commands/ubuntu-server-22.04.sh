sudo apt-get -y update && sudo apt-get -y upgrade

sudo apt-get install -y neofetch gdu neovim tmux
neofetch

cd ~/.config/neofetch # This folder is created when neofetch is run for the first time
wget https://raw.githubusercontent.com/msr8/dotfiles/main/config/neofetch/config.conf -O config.conf

# Disable firewall (since it doesnt let us send requests to servers for some reason)
sudo ufw disable
sudo systemctl disable nftables.service
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -F

# MongoDB (https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/)
sudo apt-get install -y gnupg curl
curl -fsSL https://pgp.mongodb.com/server-7.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt-get update
# # The libssl1.1 package isn available on debian 12, so gotta install it manually (https://www.reddit.com/r/mongodb/comments/14bpu38/mongodb_not_allowed_to_be_installed_on_debian_12/)
# curl ftp.us.debian.org/debian/pool/main/o/openssl/libssl1.1_1.1.1w-0+deb11u1_amd64.deb -o libssl1.1_1.1.1w-0+deb11u1_amd64.deb
# sudo dpkg -i libssl1.1_1.1.1w-0+deb11u1_amd64.deb
# rm libssl1.1_1.1.1w-0+deb11u1_amd64.deb
# # ---
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl status mongod
sudo systemctl enable mongod


# Python
sudo apt-get install -y python3 python3-pip






# # To run on host
# kitten ssh root@<ip>
# mongodump --db spotify --out /spotify-mongodb-dump
# scp -6 -r ./spotify-mongodb-dump/ root@[...ip...]:/root/spotify-mongodb-dump

# # Once the above commands are ran
# cd $HOME/spotify-mongodb-dump
# mongorestore --db spotify spotify/

