set -gx XDG_CONFIG_HOME "$HOME/.config"

# Path
eval (opam env)
fish_add_path -g "$HOME/.local/bin/"
fish_add_path -g "$HOME/.cargo/bin/"

fish_add_path -g "$HOME/Documents/dotfiles/bin/"
fish_add_path -g "$HOME/Documents/isabelle/isabelle/bin/"

fish_add_path -g "$HOME/.local/texlive/2024/bin/x86_64-linux/"
set -gx MANPATH $MANPATH "$HOME/.local/texlive/2024/texmf-dist/doc/man/"
set -gx INFOPATH $INFOPATH "$HOME/.local/texlive/2024/texmf-dist/doc/info/"

# gpg-agent SSH stuff
# this is device specific as it looks rather different on windows
set -gx SSH_AGENT_PID
set -gx SSH_AUTH_SOCK "$(gpgconf --list-dirs agent-ssh-socket)"

# for some reason the arch helix package doesn't add an hx command
alias hx helix

function ipad
    if systemctl is-active --quiet avahi-daemon
        echo "avahi-daemon is already running"
    else
        echo "starting avahi-daemon"
        sudo systemctl start avahi-daemon
        # for some reason we have to wait a second
        # otherwise it just doesn't work
        sleep 1
    end
    # avdec disables hardware decoding
    # probably because nvidia sucks or something
    # but it breaks without it
    uxplay -avdec
end
