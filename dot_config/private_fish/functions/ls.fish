# Defined in - @ line 1
function ls --wraps='lsd --icon-theme fancy' --description 'alias ls lsd --icon-theme fancy'
  lsd --icon-theme fancy $argv;
end
