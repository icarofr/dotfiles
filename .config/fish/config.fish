# Fall back to xterm-256color if terminfo is missing (e.g. SSH into machine without Ghostty terminfo)
if test "$TERM" = "xterm-ghostty"
    if not infocmp "$TERM" >/dev/null 2>&1
        set -gx TERM xterm-256color
    end
end

set -gx EDITOR nano
set -gx VISUAL nano

if status is-interactive
    command -sq zoxide; and zoxide init fish --cmd cd | source
end

set -gx DOCKER_HOST unix:///run/user/(id -u)/docker.sock

for brew_bin in \
    $HOME/.linuxbrew/bin/brew \
    $HOME/.linuxbrew/Homebrew/bin/brew \
    /home/linuxbrew/.linuxbrew/bin/brew \
    /home/linuxbrew/.linuxbrew/Homebrew/bin/brew \
    /opt/homebrew/bin/brew \
    /usr/local/bin/brew
    if test -x $brew_bin
        eval ($brew_bin shellenv fish)
        break
    end
end

set mise_shims "$HOME/.local/share/mise/shims"
if test -d $mise_shims
    if not contains $mise_shims $PATH
        set -gx PATH $mise_shims $PATH
    end
end

if command -sq mise
    mise activate fish | source
end
