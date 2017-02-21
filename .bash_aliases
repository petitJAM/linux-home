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
alias showpath='echo $PATH | sed s/:/\\n/g'

# Git
alias gcm='git checkout master'
alias gst='git status'
alias gs='git status'
alias gd='git diff'
alias gdst='git diff --staged'
alias gbr='git branch'
alias grpo='git remote prune origin'
alias gaa='git add --a'
alias gfmm='git fetch; git merge --ff-only master origin/master'
alias glb='git cherry -v master'

# Rails
alias gibbi='gem install bundler && bundle install && alert "bundle install complete" || alert "Something went wrong!"'
alias railss='rails s'
alias berrl='bundle exec rake routes | less'
alias berc='bundle exec rails console'
alias bex='bundle exec '
alias dbreset='rake db:drop && rake db:create && rake db:migrate && rake db:reset'
alias rdbrm='rake db:rollback && rake db:migrate'

# npm
alias npm-exec='PATH=$(npm bin):$PATH'

# Android
alias adbks='adb kill-server; sudo adb start-server; adb devices'
alias adbstack='adb shell dumpsys activity | less -p "ACTIVITY MANAGER ACTIVITIES"'

# Misc
alias prettyjson='python -m json.tool'
alias tmuxa='tmux attach -t'

# Dev
alias devchromium1="chromium-browser --disable-web-security --user-data-dir=\"/home/alex/.chrome-dev-data/1\" &"
alias devchromium2="chromium-browser --disable-web-security --user-data-dir=\"/home/alex/.chrome-dev-data/2\" &"
alias devchromium="devchromium1"

rvmset() {
  if [[ -f ".ruby-version" && -f ".ruby-gemset" ]]; then
    GEMSET="$(cat .ruby-version)@$(cat .ruby-gemset)"
    echo "Running: rvm use $GEMSET"
    rvm use $GEMSET
  else
    echo "No .ruby-version or .ruby-gemset files found in current directory"
  fi
}

capsctrl() {
  pkill xcape
  setxkbmap -option 'caps:ctrl_modifier'
  xcape -e 'Caps_Lock=Escape'
}
capsctrl

eval $(thefuck --alias)
eval $(thefuck --alias ugh)

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
