# Fusuma
sudo gpasswd -a $USER input
newgrp input
sudo dnf install -y libinput
gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled