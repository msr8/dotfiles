// const command = 'date +\"%a, %b %d\"';
const command = 'date +"%a %d %b | %H:%M"';
const refreshFrequency = 20000; // ms

const render = ({ output }) => <div class='screen'><div class='holder'><div class='pecandate'>{`${output}`}</div></div></div>;

export { command, refreshFrequency, render };
