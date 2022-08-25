/* const command = 'wifiname="$(networksetup -getairportnetwork en0 | sed -n 1p | cut -c 24-)"; \
                 if [[ $wifiname != "with an AirPort network." ]]; then echo $wifiname;      \
                 else echo "Disconnected :(";                                                \
                 fi'; */

const command = "/usr/local/bin/bash pecan/scripts/wifi";

const refreshFrequency = 10000; // ms

const render = ({ output }) => <div class='screen'><div class='pecanwifi'>{`${output}`}</div></div>;

export { command, refreshFrequency, render };
