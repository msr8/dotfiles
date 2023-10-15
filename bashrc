# ---------- ALIASES ----------
alias grep='grep --color=auto --ignore-case'
alias nc='netcat'
alias py='python3'
alias pip='pip3'
alias ls='lsd'
alias cd='z'
alias rm='trash-put'
alias cat='bat --paging=never --style=plain'
alias cr='clangrun'
alias vim='nvim'
alias cls='clear'
alias bro='sudo'
alias daddy='sudo'
alias bitch='sudo'
alias please='sudo'
alias tree='ls --tree'
alias locip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias sshserv='ssh mark@139.59.52.224'
alias hideicons='defaults write com.apple.finder CreateDesktop false; killall Finder'
alias showicons='defaults write com.apple.finder CreateDesktop true;  killall Finder'
alias pypiupload="rm -r dist; py setup.py sdist bdist_wheel; twine upload dist/*"
alias pdfcombine="gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=merged.pdf"
alias pipupgrade="pip freeze | awk -F \"==\" '{ print $1 }' > temp.txt; pip install -r temp.txt --upgrade; rm temp.txt"



# ---------- PS1 ----------
# User
PS1='\[\033[1;97m\] ╭─[\[\033[1;92m\]\u\[\033[1;97m\]]-'
# Hostname
PS1+='[\[\033[1;95m\]\h ($(locip))\[\033[1;97m\]]-'
# Pwd
PS1+='[\[\033[1;94m\]\w\[\033[1;97m\]]\n'
# Final
PS1+=' ╰─[\[\033[1;92m\]\$\[\033[1;97m\]] \[\033[0m\]'

export PS1



# ---------- EXPORTS ----------
export EDITOR=nvim



# ---------- JUPYTER ----------
export PYDEVD_DISABLE_FILE_VALIDATION=1
# ---------- MAMBA ----------
# conda init "$(basename "${SHELL}")"
# ---------- ZOXIDE ----------
eval "$(zoxide init bash)"
# ---------- BLESH ----------
source ~/.local/share/blesh/ble.sh
# ---------- FUCK ----------
eval "$(thefuck --alias)"
# ---------- SPICETIFY ----------
export SPICETIFY_INSTALL="/Users/mark/.spicetify"
export PATH="$PATH:/Users/mark/.spicetify"
