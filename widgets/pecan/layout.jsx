// const command = 'sysctl -n vm.loadavg hw.ncpu';
// const refreshFrequency = 10000

// const render = ({output, error}) => {
//     if (output.length === 0) {
//         return false;
//     }

//     output = output.split('\n');
//     const ncpu = parseInt(output[1], 10);
//     const load = output[0].replace('{ ', '').replace(' }', '').split(' ');
//     const load_class = [
//         { ['class']: getClass(load[0], ncpu) },
//         { ['class']: getClass(load[1], ncpu) },
//         { ['class']: getClass(load[2], ncpu) },
//     ];


//     return (
//         <div class='screen'>
//             <div class="pecanload">
//                 ◇ <span { ...load_class[0] }>{load[0]} </span>
//                 <span { ...load_class[1] }>{load[1]} </span>
//                 <span { ...load_class[2] }>{load[2]}</span>
//             </div>
//         </div>
//     )
// };

// const getClass = (load, ncpu) => {
//     console.log(load, ncpu);
//     if (load >= ncpu) {
//         return 'heavy';
//     } else if (load >= ncpu / 2) {
//         return 'moderate';
//     } else {
//         return 'light';
//     }
// };

// const command = '/usr/local/bin/yabai -m config layout';
const command = 'if [[ $(/usr/local/bin/yabai -m config layout) == \'bsp\' ]]; then echo "​ bsp ​"; else echo "float"; fi'
const refreshFrequency = 10000; // ms

// added zero width characters + spaces in bsp to pad it
const render = ({ output }) => <div class='screen'><div class='holder'><div class="yabailayout"> ​ ​{`${output}`}</div></div></div>;

export { command, refreshFrequency, render };
