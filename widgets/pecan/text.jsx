const command = "Invalid command so the execution is FAST";
// const command = "./pecan/scripts/localip";
const refreshFrequency = 1000000; // ms, made it so long so that it never refreshes

const render = ({ output }) => <div class='screen'><div class='pecantext'>This is a place holder :){output}</div></div>;

export { command, refreshFrequency, render };

// This is a place holder :)