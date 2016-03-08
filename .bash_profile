
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export PATH=$PATH:/opt/tenforward

export LESS="-R"

# Magic CapsLock = Ctrl/Esc
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
