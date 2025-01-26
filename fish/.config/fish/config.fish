if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /home/poseidon/.spicetify
alias ls "ls --color"
alias wifilist "nmcli device wifi list"
alias Zagreus "nmcli device wifi list && nmcli device wifi connect Zagreus"
alias BITS-STUDENT "nmcli device wifi connect BITS-STUDENT"
alias air "~/go/bin/air"
alias vim "nvim"    
set -U fish_greeting
fzf --fish | source
starship init fish | source
export PATH="$PATH:/opt/nvim-linux64/bin"
zoxide init --cmd cd fish | source
