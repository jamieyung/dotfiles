# Adds `~/.local/bin/` and all subdirectories to $PATH
mkdir -p $HOME/.local/bin >/dev/null 2>&1
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# fnm
eval "`fnm env --multi --use-on-cd --fnm-dir='/$HOME/.config/fnm/'`"
fnm use default > /dev/null

# ~/ Cleanup
[ -f "$HOME/.config/python/pythonrc" ] && export PYTHONSTARTUP="$HOME/.config/python/pythonrc"
# Ensure gnupg folder has correct permissions
mkdir -p $HOME/.config/gnupg >/dev/null 2>&1
find $HOME/.config/gnupg -type f -exec chmod 600 {} \;
find $HOME/.config/gnupg -type d -exec chmod 700 {} \;
export GNUPGHOME="$HOME/.config/gnupg"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="google-chrome-stable"
export FILE="vifm"
export SUDO_ASKPASS="$HOME/.local/bin/tools/dmenupass"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

ZDOTDIR="$HOME/.config/zsh"
