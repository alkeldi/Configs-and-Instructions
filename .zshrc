#Version control
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'

#Prompt
setopt prompt_subst
autoload -U colors && colors
green="%{$fg[green]%}"
blue="%{$fg[blue]%}"
yellow="%{$fg[yellow]%}"
no_color="%{$reset_color%}"
PS1="$green%n@%m$no_color:$blue%~$yellow\$vcs_info_msg_0_$no_color$ "

#Aliases
alias ls="ls -lthG" #OSX

