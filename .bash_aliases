# Defaults
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Bash
alias resrc='source ~/.bashrc'
alias quit='exit'
alias sl='ls'
alias cd..='cd ..'
alias xclip='xclip -selection c'

# Git
alias gst='git status'
alias gitst='git status'
alias gd='git diff'
alias gdst='git diff --staged'
alias gbr='git branch'
alias gl='git log'
alias gg='git log --oneline --all --abbrev-commit --graph --decorate --color'

# Rails
alias gibbi='gem install bundler && bundle install && alert "bundle install complete" || alert "Something went wrong!"'
alias railss='rails s'

alias prettyjson='python -m json.tool'

# Dev
alias devchromium1="chromium-browser --disable-web-security --user-data-dir=\"/home/alex/.chrome-dev-data/1\" &"
alias devchromium2="chromium-browser --disable-web-security --user-data-dir=\"/home/alex/.chrome-dev-data/2\" &"
alias devchromium="devchromium1"


capsctrl() {
  pkill xcape
  setxkbmap -option 'caps:ctrl_modifier'
  xcape -e 'Caps_Lock=Escape'
}
capsctrl

# Export some vars for easy use of wmctrl w/ compiz

ZERO=0
IFS='x' read -a dim <<< "`xwininfo -root | grep -oP '(?<=geometry )\w+'`"
WIDTH=${dim[0]}
HEIGHT=${dim[1]}

#### 0 2 4 6 8
#### 1 3 5 7 9
export VP0=$ZERO","$ZERO
export VP1=$ZERO","$HEIGHT
export VP2=$((WIDTH * 1))","$ZERO
export VP3=$((WIDTH * 1))","$HEIGHT
export VP4=$((WIDTH * 2))","$ZERO
export VP5=$((WIDTH * 2))","$HEIGHT
export VP6=$((WIDTH * 3))","$ZERO
export VP7=$((WIDTH * 3))","$HEIGHT
export VP8=$((WIDTH * 4))","$ZERO
export VP9=$((WIDTH * 4))","$HEIGHT
