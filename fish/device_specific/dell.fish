# PATH
eval (opam env)
# fish_add_path -g "$HOME/Documents/isabelle/isabelle-emacs/bin/"
fish_add_path -g "$HOME/Documents/isabelle/isabelle-git/bin/"
fish_add_path -g "$HOME/.local/bin/"
fish_add_path -g "$HOME/.cargo/bin/"
fish_add_path -g "$HOME/.nimble/bin/"

fish_add_path -g "$HOME/Documents/zig/zig-linux-x86_64-0.12.0/"
fish_add_path -g "$HOME/Documents/zig/zls/zig-out/bin"

# gpg-agent SSH stuff
set -gx SSH_AGENT_PID
set -gx SSH_AUTH_SOCK "$(gpgconf --list-dirs agent-ssh-socket)"

alias hx helix
