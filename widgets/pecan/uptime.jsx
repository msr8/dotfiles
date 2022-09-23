// const command = "Invalid command so the execution is FAST";
const command = "./pecan/scripts/uptime";
const refreshFrequency = 30000; // ms, made it so long so that it never refreshes

const render = ({ output }) => <div class='screen'><div class='uptime'> {`${output}`}</div></div>;

export { command, refreshFrequency, render };

// This is a place holder :)