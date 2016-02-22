# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Last space is important; it tells bash to keep looking for aliases in what follows
alias sudo='sudo '

alias resrc='source ~/.bashrc'
alias quit='exit'

# Custom aliases
alias sl='ls'
alias cd..='cd ..'
alias xclip='xclip -selection c'

alias gst='git status'
alias gitst='git status'
alias gd='git diff'
alias gdst='git diff --staged'
alias gbr='git branch'
alias gl='git log'
alias gg='git log --oneline --all --abbrev-commit --graph --decorate --color'

alias gibbi='gem install bundler && bundle install && alert "bundle install complete" || alert "Something went wrong!"'
alias railss='rails s'

alias prettyjson='python -m json.tool'

alias devchromium1="chromium-browser --disable-web-security --user-data-dir=\"/home/alex/.chrome-dev-data/1\" &"
alias devchromium2="chromium-browser --disable-web-security --user-data-dir=\"/home/alex/.chrome-dev-data/2\" &"
alias devchromium="devchromium1"

export PS1='\[\e[0;34m\]\W$(__git_ps1 " \[\e[0;36m\]-> \[\e[0;32m\]%s\[\e[m\]")\[\e[0;33m\]$\[\e[m\] '

#export PS1='\[\033]0;\w\007\]┌─[\[\033[01;32m\]\u\[\033[00m\]][\[\e[0;32m\]\h\[\e[0m\]][\[\e[0;36m\]\w\[\e[0m\]]\n└─▪'

export PATH="$PATH:/opt/tenforward"
export PATH="$PATH:$HOME/gradle-2.5/bin"

export SECRET_KEY_BASE="48d0d06daf0fa1bbfac24be82adb5a495289941004e4b675fe86edad45374dac257a76881f0d05518b02575e1d0ff486670bd7f8d6b552ec979e36933d444cb8"

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/bin"

# Magic CapsLock = Ctrl/Esc
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'
