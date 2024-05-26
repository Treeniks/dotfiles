set -gx XDG_CONFIG_HOME "$HOME/.config"

# Path
eval (opam env)
fish_add_path -g "$HOME/.local/bin/"
fish_add_path -g "$HOME/.cargo/bin/"

# fish_add_path -g "$HOME/Documents/isabelle/isabelle-emacs/bin/"
# fish_add_path -g "$HOME/Documents/isabelle/isabelle-git/bin/"
