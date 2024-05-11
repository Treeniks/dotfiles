if status is-interactive
end

set -g fish_greeting

function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end

set -gx EDITOR nvim

# Starship prompt
starship init fish | source
zoxide init fish --cmd d | source

alias ls "exa -la"
alias exa "exa -la"

alias cat "bat"

source ~/.config/fish/device_specific/desktop.fish
