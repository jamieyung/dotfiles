# Set up shortcuts locations
[[ ! -f $HOME/.config/shortcutrc ]] && shortcuts >/dev/null 2>&1

# Start X server
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 && ! -n "$SSH_CONNECTION"  ]]; then
  exec startx
fi
