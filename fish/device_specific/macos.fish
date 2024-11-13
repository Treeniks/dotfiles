# PATH setup
# The reason I do this here instead of using universal variables
# is to have better control over the order

# brew notices when it is called from fish
# and gives the correct output accordingly
/opt/homebrew/bin/brew shellenv | source
# additionally added to ensure homebrew installed stuff
# comes before things in /usr/bin/ (e.g. python)
fish_add_path -g "$(brew --prefix)/bin" "$(brew --prefix)/sbin"

# to have python and not just python3 on PATH
fish_add_path -g "$(brew --prefix python)/libexec/bin"

# Opam
eval (opam env)
# MacOS comes with bison preinstalled, but I want to use brew's bison
fish_add_path -g "/opt/homebrew/opt/bison/bin"

# if homebrew's gcc or clang are needed
fish_add_path -g "$(brew --prefix llvm)/bin"

fish_add_path -g "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
fish_add_path -g "$HOME/.cargo/bin"
fish_add_path -g "$HOME/.nimble/bin"
fish_add_path -g "$HOME/.ghcup/bin"
fish_add_path -g "$HOME/.dotnet/tools"

fish_add_path -g "$HOME/Documents/dotfiles/bin/"
fish_add_path -g "$HOME/Documents/isabelle/isabelle/bin/"
fish_add_path -g "$HOME/Documents/git-remote-hg/"

fish_add_path -g "$HOME/Documents/zig/zig-macos-aarch64-0.12.0-dev.1769+bf5ab5451"
fish_add_path -g "$HOME/Documents/zig/zls/zig-out/bin"
fish_add_path -g "$HOME/Documents/vale/Vale-Mac-0.2.0.28"

fish_add_path -g "$HOME/Library/Application Support/Coursier/bin"

# texlive
set -gx MANPATH $MANPATH "/usr/local/texlive/2024/texmf-dist/doc/man"
set -gx INFOPATH $INFOPATH "/usr/local/texlive/2024/texmf-dist/doc/info"
fish_add_path -g "/usr/local/texlive/2024/bin/universal-darwin"

# Launch GPG Agent
gpgconf --launch gpg-agent

# Set GPG Agent as SSH Agent
set -gx SSH_AGENT_PID ""
set -gx SSH_AUTH_SOCK "$(gpgconf --list-dirs agent-ssh-socket)"

set -gx HOMEBREW_NO_AUTO_UPDATE 1

# start window manager
# (not needed, as it's started as a MacOS Login Item)
# yabai --start-service
# skhd --start-service
