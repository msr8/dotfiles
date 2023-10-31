oneko -tofocus &
swhks & pkexec swhkd &

# For some reason swkhd turns off the wifi, so fixing that
sleep 1; nmcli radio wifi on &




# DWM statusbar
status () { 
	echo -n "BAT: $(acpi | awk '{print $4}' | sed s/,//) | $(date '+%Y-%m-%d %H:%M:%S')"
}

while :; do
	xsetroot -name "$(status)"
	sleep 1
done
