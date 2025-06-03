if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -g fish_greeting

# Init
starship init fish | source
fzf --fish | source
zoxide init --cmd cd fish | source

