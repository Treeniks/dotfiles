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

function animemode
    switch $argv[1]
        case on
            # kill gammastep
            set pid (pgrep gammastep)

            if test -n $pid
                kill $pid
                echo "Gammastep stopped"
            else
                echo "Gammastep not running"
            end

            hyprctl --batch "
                keyword monitor HDMI-A-2,3840x2160@120,0x0,2,bitdepth,10;
                keyword monitor DP-3,disable;
                keyword monitor DP-2,disable;
                keyword workspace name:DP-3_1,persistent:false;
                keyword workspace name:DP-2_1,persistent:false;
            "
        case off
            # `2>&1` redirects stderr to stdout
            # `> /dev/null` to suppress output
            gammastep -O 4000 > /dev/null 2>&1 &
            disown $last_pid

            echo "Gammastep started"

            hyprctl reload
    end
end

function fixmon
    ~/.config/hypr/desktop/fix_mon.fish
end

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
