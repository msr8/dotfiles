WALLPAPER="deer 3840x2160.png"

pulseaudio &
dunst &
feh --bg-fill "$HOME/repos/wallpapers/$WALLPAPER" &
picom &
oneko -tofocus &
swhks & pkexec swhkd &
# dockerd &

# For some reason swkhd somtimes turns off the wifi, so fixing that
sleep 1; nmcli radio wifi on &




# DWM statusbar
status () { 
	echo -n "BAT: $(acpi | awk '{print $4}' | sed s/,//) | $(date '+%Y-%m-%d %H:%M:%S')"
}

while :; do
	xsetroot -name "$(status)"
	sleep 1
done
