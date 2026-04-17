function tree --wraps=eza --description 'alias tree=eza --tree --git-ignore --group-directories-first'
  eza --tree --git-ignore --group-directories-first $argv
end
