# Defined in - @ line 1
function kali --wraps='docker run --tty --interactive kalilinux/kali-rolling /bin/bash' --description 'alias kali docker run --tty --interactive kalilinux/kali-rolling /bin/bash'
  docker run --tty --interactive kalilinux/kali-rolling /bin/bash $argv;
end
