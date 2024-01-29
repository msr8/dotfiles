fusuma --daemon &
skippy-xd --start-daemon &
dunst &
picom &
oneko -tofocus &
swhks & pkexec swhkd &
activate-linux -x 287 -y 80 -m "Go to settings to activate linux" &
# dockerd &

# For some reason swkhd somtimes turns off the wifi, so fixing that
sleep 1; nmcli radio wifi on &