# Enable syntax highlighting
# bleopt highlight_syntax=zsh-syntax-highlighting
# bleopt highlight_syntax=fish
# bleopt highlight_syntax=1

# Disable syntax highlighting
# bleopt highlight_syntax=

# Disable auto complete
# bleopt complete_auto_complete=

# Disable error exit marker like "[ble: exit %d]"
bleopt exec_errexit_mark=

# Case insensitive autocompletion
bind 'set completion-ignore-case on'

# https://github.com/akinomyoga/ble.sh/issues/192#issuecomment-1116884572
bleopt canvas_winch_action=redraw-prev
