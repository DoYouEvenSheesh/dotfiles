if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    fzf --fish | source
    zoxide init fish | source
    starship init fish | source
    export PATH="$PATH:/opt/nvim-linux64/bin"
end

fish_add_path /home/poseidon/.spicetify
