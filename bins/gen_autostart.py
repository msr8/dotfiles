#!/usr/local/bin/python3
from   argparse import ArgumentParser
import os

TEMPLATE = '''\
[Desktop Entry]
# Encoding=UTF-8
# Version=0.9.4
Type=Application
Name={name}
Comment={comment}
Exec=sh -c '{command}'
# OnlyShowIn=XFCE;
# RunHook=0
# StartupNotify=false
# Terminal=false
# Hidden=false
'''


parser = ArgumentParser()
parser.add_argument('name')
parser.add_argument('comment')
parser.add_argument('command')
args   = parser.parse_args()

usr  = os.popen('whoami').read().strip()
text = TEMPLATE.format(**args.__dict__)

os.makedirs(f'/home/{usr}/.config/autostart', exist_ok=True)
with open(f'/home/{usr}/.config/autostart/{args.name}.desktop', 'w') as f:
    f.write(text)


# print(usr)

