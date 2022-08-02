alias py='python3'
alias ls='lsd --icon never'
alias vim='nvim'
alias cls='clear'

alias bro='sudo'
alias daddy='sudo'
alias bitch='sudo'
alias please='sudo'
alias locip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"



# ---------- PS1 ----------
# User
PS1='\[\033[1;37m\] ╭─[\[\033[1;32m\]\u\[\033[1;37m\]]-'
# Hostname
PS1+='[\[\033[1;35m\]\h ($(locip))\[\033[1;37m\]]-'
# Pwd
PS1+='[\[\033[1;34m\]\w\[\033[1;37m\]]\n'
# Final
PS1+=' ╰─[\[\033[1;32m\]\$\[\033[1;37m\]] \[\033[0m\]'

export PS1

