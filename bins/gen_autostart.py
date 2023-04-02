from   argparse import ArgumentParser
import os

TEMPLATE = '''\
[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name={name}
Comment={comment}
Exec={command}
# OnlyShowIn=XFCE;
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false
'''


parser = ArgumentParser()
parser.add_argument('name')
parser.add_argument('comment')
parser.add_argument('command')
args   = parser.parse_args()

usr  = os.popen('whoami')
text = TEMPLATE.format(**args.__dict__)

with open(f'/home/{usr}/.config/autostart/{args.name}.desktop') as f:
    f.write(text)




