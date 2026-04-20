function ls --wraps=eza --description 'alias ls=eza --group-directories-first'
  eza --group-directories-first $argv
end
