const command = "/usr/local/bin/bash pecan/scripts/disk";
const refreshFrequency = 600000; // ms


const render = ({ output }) => <div class='screen'><div class='pecandisk'>/ {`${output}`}</div></div>;


export { command, refreshFrequency, render };
