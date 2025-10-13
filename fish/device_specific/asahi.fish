source "$HOME/.cargo/env.fish"

set -gx SSH_AGENT_PID
set -gx SSH_AUTH_SOCK "$(gpgconf --list-dirs agent-ssh-socket)"
