# Power (https://hobo.house/2015/12/18/linux-laptop-power-usage-tuning-with-powertop/)
cd ~
sudo dnf install -y tlp powertop
sudo tlp start
sudo powertop --calibrate