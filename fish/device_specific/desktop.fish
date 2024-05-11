# Path
eval (opam env)
fish_add_path -g "$HOME/.local/bin/"
fish_add_path -g "$HOME/.cargo/bin/"
fish_add_path -g "$HOME/.nimble/bin/"
fish_add_path -g "$HOME/.dotnet/tools/"

# fish_add_path -g "$HOME/Documents/isabelle/isabelle-emacs/bin/"
fish_add_path -g "$HOME/Documents/isabelle/isabelle-git/bin/"
fish_add_path -g "$HOME/Documents/odin/Odin/"
fish_add_path -g "$HOME/.local/share/coursier/bin/"

function animemode
    switch $argv[1]
    case on
        hyprctl --batch "keyword monitor HDMI-A-2,3840x2160@60,0x0,2,bitdepth,10; keyword monitor DP-2,disable; keyword monitor HDMI-A-1,disable; keyword workspace name:DP-2_1,persistent:false; keyword workspace name:DP-2_2,persistent:false; keyword workspace name:DP-2_3,persistent:false; keyword workspace name:HDMI-A-1_1,persistent:false; keyword workspace name:HDMI-A-1_2,persistent:false; keyword workspace name:HDMI-A-1_3,persistent:false;"
    case off
        hyprctl reload
    end
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
