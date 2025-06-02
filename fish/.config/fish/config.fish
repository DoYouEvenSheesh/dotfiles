if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -U fish_greeting
alias ls "ls --color"
alias vim "nvim"
fzf --fish | source
starship init fish | source
zoxide init --cmd cd fish | source
alias ros "distrobox enter ros"
alias icat "kitten icat"
bass  source /usr/lib64/ros2-jazzy/setup.bash
