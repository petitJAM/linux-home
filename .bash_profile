[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export PATH=$PATH:/opt/tenforward

export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=" -R"

export PATH=$PATH:/usr/local/android-studio/bin/

# Android
export ANDROID_HVPROTO=ddm
export ANDROID_HOME=/home/alex/.android-sdk
export PATH="$PATH:$HOME/gradle-2.5/bin"
export PATH="$ANDROID_HOME/tools:$PATH"

# Misc PATH
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:/opt/phantomjs/bin"

### Added by the Heroku Toolbelt (moved here from .bashrc by me)
export PATH="/usr/local/heroku/bin:$PATH"

# KILL THE COW
export ANSIBLE_NOCOWS=1

# Prompt once for passphrase
eval `keychain --eval id_rsa`
