# asahi uses nix because Fedora's repos are kinda bare
source "$HOME/.nix-profile/etc/profile.d/nix.fish"

# eval (opam env)

fish_add_path -g "$HOME/.cargo/bin/"

fish_add_path -g "/opt/sublime_text/"
fish_add_path -g "/opt/sublime_merge/"
