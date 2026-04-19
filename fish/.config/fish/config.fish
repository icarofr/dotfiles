if status is-interactive
    command -sq zoxide; and zoxide init fish --cmd cd | source
end

set -gx DOCKER_HOST unix:///run/user/(id -u)/docker.sock
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

set mise_shims "$HOME/.local/share/mise/shims"
if test -d $mise_shims
    if not contains $mise_shims $PATH
        set -gx PATH $mise_shims $PATH
    end
end

if command -sq mise
    mise activate fish | source
end
