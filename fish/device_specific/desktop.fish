set -gx XDG_CONFIG_HOME "$HOME/.config"

fish_add_path -g "$HOME/Downloads/node-v20.13.1-linux-x64/bin/"

# Path
eval (opam env)
fish_add_path -g "$HOME/.local/bin/"
fish_add_path -g "$HOME/.cargo/bin/"
fish_add_path -g "$HOME/.nimble/bin/"
fish_add_path -g "$HOME/.dotnet/tools/"

fish_add_path -g "$HOME/.local/share/coursier/bin/"

fish_add_path -g "$HOME/Documents/isabelle/isabelle-language-server/bin/"
fish_add_path -g "$HOME/Documents/odin/Odin/"
fish_add_path -g "$HOME/Documents/git-remote-hg/"

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

            hyprctl --batch "keyword monitor HDMI-A-2,3840x2160@120,0x0,2,bitdepth,10; keyword monitor DP-2,disable; keyword monitor DP-3,disable; keyword workspace name:DP-2_1,persistent:false; keyword workspace name:DP-2_2,persistent:false; keyword workspace name:DP-2_3,persistent:false; keyword workspace name:DP-3_1,persistent:false; keyword workspace name:DP-3_2,persistent:false; keyword workspace name:DP-3_3,persistent:false;"
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
    ~/.config/hypr/desktop/fixmon.fish
end

# Nvidia stuff
set -gx XDG_SESSION_TYPE wayland

set -gx WLR_NO_HARDWARE_CURSORS 1

set -gx GBM_BACKEND nvidia-drm
set -gx __GLX_VENDOR_LIBRARY_NAME nvidia

set -gx LIBVA_DRIVER_NAME nvidia

set -gx __GL_GSYNC_ALLOWED 1
set -gx __GL_VRR_ALLOWED 1
set -gx WLR_DRM_NO_ATOMIC 1

# gpg-agent SSH stuff
# this is device specific as it looks rather different on windows
set -gx SSH_AGENT_PID
set -gx SSH_AUTH_SOCK "$(gpgconf --list-dirs agent-ssh-socket)"

# for some reason the arch helix package doesn't add an hx command
alias hx helix

function uxplay
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
    ~/Documents/uxplay/uxplay -avdec
end
