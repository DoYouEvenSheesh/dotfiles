if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -g fish_greeting

# Init
starship init fish | source
fzf --fish | source
zoxide init --cmd cd fish | source

alias vim='nvim'


# Hermes Agent — ensure ~/.local/bin is on PATH
fish_add_path "$HOME/.local/bin"

# opencode
fish_add_path /home/poseidon/.opencode/bin


# Added by Antigravity CLI installer
set -gx PATH "/home/poseidon/.local/bin" $PATH

# pnpm
set -gx PNPM_HOME "/home/poseidon/.local/share/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
  set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end

# mimocode
fish_add_path /home/poseidon/.mimocode/bin


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/poseidon/.opam/opam-init/init.fish' && source '/home/poseidon/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
