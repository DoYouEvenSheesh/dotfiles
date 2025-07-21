if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -g fish_greeting

# Init
starship init fish | source
fzf --fish | source
zoxide init --cmd cd fish | source

alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to full|percentage"'

set -x PYENV_ROOT $HOME/.pyenv
if test -d $PYENV_ROOT/bin
    set -x PATH $PYENV_ROOT/bin $PATH
end
status --is-interactive; and pyenv init - | source
