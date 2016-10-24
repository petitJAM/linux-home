
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export PATH=$PATH:/opt/tenforward

export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=" -R"

export PATH=$PATH:/usr/local/android-studio/bin/

export ANDROID_HVPROTO=ddm
