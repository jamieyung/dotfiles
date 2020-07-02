#!/usr/bin/env sh

[[ -f "$HOME/.config/xprofile" ]] && . $HOME/.config/xprofile
[[ -f "$HOME/.config/xresources" ]] && xrdb -merge -I$HOME $HOME/.config/xresources
[[ -f ~/.config/xmodmap ]] && xmodmap ~/.config/xmodmap

exec bspwm -c $HOME/.config/bspwm/bspwmrc
