export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0

export EDITOR="/usr/bin/nvim"
export MANPAGER='less -s -M +Gg'
export TERMINAL='alacritty'
export CHROME_BIN='/bin/brave'
export FZF_DEFAULT_OPTS='--color 16'

export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export ANDROID_HOME="$XDG_DATA_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export XINITRC="$XDG_CONFIG_HOME/X1/xinitrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
