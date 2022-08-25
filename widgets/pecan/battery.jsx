const command = "/usr/local/bin/bash pecan/scripts/battery";
const refreshFrequency =30000; // ms

const render = ({ output }) => <div class='screen'><div class='pecanbattery'>{`${output}`}</div></div>;

export { command, refreshFrequency, render };
