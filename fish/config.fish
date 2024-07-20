if status is-interactive
end

set -g fish_greeting

function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end

# should be done first
# to get correct PATH setup
# (like homebrew on MacOS)
# source ~/.config/fish/device_specific/desktop.fish

set -gx EDITOR nvim

# Starship prompt
starship init fish | source
zoxide init fish --cmd d | source

alias ls "eza -la --color=always"
alias eza "eza -la --color=always"
alias exa "exa -la --color=always"

# to fix less not showing colors correctly
alias less "less -R"

alias cat bat
# alias cat lolcat
