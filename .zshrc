# git info
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '%11F(%b)%u%c%m'

# set prompt
setopt PROMPT_SUBST
PROMPT_USER_MACHINE='%F{red}┌──(%B%F{green}%n@%m%b%F{red})-'
PROMPT_PATH='[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{red}]'
PROMPT_LINE2=$'\n%F{red}└─%B%F{red}$%b%F{reset} '
PROMPT='${PROMPT_USER_MACHINE}''${PROMPT_PATH}''${vcs_info_msg_0_}''${PROMPT_LINE2}'

# aliases
alias ls="ls -lhG" 
alias grep="grep --color=auto"

# PATH
export PATH="$HOME/Scripts:$PATH"
