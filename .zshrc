# enable git branchs (Note:  requires a dev font. I use FiraCode with nerd-fonts patch)
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:git:*' formats ' %11F( %b)%f'

# set prompt
setopt PROMPT_SUBST
export PS1='%B%40F%n@%m%f:%31F%2~%f${vcs_info_msg_0_} \$ %b'

# OSX Specific
if [ $(uname) = "Darwin" ]
then
    alias ls="ls -lhGt"
    alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
    
# Linux Specific
else
    alias ls="ls --color=auto"
fi

# Same for OSX and Linux
alias grep="grep --color=auto"
