# Profile file. Runs on login. Environmental variables are set here.

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Default programs:
export EDITOR="nvim"
export TERMINAL="urxvt"
export BROWSER="firefox"

# Export XDG environmental variables from '~/.config/user-dirs.dirs'
eval "$(sed 's/^[^#].*/export &/g;t;d' ~/.config/user-dirs.dirs)"

# ~/ Clean-up:
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" 
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="$HOME/.config/wget/wgetrc"
export INPUTRC="$HOME/.config/inputrc"
export ZDOTDIR="$HOME/.config/zsh"

# Start graphical server on tty1 if not already running.
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
