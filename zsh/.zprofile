for brew_bin in \
  /home/linuxbrew/.linuxbrew/bin/brew \
  /home/linuxbrew/.linuxbrew/Homebrew/bin/brew \
  /opt/homebrew/bin/brew \
  /usr/local/bin/brew
do
  if [ -x "$brew_bin" ]; then
    eval "$("$brew_bin" shellenv)"
    break
  fi
done
