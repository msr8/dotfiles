# Power (https://hobo.house/2015/12/18/linux-laptop-power-usage-tuning-with-powertop/)
# https://forums.fedoraforum.org/showthread.php?329130-Significant-Battery-Drain-while-Sleeping
# https://discussion.fedoraproject.org/t/how-can-i-increase-battery-life/111601/2
cd ~
sudo dnf install -y tlp powertop
sudo tlp start
sudo powertop --calibrate