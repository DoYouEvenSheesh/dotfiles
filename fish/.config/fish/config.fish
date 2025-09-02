if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -g fish_greeting

# Init
starship init fish | source
fzf --fish | source
zoxide init --cmd cd fish | source

alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to full|percentage"'
alias lzd='lazydocker'

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
